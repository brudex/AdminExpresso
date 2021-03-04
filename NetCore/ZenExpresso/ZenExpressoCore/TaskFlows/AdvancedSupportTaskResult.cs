using System;
using System.Collections.Generic;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class AdvancedSupportTaskResult : ServiceResponse
    {
        private List<TaskFlowItem> taskFlowItems;
        private SupportTask _supportTask;
        public List<TaskFlowResult> taskFlowResults { get; set; }
        
        public AdvancedSupportTaskResult(SupportTask supportTask, List<TaskFlowItem> taskFlowItems)
        {
            _supportTask = supportTask;
            taskFlowResults = new List<TaskFlowResult>();
            this.taskFlowItems = taskFlowItems;
        }

        public SupportTask GetSupportTask()
        {
            return _supportTask;
        }
        public  void ExecuteResult(ClientInputTaskFlowItem clientInputTaskFlow=null)
        {

            List<ScriptParameter> inputList = new List<ScriptParameter>();
            if (clientInputTaskFlow != null)
            {
                 inputList = clientInputTaskFlow.GetClientInputs();
            }
            try
            {
                foreach (var taskFlowItem in taskFlowItems)
                {
                    Console.WriteLine("Executing Task >>"+taskFlowItem.controlName+ "-"+taskFlowItem.flowItemType);
                     ITaskExecutor flowItem = null;
                    switch (taskFlowItem.flowItemType)
                    {
                        case "javascriptProcess":
                            flowItem = new JavascriptTaskFlowItem(taskFlowItem);
                            break;
                        case "sqlQuery":
                            flowItem = new SqlTaskFlowItem(taskFlowItem);
                            break;
                        case "rest":
                        case "restApi":
                            flowItem = new RestApiTaskFlowItem(taskFlowItem);
                            break;
                        case "pdfform":
                            flowItem = new PdfFormFillTaskFlowItem(taskFlowItem);
                            break;
                    }
                    if (flowItem != null)
                    {
                        var result = flowItem.ExecuteResult(inputList, taskFlowResults);
                        Console.WriteLine("The Task Result Message >>"+result.message);
                        taskFlowResults.Add(result);
                    }
                }
                status = "00";
                message = "Task Executed Successfully";
            }
            catch (Exception ex)
            {
                status = "07";
                Logger.Error(this, ex);
                message = ex.Message;
            }
        }

    }
}