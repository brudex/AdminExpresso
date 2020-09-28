using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using Sybase.Data.AseClient;

namespace BrudexFoundations
{
    public class DbHandler
    {
        static DbHandler instance = null;
        static readonly object padlock = new object();
        private readonly string DefaultConnectionString;
        private readonly string PhoenixConnectionString;
       

        DbHandler()
        {
            DefaultConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            PhoenixConnectionString = ConfigurationManager.ConnectionStrings["PhoenixConnectionString"].ConnectionString;
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


        public DbConnection GetOpenEthixServicesDbConnection()
        {
            var connection = new SqlConnection(DefaultConnectionString);
            connection.Open();
            return connection;
        }

        

        public AseConnection GetOpenPhoenixConnection()
        {
            var connection = new Sybase.Data.AseClient.AseConnection(PhoenixConnectionString);
            connection.Open();
            Logger.Info(typeof(DbHandler), "Connection to PhoenixDb Successfully");
            return connection;
        }
        
       

        
        public bool CheckIfPtidIsPresentInDpHistory(string ptid)
        {
            using (var conn = GetOpenPhoenixConnection())
            {
                var query1 =
                    string.Format(@"select * from dp_history where ptid={0}",ptid); 
                try
                { 
                    var list = conn.Query<dynamic>(query1, CommandType.Text);
                    return list.Any(); 
                }
                catch (Exception ex)
                {
                    Logger.Error(this, "Error getting AccountInfoExtended   description >>>> ", ex);
                }
                return false;
            }

        }
        
    }
}