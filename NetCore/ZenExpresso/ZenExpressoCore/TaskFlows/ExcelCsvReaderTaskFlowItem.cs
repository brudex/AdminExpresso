using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using ExcelDataReader;
using Extend;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class ExcelCsvReaderTaskFlowItem : TaskFlowItem, ITaskExecutor
    {
        private List<TaskFlowItem> _taskFlowItems;
        private List<string> errors;
        private int _processedRowsCount;

        public ExcelCsvReaderTaskFlowItem(TaskFlowItem flowItem, ref List<TaskFlowItem> taskFlowItems) : base(flowItem)
        {
            _taskFlowItems = taskFlowItems;
            errors=new List<string>();
        }

        public TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            var response = new TaskFlowResult();
            response.flowItemType = flowItemType;
            response.description = description;
            response.controlIdentifier = controlIdentifier;
            var resultJArray = new JArray();

            flowData = TaskFlowUtilities.InterpolateParams(flowData, inputList, "\\\"");
            if (resultSequence.Any())
            {
                List<PlaceHolder> placeHolders = TaskFlowUtilities.ExtractPlaceHolders(flowData);
                flowData = TaskFlowUtilities.InterpolateSequenceParams(flowData, placeHolders, resultSequence);
            }

            var jsonFlowData = JObject.Parse(flowData);
            JArray columns = (JArray) jsonFlowData["columns"];
            JArray dataProcessors = (JArray) jsonFlowData["dataProcessing"];
            string fileSource = GetFileDataSource(resultSequence,jsonFlowData["fileSource"].ToStringOrEmpty());
            if (string.IsNullOrEmpty(fileSource))
            {
                response.status = "07";
                response.message = string.Join("\n<br/>", errors);
                return response;
            }
            string filePath = fileSource;
            string fileType = jsonFlowData["fileType"].ToStringOrEmpty();
            if (string.IsNullOrEmpty(fileType))
            {
                fileType = "excel";
            }

            var colNameIndex = new Dictionary<int, string>();

            try
            {
                response.status = "00";
                using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
                {
                    // Auto-detect format, supports:
                    //  - Binary Excel files (2.0-2003 format; *.xls)
                    //  - OpenXml Excel files (2007 format; *.xlsx, *.xlsb)
                    int index = 0;
                    using (var reader = ExcelReaderFactory.CreateReader(stream))
                    { 
                            while (reader.Read())
                            {
                                if (index == 0)
                                {
                                    for (var k = 0; k < columns.Count; k++)
                                    {
                                        var headerText = reader.GetValue(k).ToString().Trim();
                                        var column = columns.FirstOrDefault(c =>
                                            c["title"].ToStringOrEmpty().Trim() == headerText);
                                        if (column != null)
                                        {
                                            colNameIndex[k] = column["parameter"].ToStringOrEmpty();
                                        }
                                    }
                                }
                                else
                                {
                                    var jobject = new JObject();
                                    var scriptParameters = new List<ScriptParameter>();
                                    for (var k = 0; k < columns.Count; k++)
                                    {
                                        var value = reader.GetValue(k).ToString();
                                        string fieldName = colNameIndex[k];
                                        jobject[fieldName] = value;
                                       var scriptParameter = new ScriptParameter();
                                       scriptParameter.parameterName = fieldName;
                                       scriptParameter.parameterValue = value;
                                       scriptParameters.Add(scriptParameter);
                                    }
                                    resultJArray.Add(jobject);
                                    foreach (var dataProcessor in dataProcessors)
                                    {
                                        ExecuteTaskFlowItemOnRow(scriptParameters,
                                            dataProcessor["flowName"].ToStringOrEmpty(), resultSequence);
                                    }
                                }
                                index++;
                            }
                    }
                }
                response.data = resultJArray;
                response.message = "Now of rows Processed : " + _processedRowsCount;
                if (errors.Count>0)
                {
                    response.message += "\n<br/>";
                    response.message += string.Join("\n<br/>", errors);
                }
            }
            catch (Exception ex)
            {
                response.status = "07";
                Logger.Error(this, ex);
                response.message = ex.Message;
                response.message += string.Join("\n<br/>", errors);
            }

            return response;
        }

        private void ExecuteTaskFlowItemOnRow(List<ScriptParameter> inputList, string flowName, List<TaskFlowResult> resultSequence)
        { 
            var allowedFlows = new[] {"sqlQuery", "rest", "restApi"};
            var insertTaskFlow = _taskFlowItems.FirstOrDefault(t => t.controlIdentifier == flowName);
            if (insertTaskFlow == null)
            {
                errors.Add(flowName + " not found. Row execution failed"); 
            }
            if (allowedFlows.IndexOf(insertTaskFlow.flowItemType) == -1)
            {
                errors.Add(flowName + " cannot be executed on excel or csv rows. Unsupported flowItem type :" +
                           insertTaskFlow.flowItemType);
            }
            ITaskExecutor flowItem = null;
            switch (insertTaskFlow.flowItemType)
            { 
                case "sqlQuery":
                    flowItem = new SqlTaskFlowItem(insertTaskFlow);
                    break;
                case "rest":
                case "restApi":
                    flowItem = new RestApiTaskFlowItem(insertTaskFlow);
                    break;
            }
            if (flowItem != null)
            {
                var result = flowItem.ExecuteResult(inputList, resultSequence);
                 
                if (result.status != "00")
                {
                    errors.Add(result.message);
                    Logger.Error(this, "There was an error >>" + result.message);
                }
                else
                {
                    _processedRowsCount += 1;
                }
            } 
        }

        private string GetFileDataSource(List<TaskFlowResult> resultSequence,string fileSource)
        {
            var allowedFlows = new[] { "fileUploadServer" };
            var resultItem = resultSequence.FirstOrDefault(t => t.controlIdentifier == fileSource);
            if (resultItem == null)
            {
                errors.Add($"File source ${fileSource} not found. Cannot read file");
                return "";
            }
            if (resultItem.status == "00")
            {
                var files = (List<string>) resultItem.data;
                if (files.Count > 0)
                {
                    return files[0];
                }
            }
            else
            {
                errors.Add("File upload processing failed :"+resultItem.message);
            }
            return "";
        }



    }
}
