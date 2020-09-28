using System;
using System.Collections.Generic;
using System.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class AdvancedSupportTaskResult : SupportTaskResult
    {
       
        private List<TaskFlowItem> taskFlowItems;
        private List<TaskFlowResult> taskFlowResults;

        public AdvancedSupportTaskResult(SupportTask task) : base(task)
        {
        }

        public AdvancedSupportTaskResult(SupportTask supportTask, List<TaskFlowItem> taskFlowItems) : base(supportTask)
        {
            taskFlowResults=new List<TaskFlowResult>();
            this.taskFlowItems = taskFlowItems;
        }

        public new void ExecuteResult()
        {
            var inputFlowItem = taskFlowItems.FirstOrDefault(x => x.flowItemType == "inputForm");
             List<ScriptParameter> inputList = new List<ScriptParameter>();
            if (inputFlowItem != null)
            {
                 ClientInputTaskFlowItem clientInputTaskFlow = new ClientInputTaskFlowItem(inputFlowItem);
                 inputList = clientInputTaskFlow.GetClientInputs();
            }
            foreach (var taskFlowItem in taskFlowItems)
            {
                TaskFlowItem flowItem = null;
                switch (taskFlowItem.flowItemType)
                {

                    case "javascriptProcess":
                        flowItem = new JavascriptTaskFlowItem(taskFlowItem);
                        break;
                    case "sqlSquery":
                        flowItem = new SqlTaskFlowItem(taskFlowItem);
                        break;
                    case "restApi":
                        flowItem = new RestApiTaskFlowItem(taskFlowItem);
                        break;
                }
                if (flowItem != null)
                {
                    var result = flowItem.ExecuteResult(inputList, taskFlowResults);
                    taskFlowResults.Add(result);
                }
            }
           
        }

       
    }
}
