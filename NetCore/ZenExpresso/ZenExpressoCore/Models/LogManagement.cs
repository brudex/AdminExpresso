using Newtonsoft.Json.Linq;
using ZenExpressoCore.Helpers;

namespace ZenExpressoCore.Models
{
    public class LogManagement
    {
        public int id { get; set; }
        public string appname { get; set; }
        public string dbusername { get; set; }
        public string dbpass { get; set; }
        public string dbname { get; set; }
        public string tablename { get; set; }
        public string searchFields { get; set; }
        public string dateField { get; set; }
        public string idField { get; set; }

        public string ComposeQuery(JObject data)
        {
            var byDate = data["searchMode"].ToStringOrEmpty() == "bydate";
            var sql = string.Empty;
            if (byDate)
            {
                var fromDate = data["fromDate"].ToStringOrEmpty();
                var toDate = data["toDate"].ToStringOrEmpty();
                if (string.IsNullOrEmpty(idField))
                {
                    sql = string.Format("SELECT * FROM dbo.[{3}] where {0} >= '{1}' and {0} <= '{2}' ", dateField,
                        fromDate, toDate, tablename);
                }
                else
                {
                    sql = string.Format("SELECT * FROM dbo.[{3}] where {0} >= '{1}' and {0} <= '{2}' order by {4} desc ",
                        dateField, fromDate, toDate, tablename, idField);
                }
            }
            else
            {
                var searchText = data["searchText"].ToStringOrEmpty();
                var jarray = JArray.Parse(searchFields);
                var query = "";
                var k = 0;
                foreach (var jToken in jarray)
                {
                    var fieldname = jToken.ToStringOrEmpty();
                    if (k == 0)
                    {
                        query += string.Format(" {0} like '%{1}%'  ", fieldname, searchText);
                    }
                    else
                    {
                        query += string.Format(" or {0} like '%{1}%'", fieldname, searchText);
                    }
                    k += 1;
                }

                if (string.IsNullOrEmpty(idField))
                {
                    sql = string.Format("SELECT * FROM dbo.[{0}] where {1}  ", tablename, query);
                }
                else
                {
                    sql = string.Format("SELECT * FROM dbo.[{0}] where {1} order by {2} desc ", tablename, query,
                        idField);
                }
            }
            return sql;
        }

        public string GetClearLogQuery()
        {
            var sql = string.Format("truncate table dbo.[{0}]", tablename);
            return sql;
        }
    }
}