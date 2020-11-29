using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using RestSharp;

namespace ZenExpressoCore
{
    public  class RestHandler
    {
        private static RestHandler instance = null;
        private static readonly object padlock = new object();

        private string _apiKey;
        private Dictionary<string, string> _headers;
        private Tuple<string, string> _basicAuth;

        private string _result = "";
        private RestHandler()
        {
            _headers = new Dictionary<string, string>();
        }

        public static RestHandler Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        if (instance == null)
                        {
                            instance = new RestHandler();
                        }
                    }
                }
                instance.ResetHeaders();
                return instance;
            }
        }

      private void ResetHeaders()
      {
          if (_headers != null)
          {
              _headers.Clear();
              
          }
            _apiKey = null;
            _basicAuth = null;
        }

        public string DoPost(string content, string endpoint)
        {
            var client = new RestClient(endpoint);
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddBody(content);
            var str = "";
            try
            {
                var response1 = client.Execute(request);
                str = response1.Content;
                return str;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        public string DoPostRaw(string data, string url)
        {
            var client = new RestClient(url);
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter(data,ParameterType.RequestBody);
//            ServicePointManager.ServerCertificateValidationCallback +=
//            (sender, certificate, chain, sslPolicyErrors) => true;
            var str = "";
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11;
                var response1 = client.Execute(request);
                str = response1.Content;
                return str;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }


        }

        public string DoPostFormValues(List<KeyValuePair<string,string>> formData, string url)
        {
            var client = new RestClient(url);
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            foreach (KeyValuePair<string,string> kv in formData)
            {
                request.AddParameter(kv.Key, kv.Value);
            }
            var str = "";
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11;
                var response1 = client.Execute(request);
                str = response1.Content;
                return str;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }


        }

        public RestHandler AddCustomHeader(string key, string value)
        {
            _headers[key] = value;
            return this;
        }

        public RestHandler AddJsonHeaders()
        {
           _headers["Content-Type"] = "application/json";
            return this;
        }

        public RestHandler SetBasicAuthentication(string userName, string password)
        {
            _basicAuth = new Tuple<string, string>(userName, password);
            return this;
        }

        public RestHandler SetApiKey(string key)
        {
            _apiKey = key;
            return this;

        }

        public RestPostResponse DoGetString(string url, string endpoint = "")
        {
            var client = new RestClient(url);
            RestRequest request;
            if (string.IsNullOrEmpty(endpoint))
            {
                request = new RestRequest(Method.GET);
            }
            else
            {
                request = new RestRequest(endpoint, Method.GET);
            }

            request.AddHeader("Content-Type", "application/json");
            if (!string.IsNullOrEmpty(_apiKey))
            {
                _headers["API-KEY"] = _apiKey;
            }
            foreach (var header in _headers)
            {
                request.AddHeader(header.Key, header.Value);
            }
            if (_basicAuth != null)
            {
                byte[] bytes = Encoding.UTF8.GetBytes(_basicAuth.Item1 + ":" + _basicAuth.Item2);
                string base64 = Convert.ToBase64String(bytes);
                request.AddHeader("Authorization", "Basic " + base64);
            }
            var resp = new RestPostResponse();
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11;
                var response1 = client.Execute(request);
                resp.content = response1.Content;
                resp.Status = response1.StatusCode;
                return resp;
            }
            catch (Exception ex)
            {
                resp.Status = System.Net.HttpStatusCode.InternalServerError;
                Logger.Info(typeof(RestHandler),"RestHandler - DoPost>>>" + ex.Message);
                return null;
            }
        }

         


        public RestPostResponse DoPostGetString(string url, string content, string endpoint="")
        {
            var client = new RestClient(url);
            Logger.Info("Calling url >>>", url);
            var request = new RestRequest(Method.POST);
            if (!string.IsNullOrEmpty(endpoint))
            {
                request = new RestRequest(endpoint, Method.POST);
            }
                    
            if (!string.IsNullOrEmpty(_apiKey))
            {
                _headers["API-KEY"] = _apiKey;
            }
            foreach (var header in _headers)
            {
                request.AddHeader(header.Key, header.Value);
            }
            if (_basicAuth != null)
            {
                byte[] bytes = Encoding.UTF8.GetBytes(_basicAuth.Item1 + ":" + _basicAuth.Item2);
                string base64 = Convert.ToBase64String(bytes);
                request.AddHeader("Authorization", "Basic " + base64);
            }
            try
            {
                request.AddParameter("application/json", content, ParameterType.RequestBody);
                Logger.Info("Calling url >>>", url);
                ServicePointManager.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) => true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11;
                var response1 = client.Execute(request);
                Logger.Info(typeof(RestHandler),endpoint + response1.Content);
                var resp = new RestPostResponse();
                resp.content = response1.Content;
                Logger.Info(this,"Response from service>>"+content);
                resp.Status = response1.StatusCode;
                return resp;
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "RestHandler - DoPost");
                return null;
            }
        }

        public RestPostResponse DoPostWithCertificate(string url, string content,string certPath,string certPassword="")
        {
            var client = new RestClient(url);
            Logger.Info("Calling url >>>", url);
            var request = new RestRequest(Method.POST);
            X509Certificate2 certificates = new X509Certificate2();
            if (string.IsNullOrEmpty(certPassword))
            {
                certificates.Import(certPath);
            }
            else
            {
               SecureString secureString=new SecureString();
                for (int i = 0; i < certPassword.Length; i++)
                {
                    Char c = certPassword[i];
                    secureString.AppendChar(c);
                }
                certificates.Import(certPath,secureString,X509KeyStorageFlags.DefaultKeySet);
                client.ClientCertificates = new X509Certificate2Collection() { certificates };
            }
           
            if (!string.IsNullOrEmpty(_apiKey))
            {
                _headers["API-KEY"] = _apiKey;
            }
            foreach (var header in _headers)
            {
                request.AddHeader(header.Key, header.Value);
            }
            if (_basicAuth != null)
            {
                byte[] bytes = Encoding.UTF8.GetBytes(_basicAuth.Item1 + ":" + _basicAuth.Item2);
                string base64 = Convert.ToBase64String(bytes);
                request.AddHeader("Authorization", "Basic " + base64);
            }
            try
            {
                request.AddParameter("application/json", content, ParameterType.RequestBody);
                Logger.Info("Calling url >>>", url);
                ServicePointManager.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) => true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11;
                var response1 = client.Execute(request);
                Logger.Info(typeof(RestHandler),  response1.Content);
                var resp = new RestPostResponse();
                resp.content = response1.Content;
                Logger.Info(this, "Response from service>>" + content);
                resp.Status = response1.StatusCode;
                return resp;
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "RestHandler - DoPost");
                return null;
            }
        }

    }
}
