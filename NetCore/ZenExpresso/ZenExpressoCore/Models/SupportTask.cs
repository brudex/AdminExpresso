using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore.Helpers;
using ZenExpressoCore.TaskFlows;

namespace ZenExpressoCore.Models
{
    public class SupportTask
    {
        private List<ScriptParameter> _parameters;

        public SupportTask()
        {
            _parameters = new List<ScriptParameter>();
            createdAt = DateTime.Now;
        }

        public int id { get; set; }
        public string taskName { get; set; }
        public string description { get; set; }
        public string taskType { get; set; }
        public string taskResultType { get; set; }
        public string dbusername { get; set; }
        public string topLevelMenu { get; set; }
        public string dbPass { get; set; }
        public string sqlScript { get; set; }
        public string jsScript { get; set; }
        public string createdBy { get; set; }
        public DateTime createdAt { get; set; }


        public void CreateAdvancedFlows(List<TaskFlowItem>  flowItems)
        {
            foreach (var taskFlowItem in flowItems)
            {
                taskFlowItem.supportTaskFlowId = id;
                DbHandler.Instance.Save(taskFlowItem);
            }
        }

        public List<ScriptParameter> GetScriptParameters()
        {
            if (_parameters == null || _parameters.Count == 0)
            {
                _parameters = DbHandler.Instance.GetScriptParameters(id);
            }
            return _parameters;
        }

        public void AddScriptParameters(JArray scriptParams)
        {
            if (_parameters == null)
            {
                _parameters = new List<ScriptParameter>();
            }

            foreach (var scriptParam in scriptParams)
            {
                var param = new ScriptParameter();
                param.parameterLabel = scriptParam["parameterLabel"].ToStringOrEmpty();
                param.parameterName = scriptParam["parameterName"].ToStringOrEmpty();
                param.parameterType = scriptParam["parameterType"].ToStringOrEmpty();
                param.parameterValue = scriptParam["parameterValue"].ToStringOrEmpty();
                param.parameterRegex = scriptParam["parameterRegex"].ToStringOrEmpty();
                param.optionsList = scriptParam["optionsList"].ToStringOrEmpty();
                _parameters.Add(param);
            }
        }

        public int Save()
        {
            
            if (id == 0)
            {
                dbusername = dbusername.Encrypt();
                dbPass = dbPass.Encrypt();
                id = DbHandler.Instance.Save(this);
                if (_parameters != null)
                {
                    foreach (var scriptParameter in _parameters)
                    {
                        scriptParameter.supportTaskId = id;
                        DbHandler.Instance.Save(scriptParameter);
                    }
                }
                return id;
            }

            if (string.IsNullOrEmpty(dbusername) || string.IsNullOrEmpty(dbPass))
            {
                var task = DbHandler.Instance.GetSupportTaskById(id);
                dbusername = task.dbusername;
                dbPass = task.dbPass;
            }
            else
            {
                dbusername = dbusername.Encrypt();
                dbPass = dbPass.Encrypt();

            }
            var updated = DbHandler.Instance.Update(this);
            if (updated)
            {
                DbHandler.Instance.DeleteScriptParamByTaskId(id);
                if (_parameters != null)
                {
                    foreach (var scriptParameter in _parameters)
                    {
                        scriptParameter.supportTaskId = id;
                        DbHandler.Instance.Save(scriptParameter);
                    }
                }
                return id;
            }
            return 0;
        }

        public int SaveAdvancedTaskFlow()
        {

            if (id == 0)
            {
                id = DbHandler.Instance.Save(this);
                return id;
            }
            var updated = DbHandler.Instance.Update(this);
            if (updated)
            {
                DbHandler.Instance.DeleteTaskFlowItemByTaskId(id);
            }

            return id;
        }



        public void SetParameterValues(JObject value)
        {
            GetScriptParameters();
            IList<string> keys = value.Properties().Select(p => p.Name).ToList();
            foreach (var key in keys)
            {
                var param = _parameters.FirstOrDefault(x => x.parameterName == key);
                if (param != null)
                {
                    param.parameterValue = value[key].ToStringOrEmpty();
                }
            }
        }

        public bool IsAuthorizedUser(IPrincipal user)
        {
            var taskLite =  DbHandler.Instance.GetSupportTaskLiteByTaskId(id);
            var identity = (ClaimsIdentity)user.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            if (taskLite.UserHasAccess(user.Identity.Name, claims))
            {
                return true; 
            }
            return false;
        }

        public List<DataSource> GetDataSources()
        {
            return MemDb.Instance.GetDataSources();
        }

        public DataSource GetDataSource()
        {
            return MemDb.Instance.GetDataSourceByName(taskType);
        }

        public List<TaskFlowItem> GetFlowItemsForAdvancedTask()
        {
            return DbHandler.Instance.GetAdvancedTaskFlowItems(id);
        }

        public List<TaskFlowItem> GetFlowItemsForAdvancedTask(string flowGroup)
        {
            return DbHandler.Instance.GetAdvancedTaskFlowItems(id,flowGroup);
        }
    }

    public class ScriptParameter
    {
        public int id { get; set; }
        public int supportTaskId { get; set; }
        public string parameterLabel { get; set; }
        public string parameterName { get; set; }
        public string parameterType { get; set; }
        public string parameterValue { get; set; }
        public string optionsList { get; set; }
        public string parameterRegex { get; set; }
        public string parameterLocation { get; set; }

        public List<string> GetSelectOptions()
        {
            if (optionsList != null)
            {
                var array = optionsList.Split(new[] {";", ","}, StringSplitOptions.RemoveEmptyEntries);
                return array.ToList();
            }
            return new List<string>();
        }
    }
}