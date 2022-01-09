using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using ZenExpresso.Helpers;
using ZenExpressoCore;
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
         
      
    }
}