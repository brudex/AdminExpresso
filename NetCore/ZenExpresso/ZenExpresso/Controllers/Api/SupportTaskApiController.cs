using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore;
using ZenExpressoCore.Helpers;
using ZenExpressoCore.Models;
using ZenExpressoCore.TaskFlows;
using Microsoft.AspNetCore.Authorization;


namespace ZenExpresso.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    public class SupportTaskApiController : Controller
    {      
        [HttpPost]
        public ServiceResponse CreateSupportTask([FromBody]JObject value)
        {
            var response = new ServiceResponse();
            var task = new SupportTask();
            task.createdBy = User.Identity.Name;
            task.taskName = value["taskName"].ToStringOrEmpty();
            task.description = value["description"].ToStringOrEmpty();
            task.taskType = value["taskType"].ToStringOrEmpty();
            task.taskResultType = value["taskResultType"].ToStringOrEmpty();
            task.dbusername = value["dbusername"].ToStringOrEmpty();
            task.topLevelMenu = value["topLevelMenu"].ToStringOrEmpty();
            task.dbPass = value["dbPass"].ToString();
            task.sqlScript = value["sqlScript"].ToString();
            task.jsScript = value["jsScript"].ToStringOrEmpty();
            task.id = value["id"].ToInteger();
            if (value["parameters"]!=null)
            {
               var jsArray = (JArray) value["parameters"];
               task.AddScriptParameters(jsArray);
            }
            int id = task.Save();
            if (id > 0)
            {
                response.status = "00";
                response.message = "Data saved successfully";
                MemDb.Instance.ReloadSupportTasksInMemory();
            }
            else
            {
                response.status = "03";
                response.message = "Error Saving Data";
            }
            return response;
        }


        [HttpPost]
        public ServiceResponse CreateAdvancedSupportTask([FromBody]JObject value)
        {
            var response = new ServiceResponse();
            var task = new SupportTask();
            task.createdBy = User.Identity.Name;
            task.taskName = value["taskName"].ToStringOrEmpty();
            task.description = value["description"].ToStringOrEmpty();
            task.topLevelMenu = value["topLevelMenu"].ToStringOrEmpty();
            task.taskType = "AdvancedTaskFlow";
            task.id = value["id"].ToInteger();
            var beforeRenderFlows = (JArray)value["beforeRenderFlows"];
            var clientFlows = (JArray)value["clientFlows"];
            var postActionsFlows = (JArray)value["postActionsFlows"];
            var clientResultFlows = (JArray)value["clientResultFlows"];
            var taskFlowItems = new List<TaskFlowItem>();
            foreach (var flow in beforeRenderFlows)
            {
                taskFlowItems.Add(TaskFlowItem.CreateTaskFlow(flow,"beforeRender"));
            }
            foreach (var flow in clientFlows)
            {
                taskFlowItems.Add(TaskFlowItem.CreateTaskFlow(flow,"clientRender"));
            }
            foreach (var flow in postActionsFlows)
            {
                taskFlowItems.Add(TaskFlowItem.CreateTaskFlow(flow,"postAction"));
            }
            foreach (var flow in clientResultFlows)
            {
                taskFlowItems.Add(TaskFlowItem.CreateTaskFlow(flow,"clientResult"));
            }
          
            int id = task.SaveAdvancedTaskFlow();
            if (id > 0)
            {
                task.CreateAdvancedFlows(taskFlowItems);
                response.status = "00";
                response.message = "Data saved successfully";
                MemDb.Instance.ReloadSupportTasksInMemory();
            }
            else
            {
                response.status = "03";
                response.message = "Error Saving Data";
            }
            return response;
        }

        [HttpPost]
        public ServiceResponse SaveSupportTaskGroup([FromBody]JObject value)
        {
            var response = new ServiceResponse();
            var task = new TaskAssignedGroups();
            task.createdBy = User.Identity.Name;
            task.taskId = value["id"].ToInteger();
            var arr = (JArray)value["groups"];
            task.SetGroups(arr); 
            int id = task.Save();
            if (id > 0)
            {
                response.status = "00";
                response.message = "Data saved successfully";
                MemDb.Instance.ReloadSupportTasksInMemory();
            }
            else
            {
                response.status = "03";
                response.message = "Error Saving Data";
            }
            return response;
        }


        [HttpPost]
        public ServiceResponse TestDbConnection([FromBody]JObject value)
        {
            string connectionType = value["taskType"].ToStringOrEmpty();
            string dbuser = value["dbusername"].ToStringOrEmpty();
            string dbpass = value["dbPass"].ToStringOrEmpty();
            bool connected =DbHandler.Instance.TestDbConnection(connectionType, dbuser, dbpass);
            var response = new ServiceResponse();
            response.status = connected ? "00" : "03";
            return response;
        }

        [HttpPost]
        public ServiceResponse SupportTaskInfo([FromBody]JObject value)
        {
            var taskId = value["taskId"].ToInteger();
            var supportTask = DbHandler.Instance.GetSupportTaskById(taskId);
            var response = new ServiceResponse();
            if (supportTask != null)
            {
                if (supportTask.IsAdvancedTask())
                { 
                    dynamic data = new System.Dynamic.ExpandoObject();
                    data.supportTask = supportTask;
                    data.taskFlows = DbHandler.Instance.GetAdvancedTaskFlowItems(taskId);
                    response.status = "00";
                    response.data = data;
                }
                else
                { 
                    supportTask.dbusername = supportTask.dbusername.Decrypt();
                    supportTask.dbPass = supportTask.dbPass.Decrypt();
                    response.status = "00";
                    response.data = supportTask;
                }
            }
            else
            {
                response.status = "03";
                response.message = "Error getting support task info";
            }
            
            return response;
        }

        [HttpPost]
        public ServiceResponse ScriptParameters([FromBody]JObject value)
        {
            var taskId = value["taskId"].ToInteger();
            var scriptParams = DbHandler.Instance.GetScriptParameters(taskId);
            var response = new ServiceResponse();
            if (scriptParams != null)
            {
                response.status = "00";
                response.data = scriptParams;
            }
            else
            {
                response.status = "03";
                response.message = "Error getting support task info";
            }

            return response;
        }

        [HttpPost]
        [Authorize]
        public ServiceResponse ExecuteSupportTask([FromBody]JObject value)
        {
            var taskId = value["taskId"].ToInteger();
            var supportTask = DbHandler.Instance.GetSupportTaskById(taskId);
            if (supportTask != null)
            {
                string staffId = User.Identity.Name;
                supportTask.SetParameterValues(value);
                var taskResult = new SupportTaskResult(supportTask);
                taskResult.ExecuteResult();
                var executedTask = new ExecutedTasks(value,supportTask, taskResult);
                executedTask.executedBy = staffId;
                DbHandler.Instance.Save(executedTask);
                return taskResult;
            }
            var response = new ServiceResponse() {status = "05",message = "Task not found"};
            return response;
        }



        [HttpPost]
        [Authorize]
        public ServiceResponse ExecuteAdvancedTask([FromBody]JObject value)
        {
            var taskId = value["taskId"].ToInteger();
            var supportTask = DbHandler.Instance.GetSupportTaskById(taskId);
            if (supportTask != null && supportTask.taskType == "AdvancedTaskFlow")
            {
                var taskResultDto = new AdvancedTaskResultDto() { status = "00", message = "Task Successfully" };
                string staffId = User.Identity.Name;
                List<TaskFlowItem> taskFlowItems = supportTask.GetFlowItemsForAdvancedTask("postAction");
                taskResultDto.taskFlowItems = supportTask.GetFlowItemsForAdvancedTask("clientResult");
                var taskResult = new AdvancedSupportTaskResult(supportTask, taskFlowItems);
                taskResult.ExecuteResult(new ClientInputTaskFlowItem(value));
                taskResultDto.status = taskResult.status;
                taskResultDto.message = taskResult.message;
                taskResultDto.taskFlowResults = taskResult.taskFlowResults;
                var executedTask = new ExecutedTasks(value, supportTask, taskResult);
                executedTask.executedBy = staffId;
                DbHandler.Instance.Save(executedTask);
                return taskResultDto;
            }
            var response = new ServiceResponse() { status = "05", message = "Task not found" };
            return response;
        }




        [HttpGet]
        public ServiceResponse ListTasks()
        { 
            var tasks = DbHandler.Instance.GetAllSupportTasks();
            var response = new ServiceResponse();
            response.status = "00";
            response.data = tasks;
            return response;
        }


        [HttpGet]
        public ServiceResponse ListActiveDirectoryGroups()
        {
            var list = new List<string>();
            try
            {
                PrincipalContext ctx = new PrincipalContext(ContextType.Domain, "ZENITH.ZENITHBANK.COM.GH");
                GroupPrincipal qbeGroup = new GroupPrincipal(ctx);
                PrincipalSearcher srch = new PrincipalSearcher(qbeGroup);
                foreach (var found in srch.FindAll())
                { 
                    if (found.ContextType == ContextType.Domain)
                    {
                        if (found.DisplayName != null)
                            list.Add(found.DisplayName);
                    }
                }
            }
            catch (Exception ex)
            {
               Logger.Error(this,"Could not list active directory groups",ex); 
            }
            var response = new ServiceResponse();
            response.status = "00";
            response.data = list.OrderBy(x=>x).ToList();
            return response;
        }


        [HttpGet]
        public ServiceResponse TaskGroups(int id)
        { 
            var groups = DbHandler.Instance.GetTaskAssignedGroupsByTaskId(id);
            var response = new ServiceResponse();
            if (groups != null)
            {
                response.status = "00";
                response.data = groups.GetGroups();
            }
            else
            {
                response.status = "03";
            }
            return response;
        }

        

       
    }
}
