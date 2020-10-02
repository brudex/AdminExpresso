using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using DapperExtensions;
using ZenExpresso.Helpers;
using ZenExpressoCore.Helpers;
using ZenExpressoCore.Models;
using ZenExpressoCore.TaskFlows;


namespace ZenExpressoCore
{

    public class DbHandler
    {
        static DbHandler instance = null;
        static readonly object padlock = new object();
        private readonly string DefaultConnection;
        
        DbHandler()
        {
            DefaultConnection = SettingsData.DefaultConnection;
        }

        public static DbHandler Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        if (instance == null)
                        {
                            instance = new DbHandler();
                        }
                    }
                }
                return instance;
            }
        }

        
        public bool Update<T>(T obj) where T : class
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var id = connection.Update(obj);
                return id;
            }
        }


        public List<T> GetList<T>() where T : class
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var list = connection.GetList<T>();
                return list.ToList();
            }
        }

        public List<TaskFlowItem> GetAdvancedTaskFlowItems(int supportTaskFlowId)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var p1 = Predicates.Field<TaskFlowItem>(f => f.supportTaskFlowId, Operator.Eq, supportTaskFlowId);
                var list = connection.GetList<TaskFlowItem>(p1);
                return list.ToList();
            }
        }

        public void DeleteTopMenuById(int id)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var p1 = Predicates.Field<TopMenu>(f => f.id, Operator.Eq, id);
                var list = connection.Delete<TopMenu>(p1);
            }
        }

        public void DeleteAdminById(int id)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var p1 = Predicates.Field<DedicatedAdmin>(f => f.id, Operator.Eq, id);
                var list = connection.Delete<DedicatedAdmin>(p1);
            }
        }
        public IDbConnection GetOpenDefaultConnection()
        {
            var connection = new SqlConnection(DefaultConnection);
            connection.Open();
            return connection;
        }

        public IDbConnection CreateDbConnection(string userId, string pass,string ip = "", string dbName = "master")
        {
            if (string.IsNullOrEmpty(ip))
            {
                ip = ServiceConfiguration.DefaultDatabaseServer;
            }
            var conString = string.Format("Data Source={0};Initial Catalog={1}; User Id={2}; Password={3}", ip, dbName, userId, pass);
            var connection = new SqlConnection(conString);
            connection.Open();
            return connection;
        }

        public DbConnection CreateDbConnectionSybase(string userId, string pass,  string ip = "",string dbName = "master")
        {
            string conString = string.Format("Data Source={0};Port=7300;Database={1};Uid={2};Pwd={3};CharSet=utf8;", ip,
                dbName,userId, pass);
            var connection = new Sybase.Data.AseClient.AseConnection(conString);
            connection.Open();
            return connection;
        }

        public IDbConnection CreateDbConnection(DataSource dataSource, string userId, string pass)
        {
            IDbConnection connection = null;
            switch (dataSource.dataProvider)
            {
                case "sqlServer":
                    {
                        if (dataSource.useRawConnectingString)
                        {
                            var conString = string.Format(dataSource.connectionString, userId, pass);
                            connection = new SqlConnection(conString);
                            connection.Open();
                        }
                        else
                        {
                            var conString = string.Format("Data Source={0};Initial Catalog={1}; User Id={2}; Password={3}", dataSource.serverIp, dataSource.defaultDatabase, userId, pass);
                            connection = new SqlConnection(conString);
                            connection.Open();

                        }
                        break;

                    }
                case "sybase":
                    {
                        if (dataSource.useRawConnectingString)
                        {
                            var conString = string.Format(dataSource.connectionString, userId, pass);
                            connection = new Sybase.Data.AseClient.AseConnection(conString);
                            connection.Open();
                        }
                        else
                        {
                            string conString = string.Format("Data Source={0};Port={1};Database={2};Uid={3};Pwd={4};CharSet=utf8;", dataSource.serverIp, dataSource.serverPort,
                            dataSource.defaultDatabase, userId, pass);
                            connection = new Sybase.Data.AseClient.AseConnection(conString);
                            connection.Open();
                        }
                        break;
                    }
            }
            return connection;
        }

        public List<string> GetRowsForSingleColumn(string username,string pass,string sql)
        {
            using (var connection = CreateDbConnection(username,pass))
            {
                var list = connection.Query<string>(sql);
                return list.ToList();
            }
        }


        public int Save<T>(T obj) where T:class
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var id = connection.Insert(obj);
                return id;
            }
        }

        public bool Update(object obj)  
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var id = connection.Update(obj);
                return id;
            }
        }

        public LogManagement GetLogManagerById(int id)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                return  connection.Get<LogManagement>(id); 
            }
        }

        

        public bool DeleteLogAppById(int id)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var affected = connection.Execute("delete from LogManagement where id =@id", new { id });
                return affected > 0;
            }
        }


        public bool DeleteSupportTaskById(int id) 
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var affected = connection.Execute("delete from SupportTask where id =@id", new {id});
                return affected > 0;
            }
        }

        public bool DeleteScriptParamByTaskId(int id)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var affected = connection.Execute("delete from ScriptParameter where supportTaskId =@id", new { id });
                return affected > 0;
            }
        }

        public List<LogManagement> GetLogManagements()
        {
            using (var connection = GetOpenDefaultConnection())
            {
                return connection.GetList<LogManagement>().ToList();
            }
        }

        public List<dynamic> QueryLog(string sqlQuery, LogManagement appLog)
        {
            using (var connection = CreateDbConnection(appLog.dbusername.Decrypt(),appLog.dbpass.Decrypt(),"",appLog.dbname))
            {
                var list = connection.Query(sqlQuery);
                return list.ToList();
            }
        }

        public int ExecuteScalarOnLogApp(string sqlQuery, LogManagement appLog)
        {
            using (var connection = CreateDbConnection(appLog.dbusername.Decrypt(), appLog.dbpass.Decrypt(), "", appLog.dbname))
            {
                var list = connection.Execute(sqlQuery);
                return list;
            }
        }

        public List<ScriptParameter> GetScriptParameters(int taskId)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var predicte = Predicates.Field<ScriptParameter>(f => f.supportTaskId, Operator.Eq, taskId);
                return connection.GetList<ScriptParameter>(predicte).ToList();
            }
        }

        public SupportTask GetSupportTaskById(int id)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var predicte = Predicates.Field<SupportTask>(f => f.id, Operator.Eq, id);
                return connection.GetList<SupportTask>(predicte).FirstOrDefault();
            }
        }

        public List<SupportTask> GetAllSupportTasks()
        {
            using (var connection = GetOpenDefaultConnection())
            {
                return connection.GetList<SupportTask>().ToList();
            }
        }
        public List<SupportTaskLite> GetSupportTaskWithGroupsAssigned()
        {
            using (var connection = GetOpenDefaultConnection())
            {
                return connection.Query<SupportTaskLite>("select s.[id],s.[topLevelMenu],s.[taskName],s.[description],t.[assginedGroups] from [SupportTask] s left join [TaskAssignedGroups] t on s.id =t.taskId").ToList();
            }
        }

        public SupportTaskLite GetSupportTaskLiteByTaskId(int taskId)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                return connection.Query<SupportTaskLite>("select s.[id],s.[topLevelMenu],s.[taskName],s.[description],t.[assginedGroups] from [SupportTask] s left join [TaskAssignedGroups] t on s.id =t.taskId where s.id=@id",new {id=taskId}).FirstOrDefault();
            }
        }

        public List<ExecutedTasks> GetExecutedTasks() 
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var list = connection.Query<ExecutedTasks>("select top 10000 * from ExecutedTasks order by id desc");
                return list.ToList();
            }
        }

        public TaskAssignedGroups GetTaskAssignedGroupsByTaskId(int id)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var predicate = Predicates.Field<TaskAssignedGroups>(f => f.taskId, Operator.Eq, id);
                return connection.GetList<TaskAssignedGroups>(predicate).FirstOrDefault();
            }
        }


        public List<dynamic> ExecuteTaskScript(SupportTask task, string sqlQuery)
        {
            using (var connection = CreateDbConnection(task.GetDataSource(),task.dbusername.Decrypt(), task.dbPass.Decrypt()))
            {
                var list = connection.Query(sqlQuery);
                return list.ToList();
            }
        }

        public List<dynamic> ExecuteTaskScript(string sqlQuery,DataSource dataSource,string dbusername,string dbpass)
        {
            using (var connection = CreateDbConnection(dataSource, dbusername, dbpass))
            {
                var list = connection.Query(sqlQuery);
                return list.ToList();
            }
        }

        //        public List<dynamic> ExecuteTaskScript210(SupportTask task,string sqlQuery)
        //        {
        //            using (var connection = CreateDbConnection(task.dbusername.Decrypt(), task.dbPass.Decrypt()))
        //            {
        //                var list = connection.Query(sqlQuery);
        //                return list.ToList();
        //            }
        //        }
        //
        //        public List<dynamic> ExecuteTaskScript215(SupportTask task, string sqlQuery)
        //        {
        //            using (var connection = CreateDbConnection(task.dbusername.Decrypt(), task.dbPass.Decrypt(),ip:"172.19.1.215"))
        //            {
        //                var list = connection.Query(sqlQuery);
        //                return list.ToList();
        //            }
        //        }

        //        public List<dynamic> ExecuteTaskScriptTestServer(SupportTask task, string sqlQuery)
        //        {
        //            using (var connection = CreateDbConnection(task.dbusername.Decrypt(), task.dbPass.Decrypt()))
        //            {
        //                var list = connection.Query(sqlQuery);
        //                return list.ToList();
        //            }
        //        }


        //        public List<dynamic> ExecuteTaskScriptSybase122(SupportTask task, string sqlQuery)
        //        {
        //            using (var connection = CreateDbConnectionSybase(task.dbusername.Decrypt(), task.dbPass.Decrypt(),ServiceConfiguration.Sybase122DatabaseServer ))
        //            {
        //                var list = connection.Query(sqlQuery);
        //                return list.ToList();
        //            }
        //        }

        //public List<dynamic> ExecuteTaskScriptSybaseLive(SupportTask task, string sqlQuery)
        //{
        //    using (var connection = CreateDbConnectionSybase(task.dbusername.Decrypt(), task.dbPass.Decrypt(), ServiceConfiguration.SybaseLiveDatabaseServer))
        //    {
        //        var list = connection.Query(sqlQuery);
        //        return list.ToList();
        //    }
        //}

        public bool TestDbConnection(string connectionType, string dbuser,string dbpass)
        {
            bool connected = false;
            try
            {
                var dataSource = MemDb.Instance.GetDataSourceByName(connectionType);
                if (dataSource != null)
                {
                    using (var connection = CreateDbConnection(dataSource, dbuser, dbpass))
                    {
                        connected = true;
                    }
                }  
            }
            catch (Exception ex)
            { 
                Logger.Error(this,"Error connecting to Db >>",ex);
            }
            return connected;
        }

        

        public List<ExecutedTasks> GetRecentTasks(string userName)
        {
            using (var connection = GetOpenDefaultConnection())
            {
                var query = string.Format("select top 20 max(id) 'id',taskId,taskName,taskDescription,topMenu, max(dateExecuted) 'dateExecuted' FROM ExecutedTasks  where executedBy='{0}' group by taskId, taskName, taskDescription, topMenu order by id desc",
                    userName);
                return connection.Query<ExecutedTasks>(query).ToList();
            }
        }
    }

}
