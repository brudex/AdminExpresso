using System;
using System.Collections.Generic;
using System.Web.Http;
using Newtonsoft.Json.Linq;
using ZenExpressoCore;
using ZenExpressoCore.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers.Api
{
    public class DbLogManagerApiController : ApiController
    {
        [HttpPost]
        public IEnumerable<string> ConnectDbListDatabases([FromBody]JObject value)
        {
            string uname = value["dbusername"].ToStringOrEmpty();
            string pass = value["dbpass"].ToStringOrEmpty();
            var list = DbHandler.Instance.GetRowsForSingleColumn(uname, pass,"select name as 'string' from sys.databases");
            return list;
        }

        [HttpPost]
        public IEnumerable<string> ConnectDbListTables([FromBody]JObject value)
        {
            string uname = value["dbusername"].ToStringOrEmpty();
            string pass = value["dbpass"].ToStringOrEmpty();
            string dbName = value["dbname"].ToStringOrEmpty();
            string sql =
                string.Format("SELECT TABLE_NAME as 'string'  FROM {0}.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'",
                    dbName);
            var list = DbHandler.Instance.GetRowsForSingleColumn(uname, pass,
                sql);
            return list;
        }

        [HttpPost]
        public IEnumerable<string> ConnectDbListTableColumns([FromBody]JObject value)
        {
            string uname = value["dbusername"].ToStringOrEmpty();
            string pass = value["dbpass"].ToStringOrEmpty();
            string dbName = value["dbname"].ToStringOrEmpty();
            string tablename = value["tablename"].ToStringOrEmpty();
            string sql =
                string.Format("SELECT COLUMN_NAME as 'string' FROM {0}.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'{1}'",
                    dbName,tablename);
            var list = DbHandler.Instance.GetRowsForSingleColumn(uname, pass,
                sql);
            return list;
        }

       

        // POST: api/DbLogManagerApi
        [HttpPost]
        public ServiceResponse SaveLogManagement([FromBody]JObject value)
        {
            var response = new ServiceResponse();
            var logmgmt = new LogManagement();
            logmgmt.appname = value["appname"].ToStringOrEmpty();
            logmgmt.dbusername = value["dbusername"].ToStringOrEmpty().Encrypt();
            logmgmt.dbpass = value["dbpass"].ToStringOrEmpty().Encrypt();
            logmgmt.dbname = value["dbname"].ToStringOrEmpty();
            logmgmt.dateField = value["dateField"].ToStringOrEmpty();
            logmgmt.tablename = value["tablename"].ToStringOrEmpty();
            logmgmt.searchFields = value["searchFields"].ToString();
            int id = DbHandler.Instance.Save(logmgmt);
            if (id > 0)
            {
                response.status = "00";
                response.message = "Data saved successfully";
            }
            else
            {
                response.status = "03";
                response.message = "Error Saving Data";
            }
            return response;
        }

        // POST: api/DbLogManagerApi
        [HttpPost]
        public ServiceResponse SearchLogs([FromBody]JObject value)
        {
            var id = value["id"].ToInteger();
            var appLog = DbHandler.Instance.GetLogManagerById(id);
            string sqlQuery = appLog.ComposeQuery(value);
            var data= DbHandler.Instance.QueryLog(sqlQuery, appLog);
            var response = new ServiceResponse();
             
            if (data.Count>0)
            {
                response.status = "00";
                response.message = "Data saved successfully";
                response.data = data;
            }
            else
            {
                response.status = "03";
                response.message = "No results found";
            }
            return response;
        }



    }
}
