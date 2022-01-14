using System;
using System.Collections.Generic;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore.Models;

namespace ZenExpressoCore.TaskFlows
{
    public class MongoDbTaskFlowItem : TaskFlowItem, ITaskExecutor
    {
        
       
        private string _operationType;
        private string _mongodbScript1;
        private string _mongodbScript2;
        private string _mongodbScript3;
        private string _collection;
       
         private MongoDbhandler dbhandler;

        public MongoDbTaskFlowItem(TaskFlowItem flowItem) : base(flowItem)
        {
            var jsonFlowData = JObject.Parse(flowItem.flowData);
            _operationType = jsonFlowData["operationType"].ToStringOrEmpty();
            _mongodbScript1 = jsonFlowData["queryScript1"].ToStringOrEmpty();
            _mongodbScript2 = jsonFlowData["queryScript2"].ToStringOrEmpty();
            _mongodbScript3 = jsonFlowData["queryScript3"].ToStringOrEmpty();
            var dbPass = jsonFlowData["dbPass"].ToStringOrEmpty();
            var dbusername = jsonFlowData["dbusername"].ToStringOrEmpty();
            var databaseName = jsonFlowData["database"].ToStringOrEmpty();
            _collection = jsonFlowData["collection"].ToStringOrEmpty();
            string dataSourceName = jsonFlowData["dataSource"].ToStringOrEmpty();
            var dataSource = MemDb.Instance.GetDataSourceByName(dataSourceName);
            if (dataSource.useRawConnectingString)
            {
                dbhandler = MongoDbhandler.Instance.GetDbConnection(dataSource.connectionString, databaseName);
            }
            else
            {
                dbhandler = MongoDbhandler.Instance.GetDbConnection(dataSource, dbusername, dbPass,databaseName);
            }
           
        }

        protected JToken ExecuteMongoQuery(string queryParam1,string queryParam2="",string queryParam3="")
        {
            JToken result = null;
            switch (_operationType)
            {
                case "insert":
                {
                    dbhandler.Insert(_collection,queryParam1);
                    result = JToken.Parse("{}");
                    result["status"] = "00";
                    result["message"] = "Insert Successful";
                    break;
                }
                case "find":
                {
                    var bsonValue =  dbhandler.Find(_collection, queryParam1,queryParam2,queryParam3);
                    var bsonJson = bsonValue.ToNormalJson();
                    var jobj = JObject.Parse(bsonJson);

                    result = jobj["cursor"]["firstBatch"];
                    break;
                }
                case "update":
                {
                    var bsonValue =dbhandler.Update(_collection, queryParam1,queryParam2);
                    var bsonJson = bsonValue.ToNormalJson();
                    var jobj = JObject.Parse(bsonJson);
                    result = jobj;
                        break;
                }
                case "delete":
                {
                    var bsonValue= dbhandler.Delete(_collection, queryParam1);
                    var bsonJson = bsonValue.ToNormalJson();
                    var jobj = JObject.Parse(bsonJson);
                    result = jobj;
                    break;
                }
                case "command":
                {
                    var bsonValue = dbhandler.RunShellCommand(queryParam1);
                    var bsonJson = bsonValue.ToNormalJson();
                    var jobj = JObject.Parse(bsonJson);
                    result = jobj;
                    break;
               }
            }
 
                
            return result;
        }

        

        public TaskFlowResult ExecuteResult(List<ScriptParameter> inputList, List<TaskFlowResult> resultSequence)
        {
            
            var response = new TaskFlowResult();
            response.flowItemType = flowItemType;
            response.description = description;
            response.controlIdentifier = controlIdentifier;
            try
            {
                var queryParam1 = _mongodbScript1;
                var queryParam2 = _mongodbScript2;
                var queryParam3 = _mongodbScript3;
                if (inputList.Count > 0)
                {
                    queryParam1 = TaskFlowUtilities.InterpolateParams(queryParam1, inputList, "\"");
                    if (!string.IsNullOrEmpty(queryParam2))
                    {
                        queryParam2= TaskFlowUtilities.InterpolateParams(queryParam2, inputList,"\"");
                    }
                }
                if (resultSequence.Count > 0)
                {
                    List<PlaceHolder> placeholders = TaskFlowUtilities.ExtractPlaceHolders(queryParam1);
                    queryParam1 = TaskFlowUtilities.InterpolateSequenceParams(queryParam1, placeholders, resultSequence);
                    
                    if (!string.IsNullOrEmpty(queryParam2))
                    {
                        List<PlaceHolder> placeholders2 = TaskFlowUtilities.ExtractPlaceHolders(queryParam2);
                        queryParam2= TaskFlowUtilities.InterpolateSequenceParams(queryParam2, placeholders2, resultSequence);
                    }


                    if (!string.IsNullOrEmpty(queryParam3))
                    {
                        List<PlaceHolder> placeholders3 = TaskFlowUtilities.ExtractPlaceHolders(queryParam3);
                        queryParam3 = TaskFlowUtilities.InterpolateSequenceParams(queryParam3, placeholders3, resultSequence);
                    }
                }
                var result = ExecuteMongoQuery(queryParam1,queryParam2,queryParam3);
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