using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace BrudexFoundations
{
   public class RestPostResponse
    {
        public string content { get; set; }
        public HttpStatusCode Status { get; set; }

        public JObject ToJobject()
        {
            if (Status == HttpStatusCode.OK)
            {
                return JObject.Parse(content);
            }
            return null;
        }
    }
}
