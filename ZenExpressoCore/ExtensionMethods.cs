using System;
using System.Net;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace ZenExpressoCore
{
    public static class ExtensionMethods
    {
        public static bool EqualsInteger(this string str, int value)
        {
            int v = 0;
            var parsed = int.TryParse(str, out v);
            if (parsed)
            {
                return value == v;
            }
            return false;
        }

        public static int ToInteger(this JToken jt)
        {
            int v = 0;
            if (jt != null)
            {
                var str = jt.ToString();
                int.TryParse(str, out v);
            }

            return v;
        }


        public static string ToStringOrEmpty(this JToken jt)
        {
            try
            {
                var str = jt.ToString();
                return str;
            }
            catch (Exception)
            {

                return "";
            }

        }

        public static string ToFunctionName(this string s)
        { 
    
                var x = "_f_"+s.Replace("_", "");
                  x = s.Replace(" ", "");
                if (x.Length == 0) return "Null";
                x = Regex.Replace(x, "([A-Z])([A-Z]+)($|[A-Z])",
                    m => m.Groups[1].Value + m.Groups[2].Value.ToLower() + m.Groups[3].Value);
                return char.ToUpper(x[0]) + x.Substring(1);
            
        }

        public static decimal ToDecimal(this JToken jt)
        {
            decimal v = 0;
            if (jt != null)
            {
                var str = jt.ToString();
                decimal.TryParse(str, out v);
            }

            return v;
        }

        public static DateTime ToDateTime(this JToken jt)
        {
            DateTime dt = DateTime.Now;
            if (jt != null)
            {
                var str = jt.ToString();
                DateTime.TryParse(str, out dt);
            }
            return dt;
        }

        public static bool ToBoolean(this JToken jt)
        {
            if (jt != null)
            {
                var str = jt.ToString();
                return str.Equals("true");
            }
            return false;

        }
        

        public static string FormatMobile(this string mobile)
        {
            if (mobile.IndexOf("233") == 0)
            {
                return mobile;
            }
            if (mobile[0] == '+')
            {
                return mobile.Substring(1);
            }
            if (mobile[0] == '0')
            {
                return "233" + mobile.Substring(1);
            }
            return mobile;
        }

        public static string GenerateOtp(int length =5)
        {
            string numbers = "1234567890";
            string characters = numbers;
            string otp = string.Empty;
            for (int i = 0; i < length; i++)
            {
                string character = string.Empty;
                do
                {
                    int index = new Random().Next(0, characters.Length);
                    character = characters.ToCharArray()[index].ToString();
                } while (otp.IndexOf(character) != -1);
                otp += character;
            }
            return otp;
        }

        public static IRestResponse ExecuteAndLog(this RestClient client, IRestRequest request)
        {
            ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, errors) => true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            Logger.Debug(typeof(RestClient), "Request: " + JsonConvert.SerializeObject(request));
            var response = client.Execute(request);
            Logger.Debug(typeof(RestClient), "Response: " + JsonConvert.SerializeObject(response));
            return response;
        }

//        public static string ToBase64(this string plainText)
//        {
//            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
//            return System.Convert.ToBase64String(plainTextBytes);
//        }
//
//        public static string FromBase64(this string base64EncodedData)
//        {
//            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
//            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
//        }


    }
}
