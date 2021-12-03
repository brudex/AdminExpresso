using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using ZenExpresso.Helpers;
using ZenExpresso.Models;
using ZenExpressoCore;
using ZenExpressoCore.Models;
using ZenExpressoCore.TaskFlows;

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
            }
            else
            { 
                return RedirectToAction("Index", "Error");
            }
        }

        [DedicatedAdminsAllowed]
        public ActionResult MakeCopy(int id)
        {
            var task = DbHandler.Instance.GetSupportTaskById(id);
            if (task != null)
            {
               int newTaskId = task.CreateCopy(User.Identity.Name);
                if(newTaskId > 0)
                {
                    if (task.IsAdvancedTask())
                    {
                        return RedirectToAction("EditAdvancedTask", "SupportTask", new { id = newTaskId });

                    }
                    return RedirectToAction("EditSupportTask", "SupportTask", new { id = newTaskId });

                }
                return RedirectToAction("Index", "Error"); 
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }
        }

        [DedicatedAdminsAllowed]
        public ActionResult EditAdvancedTask(int id)
        {
            var task = DbHandler.Instance.GetSupportTaskById(id);
            if (task != null)
            {
                return View(task); 
            }
            else
            { 
                return RedirectToAction("Index", "Error");
            }
        }

        [DedicatedAdminsAllowed]
        [HttpGet]
        public ActionResult ListTasks()
        {
            var tasks = DbHandler.Instance.GetAllSupportTasks();
            return View(tasks);
        }


        [DedicatedAdminsAllowed]
        [HttpGet]
        public ActionResult DeleteTask(int id)
        {
            var task = DbHandler.Instance.GetSupportTaskById(id);
            if (task == null)
            {
                return new StatusCodeResult(404);
            }
            return View(task);
        }

        [DedicatedAdminsAllowed]
        [HttpPost]
        public ActionResult DeleteTask([FromForm]SupportTask data)
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
        [HttpGet]
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
                SettingsData.HostUrl = $"{Request.Scheme}://{Request.Host.Value}";
                ViewBag.canCreateTask = User.GetPreviledges().canCreateTask;
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
                var queryData = Request.Query["data"];
                //ClientInputTaskFlowItem.CreateTaskFlow
                var viewModel = new TaskResultViewModel();
                viewModel.supportTask = supportTask;
                if (supportTask.taskType == Constants.TaskType.AdvancedTaskFlow)
                {
                    string staffId = User.Identity.Name;
                    List<TaskFlowItem> taskFlowItems = supportTask.GetFlowItemsForAdvancedTask("beforeRender");
                    List<TaskFlowItem> clientRenderFlowItems = supportTask.GetFlowItemsForAdvancedTask("clientRender");
                    var taskResult = new AdvancedSupportTaskResult(supportTask, taskFlowItems);
                    var inputTaskFlow =new ClientInputTaskFlowItem(queryData);
                    taskResult.ExecuteResult(inputTaskFlow);
                    var executedTask = new ExecutedTasks(taskFlowItems, supportTask, taskResult);
                    executedTask.executedBy = staffId;
                    DbHandler.Instance.Save(executedTask);
                    viewModel.taskResult = taskResult;
                    viewModel.queryData = inputTaskFlow.GetClientInputs().ToJsonString();
                    viewModel.clientRenderFlows = clientRenderFlowItems;
                    return View(viewModel);
                }
                return View(viewModel);
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