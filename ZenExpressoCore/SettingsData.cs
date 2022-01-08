using System;
using System.Collections.Generic;

namespace ZenExpressoCore
{
    public class SettingsData
    {
       
      
        public static string DefaultConnection = "";
        public static string LoginMode = Constants.LoginMode.Email;
        public static Dictionary<string,string> appSettings;
        public static string WebRootPath = "";
        public static string HostUrl = "";
        public static string AspNetEnv = "";
 
        public static void Initialize(Dictionary<string, string> settings)
        {
            appSettings = settings;
        }
    }
}
