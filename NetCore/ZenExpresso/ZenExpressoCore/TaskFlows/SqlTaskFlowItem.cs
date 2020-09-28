using System;
using System.Collections.Generic;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class SqlTaskFlowItem : TaskFlowItem
    {
        private string _dbusername;
        private string _dbPass;
        private string _sqlScript;
        private DataSource _dataSource;
        public SqlTaskFlowItem(TaskFlowItem flowItem):base(flowItem)
        { 
            var jsonFlowData = JObject.Parse(flowItem.flowData);
            _sqlScript = jsonFlowData["sqlScrpt"].ToStringOrEmpty();
            _dbPass = jsonFlowData["dbPass"].ToStringOrEmpty();
            _dbusername = jsonFlowData["dbusername"].ToStringOrEmpty();
            string dataSourceName = jsonFlowData["dataSourName"].ToStringOrEmpty();
            _dataSource = MemDb.Instance.GetDataSourceByName(dataSourceName);

        }

        protected List<dynamic> ExecuteSql (string sql)
        {
            List<dynamic> result = null;
            result = DbHandler.Instance.ExecuteTaskScript( sql,_dataSource, _dbusername, _dbPass);
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

        public new TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            List<dynamic> result = null;
            var response = new TaskFlowResult();
            try
            {
                var sqlScript = flowData;
                if (inputList.Count > 0)
                {
                    sqlScript = InterpolateParams(sqlScript, inputList);
                }

                if (resultSequence.Count > 0)
                {
                    List<PlaceHolder> placeholders = TaskFlowUtilities.ExtractPlaceHolders(sqlScript);
                    sqlScript = TaskFlowUtilities.InterpolateSequenceParams(sqlScript,placeholders, resultSequence);
                }
                
                result = ExecuteSql(sqlScript);
                response.status = "00";
                response.data = result;
            }
            catch (Exception ex)
            {
                response.status = "07";
                Logger.Error(this, ex);
                response.message = ex.Message;
            }
            return response;
        }

    }
}
