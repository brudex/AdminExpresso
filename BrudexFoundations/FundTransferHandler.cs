using System;
using System.Net;
using BrudexFoundations;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using RestSharp.Authenticators;

namespace BrudexFoundations
{
  public  class FundTransferHandler
  {
      private string _ethixServicesUrl;
      private string _apiKey;
      public FundTransferHandler(string ethixServicesUrl, string apiKey)
      {
          _ethixServicesUrl = ethixServicesUrl;
          _apiKey = apiKey;
      }

        public JToken Transfer(string fromAccount, string toAcct, decimal amount, string description, string transReference, bool overdraw = false)
        {
            var client = new RestClient(_ethixServicesUrl);
            Logger.Info(this, "Calling EthixServices url>>" + _ethixServicesUrl);
            var request = new RestRequest("api/Transfer/TransferZenith", Method.POST);
            if (overdraw)
            {
                request = new RestRequest("api/Transfer/TransferZenithOD", Method.POST);
            }
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("API-KEY", _apiKey);
            JToken jToken = JObject.Parse("{}");
            jToken["sourceAccount"] = fromAccount;
            jToken["destinationAccount"] = toAcct;
            jToken["amount"] = amount;
            jToken["transferDescription"] = description;
            jToken["reference"] = transReference;
            var jsString = jToken.ToString();
            Logger.Info(this, "Payload to EthixServices >>" + jsString);
            request.AddParameter("application/json", jsString, ParameterType.RequestBody);
            var str = "Error in transfer";
            try
            {
                ServicePointManager
                        .ServerCertificateValidationCallback +=
                    (sender, cert, chain, sslPolicyErrors) => true;
                Logger.Info(this, "Xapi Transfer Request >>" + jsString);
                var response1 = client.Execute(request);
                Logger.Info(this,"Response status code >>>"+ response1.StatusCode);
                str = response1.Content;
                Logger.Info(this, "Xapi Transfer Response Content>>" + str);
                JToken json = JToken.Parse(str.Trim());
                return json;
            }
            catch (JsonReaderException jex)
            {
                JToken json = JToken.Parse("{}");
                json["message"] = str;
                json["status"] = "07";
                return json;

            }
            catch (Exception ex)
            {
                Logger.Error(this, "RestHandler - Transfer", ex);
                return null;
            }
        }
    }
}
