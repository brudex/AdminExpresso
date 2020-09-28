namespace ZenExpressoCore.Models
{
    public class ServiceResponse
    {
        public string status { get; set; }
        public string message { get; set; }
        public dynamic data { get; set; }
    }
}