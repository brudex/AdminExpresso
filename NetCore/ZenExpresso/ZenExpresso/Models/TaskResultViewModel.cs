using System.Collections.Generic;
using ZenExpressoCore.Models;
using ZenExpressoCore.TaskFlows;

namespace ZenExpresso.Models
{
    public class TaskResultViewModel
    {
        public AdvancedSupportTaskResult taskResult { get; set; }
        public SupportTask supportTask { get; set; }
        public List<TaskFlowItem> clientRenderFlows { get; set; }
    }
}
