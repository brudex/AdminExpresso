using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZenExpressoCore.Models
{
    public class DedicatedAdmin
    {
        public int id { get; set; }
        public string userName { get; set; }
        public string fullName { get; set; }

        public bool canCreateUser { get; set; } //can create new user in the system
        public bool canCreateTask { get; set; } //-can create menu,can reload memory,can add datasource
        public bool canManageLogs { get; set; } // --can create log apps and delete
        public bool canCreateAdmin { get; set; } //--can add dedicated admin


        public bool HasPreviledges()
        {
            return canCreateUser || canCreateTask || canManageLogs || canCreateAdmin;
        }

    }
}