using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using Extend;
using MongoDB.Bson;
using MongoDB.Bson.IO;
using MongoDB.Bson.Serialization;
using Newtonsoft.Json.Bson;
using JsonConvert = Newtonsoft.Json.JsonConvert;

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

        public static string ToJsonString<T>(this List<T> TItems) where T: class
        {
            return JsonConvert.SerializeObject(TItems);
        }

        public static string ToJsonString<T>(this T TItem) where T : class
        {
            return JsonConvert.SerializeObject(TItem);
        }


        public static string ToStringOrEmpty(this JToken jt)
        {
            try
            {
                if (jt == null)
                {
                    return "";
                }
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
                var str = jt.ToString().ToLower();
                return str.Equals("true");
            }
            return false;

        }
        
        public static string UrlEncode(this string str)
        {
            if (str != null)
            {
                str = HttpUtility.UrlEncode(str,Encoding.UTF8);
                return str;
            }
            return string.Empty;

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

        public static string GetActiveClass(this string currentPath, string pathLink)
        {
            if (currentPath.Equals(pathLink, StringComparison.CurrentCultureIgnoreCase))
            {
                return " active ";
            }
            return "";
        }
        
        public static string EscapeQuotes(this string text,string quotes="'")
        {
            if(!string.IsNullOrEmpty(text))
                return text.Replace("'", "''");
            return text;
        }

        public static string ToNormalJson(this BsonDocument bson)
        {
            using (var stream = new MemoryStream())
            {
                using (var writer = new BsonBinaryWriter(stream))
                {
                    BsonSerializer.Serialize(writer, typeof(BsonDocument), bson);
                }
                stream.Seek(0, SeekOrigin.Begin);

                using (var reader = new BsonDataReader(stream))
                {
                    var sb = new StringBuilder();
                    var sw = new StringWriter(sb);
                    using (var jWriter = new JsonTextWriter(sw))
                    {
                        jWriter.DateTimeZoneHandling = DateTimeZoneHandling.Utc;
                        jWriter.WriteToken(reader);
                    }
                    return sb.ToString();
                }
            }

        }

      



    }
}
