using System;
using System.Collections.Generic;
using ZenExpressoCore.Helpers;

namespace ZenExpressoCore.Models
{
    public class SupportTaskResult : ServiceResponse
    {
        protected  SupportTask _supportTask;

        public SupportTaskResult(SupportTask task)
        {
            _supportTask = task;
        }

        public void ExecuteResult()
        {
            try
            {
                var sqlScript = _supportTask.sqlScript;
                if (_supportTask.GetScriptParameters().Count == 0)
                {
                    var result = ExecuteSql(_supportTask, sqlScript);
                    status = "00";
                    data = result;
                }
                else
                {
                    sqlScript = InterpolateParams(sqlScript, _supportTask.GetScriptParameters());
                    var result = ExecuteSql(_supportTask, sqlScript);
                    status = "00";
                    data = result;
                }
            }
            catch (Exception ex)
            {
                status = "07";
                Logger.Error(this,ex);
                message = ex.Message ;
            }
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
                    case "dropdown":
                        replaceVal = "'" + parameter.parameterValue + "'";
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

        protected List<dynamic> ExecuteSql(SupportTask task, string sql)
        {
            List<dynamic> result = null;
            result = DbHandler.Instance.ExecuteTaskScript(task, sql);
            return result;
        }


    }
}