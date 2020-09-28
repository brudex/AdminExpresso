using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZenExpressoCore.TaskFlows
{
    public class TaskFlowResult
    {
        public string flowItemType { get; set; }
        public string status { get; set; }
        public string message { get; set; }
        public dynamic data;
    }
}
