using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Mvc;
using ZenExpresso.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
    public class SupportMenusViewComponent : ViewComponent
    { 

        public IViewComponentResult Invoke()
        {

            var menus = MemDb.Instance.GetTopMenus();
            var tasks = MemDb.Instance.GetSupportTaskLites();
            var list = new List<SupportMenuModel>();
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            if (!claims.Any())
            {
                claims = IdentityExtensions.GetUserClaims(User.Identity.Name);
            }
            string path = HttpContext.Request.Path.ToString().ToLower();
            int taskId = -999;
            if (path !=null && path.IndexOf("ExecuteTask")>-1)
            {
                var match = Regex.Matches(path, @"(\d+)");
                if (match.Count > 0)
                {
                   taskId=  Int16.Parse(match[0].Value);
                }
            }
            foreach (var topMenu in menus)
            {
                var menuModel = new SupportMenuModel();

                menuModel.menuName = topMenu.menuName;
                var subTasks = tasks.Where(x => x.topLevelMenu == topMenu.menuName && x.UserHasAccess(User.Identity.Name, claims)).ToList();
                if(subTasks.Any())
                {
                    menuModel.SubMenus = new List<SubMenu>();
                    foreach (var supportTask in subTasks)
                    {
                        bool active = false;
                        if (supportTask.id == taskId)
                        {
                            menuModel.active = true;
                            active = true;
                        }
                        menuModel.SubMenus.Add(new SubMenu() { taskName = supportTask.taskName, taskId = supportTask.id,active = active});
                    }
                    list.Add(menuModel);
                }
            }
            return View("~/Views/Shared/_SupportMenus.cshtml", list);
        }
    }
}
