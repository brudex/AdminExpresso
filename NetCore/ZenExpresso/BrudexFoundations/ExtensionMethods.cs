using System;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;

namespace BrudexFoundations
{
    public static class ExtensionMethods
    {


        internal static bool EqualsInteger(this string str, int value)
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
            DateTime dt = new DateTime();
            if (jt != null)
            {
                var str = jt.ToString();
                DateTime.TryParse(str, out dt);
            }          
            return dt;
        }

        internal static bool ToBoolean(this JToken jt)
        {
            if (jt != null)
            {
                var str = jt.ToString();
                return str.Equals("true");
            }
            return false;

        }

        public static string ToJsonString<T>(this T list) where T : class
        {

            var json = JsonConvert.SerializeObject(list, new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver() });
            return json;

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

         

 
         

         

       

        
    }
}
