using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ZenExpressoCore
{
    public class AppSettingsTable
    { 
        public int Id { get; set; }
        public string SettingsKey { get; set; }
        public string SettingsData { get; set; }

        public T GetSettings<T>() where T:class
        {
            return JsonConvert.DeserializeObject<T>(SettingsData);
        }
    }
}   