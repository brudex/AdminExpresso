using System;
using System.Collections.Generic;

namespace ZenExpressoCore
{
    public class SettingsData
    {
       
      
        public static string DefaultConnection = "";
        public static string LoginMode = Constants.LoginMode.Email;
        public static Dictionary<string,string> appSettings;
 
        public static void Initialize(Dictionary<string, string> settings)
        {
            DefaultConnection = settings["DefaultConnection"];
            appSettings = settings;
        }
    }
}
