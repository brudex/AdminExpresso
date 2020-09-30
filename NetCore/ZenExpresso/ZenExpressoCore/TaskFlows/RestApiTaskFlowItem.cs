using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
 
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
   public class RestApiTaskFlowItem : TaskFlowItem
   {
       

       public RestApiTaskFlowItem(TaskFlowItem flowItem) : base(flowItem)
       { 
       }


       

        public new TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {

            flowData = TaskFlowUtilities.InterpolateParams(flowData, inputList);
            if (resultSequence.Any())
            {
                List<PlaceHolder> placeHolders = TaskFlowUtilities.ExtractPlaceHolders(flowData);
                flowData = TaskFlowUtilities.InterpolateSequenceParams(flowData, placeHolders, resultSequence); 
            }
            var jsonFlowData = JObject.Parse(flowData);
            JArray headers = (JArray)jsonFlowData["headers"];
            string restUrl = jsonFlowData["url"].ToStringOrEmpty();
            string requestBody = "";
            var restHandler = RestHandler.Instance;
            foreach (var jToken in headers)
            {
                restHandler.AddCustomHeader(jToken["key"].ToStringOrEmpty(), jToken["value"].ToStringOrEmpty());
            }
            RestPostResponse restResponse = null;
            if (jsonFlowData["method"].ToStringOrEmpty() == "POST")
            {
                requestBody = jsonFlowData["body"].ToStringOrEmpty();
               restResponse= restHandler.DoPostGetString(restUrl, requestBody);
            }
            else
            {
                restResponse = restHandler.DoGetString(restUrl);
            }
            var response = new TaskFlowResult();
            try
            { 
                response.status = "00";
                response.data = restResponse;
            }
            catch (Exception ex)
            {
                response.status = "07";
                Logger.Error(this, ex);
                response.message = ex.Message;
            }
            return response; 

         }

        
    }
}
