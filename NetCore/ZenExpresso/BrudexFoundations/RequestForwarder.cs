using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace BrudexFoundations
{
    public class RequestForwarder
    {
        
        public static ServiceResponse ForwardJsonPostRequest(string json,string url,string apiKey)
        {
            RestPostResponse response;
            if (!string.IsNullOrEmpty(apiKey))
            {
               
                response = RestHandler.Instance.AddJsonHeaders().SetApiKey(apiKey).DoPostGetString( url, json);
            }
            else
            {
                 response = RestHandler.Instance.AddJsonHeaders().DoPostGetString( url, json);
            }
            var serviceResponse = new ServiceResponse();
            serviceResponse.status = "07";
            serviceResponse.message = "Error reaching service";
            if (response.Status == HttpStatusCode.OK)
            { 
                try
                {
                  serviceResponse =   JsonConvert.DeserializeObject<ServiceResponse>(response.content);
                }
                catch (Exception ex)
                {
                    serviceResponse.message = ex.Message;
                     Logger.Error(typeof(RequestForwarder),"Error in forward request >>>",ex);
                }
               
            }
            Logger.Info(typeof(RequestForwarder),"Response from forwarded request >>"+serviceResponse.ToJsonString());
            return serviceResponse;

        }
    }
}
