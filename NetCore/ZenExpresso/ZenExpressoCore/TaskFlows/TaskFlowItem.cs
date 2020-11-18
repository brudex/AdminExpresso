using System.Collections.Generic;
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
            controlName = flow.controlName; //variable Name given to controls should be valid variable
            flowItemType = flow.flowItemType;
            flowData =flow.flowData;
            description = flow.description;
            controlIdentifier =flow.controlIdentifier;
            flowGroup = flow.flowGroup; //beforeRender, clientRender,postAction,clientResult
        }

        public int id { get; set; }
        public int supportTaskFlowId { get; set; }
        public string controlName { get; set; }
        public string controlIdentifier { get; set; }
        public string description { get; set; }
        public string flowItemType { get; set; }
        public string flowData { get; set; }
        public string flowGroup { get; set; }

        

        public static TaskFlowItem CreateTaskFlow(JToken jTaskFlow,string flowGroup)
        {
            var taskFlow = new TaskFlowItem();
            taskFlow.flowItemType = jTaskFlow["flowItemType"].ToStringOrEmpty();
            taskFlow.controlName = jTaskFlow["controlName"].ToStringOrEmpty();
            taskFlow.controlIdentifier = jTaskFlow["controlIdentifier"].ToStringOrEmpty();
            taskFlow.description = jTaskFlow["description"].ToStringOrEmpty(); 
            taskFlow.flowData = jTaskFlow["data"].ToStringOrEmpty();
            taskFlow.flowGroup = flowGroup;
            return taskFlow;
        }


      
        
    }
}
