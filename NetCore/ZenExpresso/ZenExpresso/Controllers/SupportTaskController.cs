using System;
using Microsoft.AspNetCore.Mvc;
using ZenExpresso.Helpers;
 using ZenExpressoCore;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
    
    public class SupportTaskController : Controller
    {
       // [DedicatedAdminsAllowed]
        public ActionResult CreateAdvancedTask()
        {
            var supportTask = new SupportTask();
            return View(supportTask);
        }


        [DedicatedAdminsAllowed]
        public ActionResult CreateSupportTask()
        {
            var supportTask = new SupportTask();
            return View(supportTask);
        }

        [DedicatedAdminsAllowed]
        public ActionResult EditSupportTask(int id)
        {
            var task = DbHandler.Instance.GetSupportTaskById(id);
            if (task != null)
            {
                return View(task);
//                if (task.createdBy != User.Identity.Name)
//                {
//                    Session["data"] = "Task cannot be edited by any other than the creator";
//                    return RedirectToAction("Index", "Error");
//                }
            }
            else
            {
                Session["data"] = "Task not found";
                return RedirectToAction("Index", "Error");
            }
        }

        [DedicatedAdminsAllowed]
        [System.Web.Mvc.HttpGet]
        public ActionResult ListTasks()
        {
            var tasks = DbHandler.Instance.GetAllSupportTasks();
            return View(tasks);
        }


        [DedicatedAdminsAllowed]
        [System.Web.Mvc.HttpGet]
        public ActionResult DeleteTask(int id)
        {
            var task = DbHandler.Instance.GetSupportTaskById(id);
            if (task == null)
            {
                throw new HttpException(404, "Item Not Found");
            }
            return View(task);
        }

        [DedicatedAdminsAllowed]
        [System.Web.Mvc.HttpPost]
        public ActionResult DeleteTask([FromBody]SupportTask data)
        {
            var deleted = DbHandler.Instance.DeleteSupportTaskById(data.id);
            if (deleted)
            {
                MemDb.Instance.ReloadSupportTasksInMemory();
                ViewBag.Message = "Data successufully deleted";
                ViewBag.Deleted = true;
            }
            return View(data);
        }

        [DedicatedAdminsAllowed]
        [HttpPost]
        public ActionResult AssignGroups(int id)
        {
            var supportTask = DbHandler.Instance.GetSupportTaskById(id);
            return View(supportTask);
        }



        [HttpGet]
        public ActionResult ExecuteTask(int id)
        {
            try
            {
                var supportTask = DbHandler.Instance.GetSupportTaskById(id);
                if (supportTask == null)
                {
                    Logger.Error(this, "Task not found>>>" + id);
                    return new StatusCodeResult(404);
                }
                else if (!supportTask.IsAuthorizedUser(User))
                {
                    Logger.Error(this, "Unauthorized>>" + id);
                    return new StatusCodeResult(403);
                }
                return View(supportTask);
            }
            catch (Exception ex)
            {
                Logger.Error(this, "Unauthorized>>" , ex);
                return RedirectToAction("Index","Home");
            }
             
          
        }


        [DedicatedAdminsAllowed]
        [HttpGet]
        public ActionResult ListExecutedTasks()
        { 
            var list = DbHandler.Instance.GetExecutedTasks();
            return View(list);
            
        }
    }
}