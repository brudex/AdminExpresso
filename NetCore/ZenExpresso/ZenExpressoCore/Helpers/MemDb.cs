using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using DapperExtensions;

using ZenExpressoCore;
using ZenExpressoCore.Models;


namespace ZenExpresso.Helpers
{

    public class MemDb
    {
        static MemDb instance = null;
        static readonly object padlock = new object();
        private readonly string DefaultConnection;

        private static List<DedicatedAdmin> _dedicatedAdmins;
        private static List<TopMenu> _topMenus;
        private static List<SupportTaskLite> _supportTasksList;
        private static List<DataSource> _dataSources;

        MemDb()
        { 
        }

        public static MemDb Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        if (instance == null)
                        {
                            instance = new MemDb();
                        }
                    }
                }
                return instance;
            }
        }

         

        public void Init()
        {
            _dedicatedAdmins = DbHandler.Instance.GetList<DedicatedAdmin>();
            _topMenus = DbHandler.Instance.GetList<TopMenu>();
            _supportTasksList = DbHandler.Instance.GetSupportTaskWithGroupsAssigned();
            _dataSources = DbHandler.Instance.GetList<DataSource>();
            SetupInitialAdmin(); 
        }



        public List<DedicatedAdmin> GetDedicatedAdmins()
        {
            return _dedicatedAdmins;
        }

        public List<TopMenu> GetTopMenus()
        {
            return _topMenus;
        }

        public List<SupportTaskLite> GetSupportTaskLites()
        {
            return _supportTasksList;
        }


        public void ReloadAdmins()
        {
            _dedicatedAdmins = DbHandler.Instance.GetList<DedicatedAdmin>();
        }

        public void ReloadMenus()
        {
            _topMenus = DbHandler.Instance.GetList<TopMenu>();
        }
      public void ReloadDataSources()
        {
            _dataSources = DbHandler.Instance.GetList<DataSource>();
        }

        public void ReloadSupportTasksInMemory()
        {
            _supportTasksList = DbHandler.Instance.GetSupportTaskWithGroupsAssigned();
        }

        public List<DataSource> GetDataSources()
        {
            return _dataSources;
        }

        public DataSource GetDataSourceByName(string dataSourceName)
        {
           return _dataSources.FirstOrDefault(x=>x.dataSourceName==dataSourceName);
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


    }

}
