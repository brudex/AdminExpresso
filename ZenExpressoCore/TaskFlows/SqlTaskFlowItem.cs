using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class SqlTaskFlowItem : TaskFlowItem, ITaskExecutor
    {
        private string _dbusername;
        private string _dbPass;
        private string _sqlScript;
        private DataSource _dataSource;

        public SqlTaskFlowItem(TaskFlowItem flowItem) : base(flowItem)
        {
            var jsonFlowData = JObject.Parse(flowItem.flowData);
            _sqlScript = jsonFlowData["sqlQuery"].ToStringOrEmpty();
            _dbPass = jsonFlowData["dbPass"].ToStringOrEmpty();
            _dbusername = jsonFlowData["dbusername"].ToStringOrEmpty();
            string dataSourceName = jsonFlowData["dataSource"].ToStringOrEmpty();
            _dataSource = MemDb.Instance.GetDataSourceByName(dataSourceName);
        }

        protected List<dynamic> ExecuteSql(string sql)
        {
            List<dynamic> result = null;
            Console.WriteLine("Sql>>"+sql); //todo validate datasource in the ui b4 saving
            Console.WriteLine("_dataSource>>"+_dataSource);
            Console.WriteLine("_dbusername>>"+_dbusername);
            Console.WriteLine("_dbPass>>"+_dbusername);
            result = DbHandler.Instance.ExecuteTaskScript(sql, _dataSource, _dbusername, _dbPass);
            return result;
        }

        protected string InterpolateParams(string sql, List<ScriptParameter> parameters)
        {
            foreach (var parameter in parameters)
            {
                var replaceVal = "";
                switch (parameter.parameterType)
                {
                    case "number":
                        replaceVal = parameter.parameterValue;
                        break;
                    case "regex":
                    case "date":
                        replaceVal = "'" + parameter.parameterValue + "'";
                        break;
                    case "text":
                    case "textarea":
                   
                        replaceVal = "'" + parameter.parameterValue + "'"; 
                        break;
                        
                    case "select":
                         replaceVal = "'" + parameter.parameterValue + "'";
                        break;
                     case "multiselect":  
                         List<string> selected = JsonConvert.DeserializeObject<List<string>>(parameter.parameterValue);
                         StringBuilder sb = new StringBuilder();
                         sb.Append($"'{selected.First()}'");
                         for (int i = 1; i < selected.Count; i++)
                         {
                             sb.Append($",'{selected[i]}'");
                         }
                        replaceVal = sb.ToString();
                        break;
                    case "checkbox":
                    {
                        if (string.IsNullOrEmpty(parameter.parameterValue))
                        {
                            replaceVal = "0";
                        }
                        else
                        {
                            replaceVal = parameter.parameterValue == "true" ? "1" : "0";
                        }
                    }
                        break;
                    default:
                        replaceVal = "'" + parameter.parameterValue + "'";
                        break;
                }

                sql = sql.Replace("@" + parameter.parameterName, replaceVal);
                sql = sql.Replace("${" + parameter.parameterName + "}", parameter.parameterValue);
            }

            return sql;
        }

        public TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            List<dynamic> result = null;
            var response = new TaskFlowResult();
            response.flowItemType = flowItemType;
            response.description = description;
            response.controlIdentifier = controlIdentifier;
            try
            {
                var sqlScript = _sqlScript;
                if (inputList.Count > 0)
                {
                    sqlScript = InterpolateParams(sqlScript, inputList);
                }

                if (resultSequence.Count > 0)
                {
                    List<PlaceHolder> placeholders = TaskFlowUtilities.ExtractPlaceHolders(sqlScript);
                    sqlScript = TaskFlowUtilities.InterpolateSequenceParams(sqlScript, placeholders, resultSequence);
                }

                result = ExecuteSql(sqlScript);
                response.status = "00";
                response.message = "Success";
                response.data = result;
            }
            catch (Exception ex)
            {
                response.status = "07";
                Logger.Error(this, ex);
                response.message = ex.Message +" " + ex.InnerException;
            }

            return response;
        }
    }
}