using System;
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
            Console.WriteLine("Install Settings>>");
            Console.WriteLine(SettingsData);
            return JsonConvert.DeserializeObject<T>(SettingsData);
        }


        public static void DeleteSetting(string settingKey)
        {
            DbHandler.Instance.DeleteAppSettingsByKey(settingKey);
        }
    }
}   