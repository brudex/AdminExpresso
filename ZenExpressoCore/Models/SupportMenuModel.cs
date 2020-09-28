using System.Collections.Generic;

namespace ZenExpressoCore.Models
{
    public class SupportMenuModel
    {
        public string menuName { get; set; }
        public List<SubMenu> SubMenus { get; set; }
    }

    public class SubMenu
    {
        public string taskName { get; set; }
        public int taskId { get; set; }
    }
}