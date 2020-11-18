using System;
using System.Collections.Generic;
using System.Text;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    interface ITaskExecutor
    {
        TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence);

    }
}
