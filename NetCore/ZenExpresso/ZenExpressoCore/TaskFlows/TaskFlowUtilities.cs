using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;
using Extend;
using Jint;

namespace ZenExpressoCore.TaskFlows
{

    public static class TaskFlowUtilities
    {
        public static JObject ToJobject(this List<ScriptParameter> inputList)
        {
            var obj = new JObject();
            foreach (var scriptParameter in inputList)
            {
                obj[scriptParameter.parameterName] = scriptParameter.parameterValue;
            }
            return obj;
        }

        public static string ToJsonString(this List<TaskFlowResult> flowResults)
        {

            return JsonConvert.SerializeObject(flowResults);

        }


        public static String InterpolateParams(string text, List<ScriptParameter> parameters,string quotes="'")
        {
            foreach (var parameter in parameters)
            {
                var replaceVal = "";
                switch (parameter.parameterType)
                {
                        case "number":
                        replaceVal = parameter.parameterValue;
                        break;
                    case "regex":
                    case "date":
                        replaceVal = quotes + parameter.parameterValue + quotes;
                        break;
                    case "text":
                    case "hidden":
                    case "textarea":
                        replaceVal = quotes + parameter.parameterValue + quotes;
                        break;
                    case "select":
                        replaceVal = quotes + parameter.parameterValue + quotes;
                        break;
                    case "multiselect":
                        List<string> selected = JsonConvert.DeserializeObject<List<string>>(parameter.parameterValue);
                        StringBuilder sb = new StringBuilder();
                        sb.Append($"'{selected.First()}'");
                        for (int i = 1; i < selected.Count; i++)
                        {
                            sb.Append($",'{selected[i]}'");
                        }
                        replaceVal = sb.ToString();
                        break;
                    case "checkbox":
                    {
                        if (string.IsNullOrEmpty(parameter.parameterValue))
                        {
                            replaceVal = "0";
                        }
                        else
                        {
                            replaceVal = parameter.parameterValue == "true" ? "1" : "0";
                        }
                    }
                        break;
                    default:
                        replaceVal = quotes + parameter.parameterValue + quotes;
                        break;
            }
                text = text.Replace("@" + parameter.parameterName, replaceVal);
                text = text.Replace("${" + parameter.parameterName + "}", parameter.parameterValue);
            }

            return text;
        }

        
        /// <summary>
        ///Sequence item 1 {{1->[1].fullName}} item 1 is array so take the second item and get the fullName field 
        ///Sequence item 2 {{0->[2].lastName}} item 1 is array so take the third item and get the fullName field
        ///Last task result item {{[2].lastName}} item is array so take the third item and get the fullName field
        ///Last task result item {{lastName}} item is object so get the fullName field
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static List<PlaceHolder> ExtractPlaceHolders(string text)
        {
             
            var matches= Regex.Matches(text, @"([{{]([\S])+[}]{2})+");
            var list = new List<PlaceHolder>();
            for (int i = 0; i < matches.Count; i++)
            {
                var placeholder =new PlaceHolder();
                placeholder.replaceText = matches[i].Value;
                string innerText = placeholder.replaceText.Split(new string[] { "{{", "}}" },
                    StringSplitOptions.RemoveEmptyEntries).FirstOrDefault();
                if (innerText != null)
                {
                    if (innerText.Contains("->"))
                    {
                        var si = innerText.Split(new string[] {"->"}, StringSplitOptions.RemoveEmptyEntries);
                        if (si[0].IsNumeric())
                        {
                            placeholder.sequenceIndex = si.ToInt32(); 
                        }

                        if (si.Length > 1 && !string.IsNullOrEmpty(si[1]))
                        {
                            var indexField = ExtractItemIndexAndFieldname(si[1]);
                            placeholder.resultIndex = indexField.Item1;
                            placeholder.fieldName = indexField.Item2;
                        }
                    }
                    else if(innerText.Contains("."))
                    {
                        var indexField = ExtractItemIndexAndFieldname(innerText);
                        placeholder.resultIndex = indexField.Item1;
                        placeholder.fieldName = indexField.Item2;
                    }
                    else
                    {
                        placeholder.fieldName = innerText;
                    }
                }
                
                list.Add(placeholder);
            }

            return list;
        }


