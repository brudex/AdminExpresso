using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using ZenExpresso.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
   
    public class SetupController : Controller
    {
        // GET: Settings
        [DedicatedAdminsAllowed]
        public ActionResult ManageTopMenus()
        {
            return View();
        }

        [DedicatedAdminsAllowed]
        public ActionResult ManageDataSources()
        {
            return View();
        }

        [DedicatedAdminsAllowed]
        public ActionResult ManageAdmins()
        {
            return View();
        }

         

        [DedicatedAdminsAllowed]
        public ActionResult ReloadMemory()
        {
            return View();
        }

        [HttpPost("[controller]/[action]")]
        [ValidateAntiForgeryToken]
        public IActionResult ReloadMemory([FromForm] object data)
        {
            MemDb.Instance.Init();
            ViewBag.Loaded = true;
            return View();
        }

        //[ChildActionOnly]
        //public ActionResult SupportMenus()
        //{
        //    var menus = MemDb.Instance.GetTopMenus();
        //    var tasks = MemDb.Instance.GetSupportTaskLites();
        //    var list = new List<SupportMenuModel>();
        //    var identity = (ClaimsIdentity)User.Identity;
        //    IEnumerable<Claim> claims = identity.Claims;
        //    foreach (var topMenu in menus)
        //    {
        //        var menuModel = new SupportMenuModel();
        //        menuModel.menuName = topMenu.menuName;
        //        var subTasks = tasks.Where(x => x.topLevelMenu == topMenu.menuName && x.UserHasAccess(User.Identity.Name,claims)).ToList();
        //        if (subTasks.Any())
        //        {
        //            menuModel.SubMenus = new List<SubMenu>();
        //            foreach (var supportTask in subTasks)
        //            {
        //                menuModel.SubMenus.Add(new SubMenu() {taskName = supportTask.taskName,taskId = supportTask.id});
        //            }
        //            list.Add(menuModel); 
        //        }
        //    } 
        //    return PartialView("_SupportMenus", list);
        //}
    }
}