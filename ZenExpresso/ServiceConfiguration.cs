using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZenExpresso
{
    public class ServiceConfiguration
    {

        public static string DefaultDatabaseServer = "";
        public static string Sybase122DatabaseServer = "";
        public static string SybaseLiveDatabaseServer = "";

         static ServiceConfiguration()
        {
            DefaultDatabaseServer = System.Configuration.ConfigurationManager.AppSettings["DefaultDatabaseServer"];
            Sybase122DatabaseServer = System.Configuration.ConfigurationManager.AppSettings["Sybase122DatabaseServer"];
            SybaseLiveDatabaseServer = System.Configuration.ConfigurationManager.AppSettings["SybaseLiveDatabaseServer"];
        }
      
    }
}