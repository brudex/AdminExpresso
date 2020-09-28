using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class TaskFlowItem
    {
        public TaskFlowItem(){}
        public TaskFlowItem(TaskFlowItem flow)
        {
            id =flow.id;
            supportTaskFlowId =flow.supportTaskFlowId;
            controlName = flow.controlName;
            flowItemType = flow.flowItemType;
            flowData =flow.flowData;
            flowGroup = flow.flowGroup; //beforeRender, clientRender,serverPost
        }

        public int id { get; set; }
        public int supportTaskFlowId { get; set; }
        public string controlName { get; set; }
        public string description { get; set; }
        public string flowItemType { get; set; }
        public string flowData { get; set; }
        public string flowGroup { get; set; }

        public virtual TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            //No need to implement overriden by child classes
            return null;
        } 

        public static TaskFlowItem CreateTaskFlow(JToken jTaskFlow,string flowGroup)
        {
            var taskFlow = new TaskFlowItem();
            taskFlow.flowItemType = jTaskFlow["flowItemType"].ToStringOrEmpty();
            taskFlow.controlName = jTaskFlow["controlName"].ToStringOrEmpty();
            taskFlow.description = jTaskFlow["description"].ToStringOrEmpty();
            taskFlow.flowData = jTaskFlow["data"].ToStringOrEmpty();
            taskFlow.flowGroup = flowGroup;
            return taskFlow;
        }


      
        
    }
}
