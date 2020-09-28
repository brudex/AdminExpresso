
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Brudex.CodeFirst;
using MohammadYounes.Owin.Security.MixedAuth;
using ZenExpresso.Helpers;
using ZenExpresso.Models;
using ZenExpressoCore;
using ZenExpressoCore.Models;


namespace ZenExpresso
{
    public class MvcApplication : System.Web.HttpApplication
    {
        public MvcApplication()
        {
            this.RegisterMixedAuth();
        }
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Logger.EnsureInitialized();
            Logger.Info(this,"App initialized");
            //InitializeDatabase();

            SetupInitialAdmin();
            //SetupInitialDataSources();
            MemDb.Instance.Init();
        }



        protected void Application_Error()
        {
            var ex = Server.GetLastError();
            Logger.Error(this,ex); 
        }

        public void SetupInitialAdmin()
        {
            
            var admins = DbHandler.Instance.GetList<DedicatedAdmin>();
            if (admins.Count == 0)
            {
                var admin = new DedicatedAdmin();
                admin.userName = "brudexgh@gmail.com";
                admin.fullName = "Nana Safo";
                DbHandler.Instance.Save(admin);
            }
           
        }

        public void SetupInitialDataSources()
        {
            var dataSources = DbHandler.Instance.GetList<DataSource>();
            if (dataSources.Count == 0)
            {

                {
                    var dataSrc = new DataSource();
                    dataSrc.dataSourceName = "sqlserver210";
                    dataSrc.dataSourceLabel = "SQL Server on 210";
                    dataSrc.serverIp = "172.19.1.210";
                    dataSrc.serverPort = "1433";
                    dataSrc.useRawConnectingString = false;
                    dataSrc.dataProvider = "sqlServer";
                    dataSrc.defaultDatabase = "master";
                    DbHandler.Instance.Save(dataSrc);
                }

                {
                    var dataSrc = new DataSource();
                    dataSrc.dataSourceName = "sqlserver215";
                    dataSrc.dataSourceLabel = "SQL Server on 215";
                    dataSrc.serverIp = "172.19.1.215";
                    dataSrc.serverPort = "1433";
                    dataSrc.useRawConnectingString = false;
                    dataSrc.dataProvider = "sqlServer";
                    dataSrc.defaultDatabase = "master";
                    DbHandler.Instance.Save(dataSrc);
                }

                {
                    var dataSrc = new DataSource();
                    dataSrc.dataSourceName = "sybase122";
                    dataSrc.dataSourceLabel = "Sybase Server on 122";
                    dataSrc.serverIp = "172.19.1.122";
                    dataSrc.serverPort = "7300";
                    dataSrc.useRawConnectingString = false;
                    dataSrc.dataProvider = "sybase";
                    dataSrc.defaultDatabase = "master";
                    DbHandler.Instance.Save(dataSrc);
                }

                {
                    var dataSrc = new DataSource();
                    dataSrc.dataSourceName = "sybase";
                    dataSrc.dataSourceLabel = "Sybase Server on Live";
                    dataSrc.serverIp = "172.19.1.50";
                    dataSrc.serverPort = "7300";
                    dataSrc.useRawConnectingString = false;
                    dataSrc.dataProvider = "sybase";
                    dataSrc.defaultDatabase = "master";
                    DbHandler.Instance.Save(dataSrc);
                } 
            }
             
        }
        private void InitializeDatabase()
        {
            //Bcf<DedicatedAdmin>.Migrate();
            Bcf<ExecutedTasks>.Migrate();
            
            //Bcf<LogManagement>.Migrate();
            //Bcf<SupportTask>.Migrate();
            //Bcf<ScriptParameter>.Migrate();
            //Bcf<TopMenu>.Migrate();
            //Bcf<SupportTaskLite>.Migrate();
            //Bcf<DataSource>.Migrate();
           // BrudexCodeFirst.RunMigrations("DefaultConnection", true);
        }
    }
}
