using System.Collections.Generic;

namespace ZenExpressoCore.Models
{
    public class SupportMenuModel
    {
        public string menuName { get; set; }
        public bool active { get; set; }
        public List<SubMenu> SubMenus { get; set; }

        public string GetActiveCss()
        {
            if (active)
            {
                return " active ";
            }

            return "";
        }
    }

    public class SubMenu
    {
        public string taskName { get; set; }
        public bool active { get; set; }
        public int taskId { get; set; }
        public string GetActiveCss()
        {
            if (active)
            {
                return " active ";
            }

            return "";
        }
    }
}