        /// <summary>
        /// extract index and filedName from a text block of format [index].fieldName e.g [2].lastName,
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static Tuple<int,string> ExtractItemIndexAndFieldname(string text)
        {
            var match = Regex.Match(text, @"\[(?<index>\d+)\]+.(?<field>\S+)");
            string index = match.Groups["index"].Value;
            string field = match.Groups["field"].Value;
            return new Tuple<int, string>(index.ToInt32(),field);
        }

        public static string InterpolateSequenceParams(string sqlScript, List<PlaceHolder> placeholders, List<TaskFlowResult> resultSequence)
        {
            foreach (var placeholder in placeholders)
            {
                if(placeholder.fieldName=="testResult"){
                    Console.WriteLine("The testResult Parameters  >>"+JsonConvert.SerializeObject(placeholder));
                }
                TaskFlowResult sequenceResult= null;
                if (placeholder.sequenceIndex >= 0)
                {
                    sequenceResult = resultSequence[placeholder.sequenceIndex];
                }
                else
                {
                    sequenceResult = resultSequence.LastOrDefault();
                }
                if (sequenceResult != null)
                {
                    JArray resultArray = null;
                    JToken resultObject = null;
                    string fieldValue = string.Empty;
                    if (placeholder.resultIndex >= 0)
                    {
                        try
                        {
                            resultArray = sequenceResult.data as JArray;
                            if (resultArray == null)
                            {
                                resultArray = JArray.Parse(sequenceResult.data.ToString());
                            } 
                            resultObject = resultArray[placeholder.resultIndex];
                            fieldValue = resultObject[placeholder.fieldName].ToStringOrEmpty();
                        }
                        catch (Exception ex)
                        {
                            Logger.Error(typeof(TaskFlowUtilities), "Error getting sequenceResult.data as JArray", ex);
                        }
                    }
                    else
                    {
                        try
                        {

                            if(sequenceResult.status=="00"){
                                 resultObject = JToken.Parse(sequenceResult.data.ToString());
                                fieldValue = resultObject[placeholder.fieldName].ToStringOrEmpty();
                            }
                           
                        }
                        catch (Exception ex)
                        {
                            Logger.Error(typeof(TaskFlowUtilities), "Error getting sequenceResult.data as JToken", ex);
                        } 
                    }
                    sqlScript = sqlScript.Replace(placeholder.replaceText, fieldValue);
                } 
            }

            return sqlScript;
        }

        public static string ExecuteJavascriptCode(string jsCode,JObject jsonArg)
        {

            var result = string.Empty;
            StringBuilder sb = new StringBuilder();
            var funcName = "_func_name_"+DateTime.Now.ToString("yyyyMMDDhhmm");
            sb.Append("function " + funcName);
            sb.Append("(jsonArg)");
            sb.Append("{");
            sb.Append(jsCode);
            sb.Append("}");
            var engine = new Engine();
            var add = engine.Execute(sb.ToString()).GetValue(funcName);
            try
            {
                var output = add.Invoke(jsonArg.ToString());
                result = output.ToString();
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(TaskFlowUtilities),"Error executing js >>",ex);
            }

            return result;
        }

        public static Tuple<string,int> ExtractFlowItemTypeAndIndex(string s)
        {
           var arr1 = s.Split(new string[] {"["}, StringSplitOptions.RemoveEmptyEntries);
            string flowItemType = string.Empty;
            if (arr1.Length >= 2 && arr1.Length >=3)
            {
                flowItemType = arr1[0]; 
            }
            string index = Regex.Match(s, @"\[(?<numbers>[\d,]+)\]").Groups["numbers"].Value;
            if (index.IsNumeric())
            {
                return new Tuple<string, int>(flowItemType, index.ToInt32());
            }
            return new Tuple<string, int>(flowItemType,-1);
        }
    }
}
