using System.Collections.Generic;
using ZenExpressoCore.Models;

namespace ZenExpresso.Models
{
    public class DbLogManagerViewModel
    {
        public DbLogManagerViewModel()
        {
            appLogs = new List<LogManagement>();
        }

        public List<LogManagement> appLogs { get; set; }
    }
}