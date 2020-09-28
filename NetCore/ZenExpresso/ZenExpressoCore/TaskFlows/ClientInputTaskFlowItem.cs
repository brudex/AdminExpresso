using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class ClientInputTaskFlowItem : TaskFlowItem
    {
        public ClientInputTaskFlowItem(TaskFlowItem flowItem):base(flowItem)
        {}

        public List<ScriptParameter> GetClientInputs()
        {
            throw new NotImplementedException();
        }
    }
}
