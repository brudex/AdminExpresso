using System;
using System.Collections.Generic;
using System.Text;
using Jint;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class JavascriptTaskFlowItem : TaskFlowItem, ITaskExecutor
    {
        public JavascriptTaskFlowItem(TaskFlowItem flowItem) : base(flowItem)
        {}

        public TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            var result =new TaskFlowResult();
            StringBuilder sb = new StringBuilder();
            var clientInputs = inputList.ToJobject();
            var funcName = description.ToFunctionName();
            sb.Append("function " + funcName);
            sb.Append("(clientInputs, resultSequence)");
            sb.Append("{");
            sb.Append(flowData);
            sb.Append("}");
            var engine = new Engine();
            var add = engine.Execute(sb.ToString()).GetValue(funcName);
            try
            {
                var output = add.Invoke(clientInputs.ToString(), resultSequence.ToJsonString());
                result.data= output.ToString();
                result.status = "00";

            }
            catch (Exception ex)
            {

                result.message = ex.Message+"..\n"+ex.InnerException;
                result.status = "03";
            }

            return result;
        }
    }
}
