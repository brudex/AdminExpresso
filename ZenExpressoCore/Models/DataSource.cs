using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZenExpressoCore.Models
{
    public class DataSource
    {
        public int Id { get; set; }
        public string dataSourceName { get; set; }
        public string dataSourceLabel { get; set; }
        public bool useRawConnectingString { get; set; }
        public string connectionString { get; set; }
        public string serverIp { get; set; }
        public string serverPort { get; set; }
        public string defaultDatabase { get; set; }
        public string dataProvider { get; set; } //SqlServer,Sybase
    }

    public class DataSourceExtended :DataSource
    {
        public string userName { get; set; }
        public string password { get; set; }
    }
}