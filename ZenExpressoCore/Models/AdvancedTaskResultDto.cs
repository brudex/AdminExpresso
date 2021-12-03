using System;
using System.Collections.Generic;
using System.Text;
using ZenExpressoCore.TaskFlows;

namespace ZenExpressoCore.Models
{
    public class AdvancedTaskResultDto : ServiceResponse
    {
        public List<TaskFlowItem> taskFlowItems { get; set; }
        public  List<TaskFlowResult> taskFlowResults { get; set; }  
    }
}
