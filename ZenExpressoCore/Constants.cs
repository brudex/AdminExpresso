using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ZenExpressoCore

{
    public class Constants
    {
        public class GroupType
        {

            public static string SingleUser = "SingleUser";
            public static string Groups = "Groups";
        }
        public class LoginMode
        {

            public static string Email = "Email";
            public static string ActiveDirectory = "ActiveDirectory";
        }

        public class TaskType
        {

            public static string BasicTaskFlow = "BasicTaskFlow";
            public static string AdvancedTaskFlow = "AdvancedTaskFlow";
        }
    }
}