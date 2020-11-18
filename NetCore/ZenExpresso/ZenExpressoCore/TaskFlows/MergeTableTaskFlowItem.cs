using System;
using System.Collections.Generic;
using System.Linq;
using Extend;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class MergeTableTaskFlowItem : TaskFlowItem, ITaskExecutor
    {
        private string _dbusername;
        private string _dbPass;
        private string _sqlScript;
        private DataSource _dataSource;
        public MergeTableTaskFlowItem(TaskFlowItem flowItem):base(flowItem)
        {}

         
        private Tuple<List<string>,List<string>> ExtractOperatorsAndTokens(string text)
        {
            string[] opArray =text.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
            var operators = new List<string>();
            var tokens = new List<string>();
            for (int i = 0; i < opArray.Length; i++)
            {
                if (opArray[i] == "&&" || opArray[i] == "||")
                {
                   operators.Add(opArray[i]); 
                } 
            }
            if (operators.Any())
            {
                tokens= text.Split(operators.ToArray(), StringSplitOptions.RemoveEmptyEntries).ToList();
            }
            return new Tuple<List<string>, List<string>>(operators,tokens);
        }

        private Tuple<string,string> GetLeftAndRightFields(string text)
        {
            string[] opArray = text.Split(new string[] { "==" ,"=","(",")"}, StringSplitOptions.RemoveEmptyEntries);
            var rightOperand = opArray[1];
            string rightOperandProperty = rightOperand.Substring(rightOperand.IndexOf(".", StringComparison.Ordinal));
            string leftOperandProperty = opArray[0].Substring(opArray[0].IndexOf(".", StringComparison.Ordinal));
            return new Tuple<string, string>(leftOperandProperty,rightOperandProperty);
        }

        public  TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            var taskFlowResult = new TaskFlowResult();
            JArray jMergingRules = JArray.Parse(flowData);
            dynamic mergingList = new List<dynamic>();
            for (int i = 0; i < jMergingRules.Count; i++)
            {
               
                if (i == 0)
                {
                    var arr = jMergingRules[i].ToStringOrEmpty().Split(new string[] {"="}, StringSplitOptions.RemoveEmptyEntries);
                    var tuple = TaskFlowUtilities.ExtractFlowItemTypeAndIndex(arr[1]);
                    mergingList = GetTaskFlowResultAtIndex(resultSequence, tuple);

                }
                else
                {
                    var operatorsTokens = ExtractOperatorsAndTokens(jMergingRules[i].ToStringOrEmpty());
                    var flowItemTypeAndIndex = TaskFlowUtilities.ExtractFlowItemTypeAndIndex(operatorsTokens.Item2.FirstOrDefault());
                   var rightSequence= GetTaskFlowResultAtIndex(resultSequence, flowItemTypeAndIndex);
                    Func<JObject,JObject,bool> applyFunc = (j1, j2) =>
                    {
                        //Complicated algorithm evaluating merge syntax :
                        //TableResult = (TableResult.firstName = sqlSquery[1].firstName) && (sqlSquery[0].accountNo = sqlSquery[1].accountNo) && (sqlSquery[0].accountNo == sqlSquery[1].accountNo);
                        bool retVal = true;
                        List<string> tokens = operatorsTokens.Item2;
                        List<string> operands = operatorsTokens.Item1;
                         for (int j = 0; j < tokens.Count; j++)
                        {
                            var leftAndRightFields = GetLeftAndRightFields(tokens[j]);
                            var comparison = FieldsEqual(j1[leftAndRightFields.Item1].ToStringOrEmpty(),
                                j2[leftAndRightFields.Item2].ToStringOrEmpty());

                            if (!operands.Any())
                            {
                                return comparison;
                            }
                            else
                            {
                                if (j >= 1)
                                {
                                    if (j-1 < operands.Count )
                                    {
                                        var index = j - 1;
                                        if (operands[index].Equals("&&") || operands[index].Equals("&"))
                                        {
                                            retVal = retVal && comparison;
                                        }
                                        else
                                        {
                                            retVal = retVal || comparison;
                                        }
                                    }
                                }
                                
                            }
                         }
                        
                        return retVal;
                    };
                    mergingList = MergetListByFunc(mergingList, rightSequence, applyFunc);

                }
                    
            }
            taskFlowResult.data = mergingList;
            return taskFlowResult;
        }

        private bool FieldsEqual(string text1, string text2)
        {
            if (text1.IsNullOrEmpty() && text2.IsNullOrEmpty())
            {
                return false;
            }
            if ((text1.IsNullOrEmpty() && !text2.IsNullOrEmpty()) || (!text1.IsNullOrEmpty() && text2.IsNullOrEmpty()))
            {
                return false;
            }
            if (text1.IsNumeric() && text2.IsNumeric())
            {
                return text1.ToDecimal() == text2.ToDecimal();
            }
            if (text1.Equals(text2.Trim(), StringComparison.InvariantCultureIgnoreCase))
            {
                return true;
            }
            return false;
        }

        private static dynamic GetTaskFlowResultAtIndex(List<TaskFlowResult> resultSequence, Tuple<string, int> tuple)
        {
            var mergingList = new List<dynamic>();
            if (tuple.Item1.IsEmpty())
            {
                int index = tuple.Item2;
                var flowResult = resultSequence[index];
                mergingList = flowResult.data;
            }
            else
            {
                var flowResult = resultSequence.Where(r => r.flowItemType == tuple.Item1)
                    .ElementAt(tuple.Item2);
                mergingList = flowResult.data;
            }
            return mergingList;
        }

        private List<JObject> MergetListByFunc(List<dynamic> list1, List<dynamic> list2, Func<JObject,JObject, bool> applyFunc)
        {
            var  result = new List<JObject>();
            for (int j = 0; j < list1.Count; j++)
            {
                var item1 = JObject.FromObject(list1[j]);
                for (int i = 0; i < list2.Count; i++)
                {
                    var item2 = JObject.FromObject(list2[j]);
                    if (applyFunc(item1, item2))
                    {
                        item1.Merge(item2, new JsonMergeSettings()
                        {
                            MergeArrayHandling = MergeArrayHandling.Union
                        });
                        result.Add(item1);
                    }
                    else
                    {
                        result.Add(item1);
                    }
                }
            }
            return result;
        }
    }
}
