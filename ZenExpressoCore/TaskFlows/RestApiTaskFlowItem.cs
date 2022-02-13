using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
   public class RestApiTaskFlowItem : TaskFlowItem, ITaskExecutor
    {
        
       public RestApiTaskFlowItem(TaskFlowItem flowItem) : base(flowItem)
       { 
       }
          
        public  TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            var response = new TaskFlowResult();
            response.flowItemType = flowItemType;
            response.description = description;
            response.controlIdentifier = controlIdentifier;

            flowData = TaskFlowUtilities.InterpolateParamsRest(flowData, inputList,"\\\"");
            if (resultSequence.Any())
            {
                List<PlaceHolder> placeHolders = TaskFlowUtilities.ExtractPlaceHolders(flowData);
                flowData = TaskFlowUtilities.InterpolateSequenceParams(flowData, placeHolders, resultSequence); 
            }
            var jsonFlowData = JObject.Parse(flowData);
            JArray headers = (JArray)jsonFlowData["headers"];
            string restUrl = jsonFlowData["resturl"].ToStringOrEmpty();
            string method = jsonFlowData["method"].ToStringOrEmpty();
            string contentType = jsonFlowData["contentType"].ToStringOrEmpty();
            var restHandler = RestHandler.Instance;
            foreach (var jToken in headers)
            {
                restHandler.AddCustomHeader(jToken["headerKey"].ToStringOrEmpty(), jToken["headerValue"].ToStringOrEmpty());
            }
            RestPostResponse restResponse = null;
            if (jsonFlowData["method"].ToStringOrEmpty() != "GET")
            {
                var requestBody = jsonFlowData["body"].ToStringOrEmpty();
                restResponse= restHandler.DoPostGetString(restUrl, requestBody,method,contentType);
            }
            else
            {
                restResponse = restHandler.DoGetString(restUrl);
            }
            
            try
            {

                if (restResponse.IsSuccessStatus())
                {
                    response.status = "00";
                    if (restResponse.IsArrayResult())
                    {
                        response.data = restResponse.ToJArray();
                    }
                    else
                    {
                        response.data = restResponse.ToJOject();
                    }
                }
                else
                {
                    response.status = "03";
                    response.message = "Error!! Status:"+restResponse.Status + ", Response Content :"+ restResponse.content;
                } 
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
