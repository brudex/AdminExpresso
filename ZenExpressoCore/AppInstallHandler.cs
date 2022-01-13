using System;
using System.Dynamic;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;

namespace ZenExpressoCore
{
    public class AppInstallHandler
    {
        public static void SaveAppSettings(AppInstallSettings settings)
        {
            var settingsData = settings.ToJsonString();
            var appSettingsTable = new AppSettingsTable();
            appSettingsTable.SettingsKey = Constants.SettingsKeys.InstallSettings;
            appSettingsTable.SettingsData = settingsData;
            DbHandler.Instance.Save(appSettingsTable);
        }

       
        public static void SaveInitialAdmin(DedicatedAdmin admin)
        {
            var settingsData = admin.ToJsonString();
            var appSettingsTable = new AppSettingsTable();
            appSettingsTable.SettingsKey = Constants.SettingsKeys.InitialDedicatedAdmin;
            appSettingsTable.SettingsData = settingsData;
            DbHandler.Instance.Save(appSettingsTable);
        }
        public static DedicatedAdmin GetInitialAdmin()
        {
            var settingTable = DbHandler.Instance.GetAppSettings(Constants.SettingsKeys.InitialDedicatedAdmin);
            var installSettings = settingTable?.GetSettings<DedicatedAdmin>();
            return installSettings;
        }


        public static void SaveAdminInitialPassword(string password)
        {
            var appSettingsTable = new AppSettingsTable();
            appSettingsTable.SettingsKey = Constants.SettingsKeys.AdminInitialPassword;
            appSettingsTable.SettingsData = password;
            DbHandler.Instance.Save(appSettingsTable);
        }

        public static string GetAdminInitialPassword()
        {
            var appSettingsTable = new AppSettingsTable();
            var settingTable = DbHandler.Instance.GetAppSettings(Constants.SettingsKeys.AdminInitialPassword);
            return settingTable?.SettingsData;
        }

        public static AppInstallSettings GetInstallSettings()
        {
            var settingTable = DbHandler.Instance.GetAppSettings(Constants.SettingsKeys.InstallSettings);
            var installSettings = settingTable?.GetSettings<AppInstallSettings>();
            return installSettings;
        }
         

        public static string WriteConnectionStringToAppSettings(DataSourceExtended datasource, out string error)
        {
            error = String.Empty;
            string appSettingsFileName = Path.Combine(System.IO.Directory.GetCurrentDirectory(),
                $"appsettings.{SettingsData.AspNetEnv}.json");
            if (string.IsNullOrEmpty(SettingsData.AspNetEnv))
            {
                appSettingsFileName = "appsettings.json";
            }
            var appSettingsPath = Path.Combine(System.IO.Directory.GetCurrentDirectory(), appSettingsFileName);
            var appSettingsJson = File.ReadAllText(appSettingsPath);
            var connString = "";
            if (datasource.serverPort.Trim() == "1433")
            {
                  connString = $"Persist Security Info=False;database={datasource.defaultDatabase};server={datasource.serverIp};user id={datasource.userName};Password={datasource.password}";
            }
            else
            {
                if (datasource.serverIp.Equals("localhost", StringComparison.CurrentCultureIgnoreCase))
                {
                    datasource.serverIp = "127.0.0.1";
                }
                connString = $"Data Source={datasource.serverIp},{datasource.serverPort};Network Library=DBMSSOCN;Initial Catalog={datasource.defaultDatabase};User ID={datasource.userName};Password={datasource.password};";
            }

            try
            {
                var jobject = JObject.Parse(appSettingsJson);
                if (jobject["ConnectionStrings"] == null)
                {
                    var defaultConn = new JObject();
                    defaultConn["DefaultConnection"] = connString;
                    jobject["ConnectionStrings"] = defaultConn;
                }
                else
                {
                    jobject["ConnectionStrings"]["DefaultConnection"] = connString;
                }
                File.WriteAllText(appSettingsPath, jobject.ToJsonString());
                return connString; 
            }
            catch (Exception ex)
            {
                error = ex.Message;
                Logger.Error(typeof(AppInstallHandler),ex.Message,ex);
                return string.Empty;
            }
        }
    }
}   