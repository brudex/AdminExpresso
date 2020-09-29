using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class TransformDataTaskFlowItem : TaskFlowItem
    { 
       
        public TransformDataTaskFlowItem(TaskFlowItem flowItem):base(flowItem)
        { } 

        public new TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            var taskFlowResult = new TaskFlowResult();
            var inputData = resultSequence.Last();
            var tabularData = JArray.FromObject(inputData.data);
            var parsingData = JObject.Parse(flowData);
            var dropColumns = (JArray) parsingData["dropColumns"];
            var transformCode = parsingData["transformCode"].ToStringOrEmpty();
            var list = new JArray();
            for (int i = 0; i < tabularData.Count; i++)
            {
                var jsonObject = tabularData[i];
                if (dropColumns.Any())
                {
                    for (int k = 0; k < dropColumns.Count; k++)
                    {
                        string columName = dropColumns[k].ToStringOrEmpty();
                        jsonObject[columName] = null;
                    }
                }
                if (!string.IsNullOrEmpty(transformCode))
                {
                    string json = TaskFlowUtilities.ExecuteJavascriptCode(transformCode, jsonObject);
                    if (json.Contains("{"))
                    {
                        jsonObject = JObject.Parse(json);
                    } 
                }
                list.Add(jsonObject);
            }
            taskFlowResult.status = "00";
            taskFlowResult.data = list;
            return taskFlowResult;
        }
         

    }
}
