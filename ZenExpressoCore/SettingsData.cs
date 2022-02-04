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
        public static bool DbInitialzed=false;
        public static bool SuperAdminCreationPending=false;
        public static bool NodejsRuntimeConfigured=false;
        public static AppInstallSettings InstallSettings;

        public static void Initialize(Dictionary<string, string> settings)
        { 
            appSettings = settings;
        }

        public static void SetInstallSettings()
        {
            if (DbInitialzed)
            {
                InstallSettings = AppInstallHandler.GetInstallSettings();
                if (InstallSettings == null)
                {
                    InstallSettings= new AppInstallSettings();
                    InstallSettings.appName = "ZenExpresso";
                    InstallSettings.appDescription = "ZenExpresso";
                }
            }
        }

        public static string GetAppSettingsJson()
        {
            string s = @"{
               ""ConnectionStrings"": {
               ""DefaultConnection"": ""Persist Security Info=False;database=;server=localhost;user id=sa;Password=pass""
           },
           ""Urls"": ""http://localhost:5005"",
           ""Logging"": {
               ""LogLevel"": {
                   ""Default"": ""Information"",
                   ""Microsoft"": ""Warning"",
                   ""Microsoft.Hosting.Lifetime"": ""Information""
               }
           },
           ""AllowedHosts"": ""*""
               }";
            return s;
        }
    }
}
