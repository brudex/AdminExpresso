using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class ClientInputTaskFlowItem : TaskFlowItem
    {
        private List<ScriptParameter> _clientInputs;
        public ClientInputTaskFlowItem(JObject flowDt)
        {

            dynamic inputFlowItem = (JObject) flowDt.SelectToken("clientResults[0]");
            id = inputFlowItem.id;
            supportTaskFlowId = flowDt["taskId"].ToInteger();
            controlName = inputFlowItem.controlName; //variable Name given to controls should be valid variable
            flowItemType = ((string)inputFlowItem.flowItemType).Replace(".html", "");
            controlIdentifier = inputFlowItem.controlIdentifier;
            flowGroup = inputFlowItem.flowGroups;
            flowData = flowDt.ToString();
            _clientInputs = JsonConvert.DeserializeObject<List<ScriptParameter>>(inputFlowItem.taskResult.ToString());
              
        }

        public List<ScriptParameter> GetClientInputs()
        {
            return _clientInputs;
        }
    }
}
