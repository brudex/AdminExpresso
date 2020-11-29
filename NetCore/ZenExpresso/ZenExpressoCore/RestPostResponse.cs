using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace ZenExpressoCore
{
   public class RestPostResponse
    {
        public string content { get; set; }
        public HttpStatusCode Status { get; set; }

        public JObject ToJOject()
        {
            if ((int)Status >= 200 && (int)Status <= 300)
            {
                return JObject.Parse(content);
            }
            return null;
        }

        public JArray ToJArray()
        {
            if ((int)Status >= 200 && (int)Status <= 300)
            {
                return JArray.Parse(content);
            }
            return null;
        }
        
        public bool IsSuccessStatus()
        {
            return (int) Status >= 200 && (int) Status <= 300;
        }
        public bool IsArrayResult()
        {
            if (!string.IsNullOrEmpty(content))
            {
               return  content.Trim().IndexOf("[", StringComparison.Ordinal) == 0;
            }

            return false;
        }
    }
}
