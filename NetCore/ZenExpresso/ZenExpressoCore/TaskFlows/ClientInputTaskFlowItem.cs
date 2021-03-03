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

        public ClientInputTaskFlowItem(string queryData)
        {
            Console.WriteLine("The query data is >>>",queryData);
            if(_clientInputs==null){
                    _clientInputs=new List<ScriptParameter>();
            }
            if(!string.IsNullOrEmpty(queryData)){
                var jobject = JObject.Parse(queryData);
                foreach(var kv in jobject){
                    var sc = new ScriptParameter(){parameterLabel="",parameterType="text",parameterName=kv.Key,parameterValue=(string)kv.Value};
                    _clientInputs.Add(sc);
                }
            }
        }

        public List<ScriptParameter> GetClientInputs()
        {
            return _clientInputs;
        }
    }
}
