using System;
using System.Text;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Models;


namespace ZenExpressoCore
{
    public class MongoDbhandler
    {
        static MongoDbhandler instance = null;
        static readonly object padlock = new object();
        private IMongoDatabase _db;

        MongoDbhandler()
        {
        }

        public static MongoDbhandler Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        if (instance == null)
                        {
                            instance = new MongoDbhandler();
                        }
                    }
                }

                return instance;
            }
        }

        public MongoDbhandler GetDbConnection(string userId, string pass, string ip, string dbName = "admin")
        {
            string conString = "";
            string port = "27017";
            if (string.IsNullOrEmpty(userId))
            {
                conString = $"mongodb://{ip}:{port}/{dbName}";
            }
            else
            {
                conString = $"mongodb://{userId}:{pass}@{ip}{port}/{dbName}";
            }

            MongoClient client = new MongoClient(conString);
            _db = client.GetDatabase(dbName);
            return this;
        }

        public MongoDbhandler GetDbConnection(string conString, string dbName)
        {
            MongoClient client = new MongoClient(conString);
            if (string.IsNullOrEmpty(dbName))
            {
                dbName = "admin";
            }

            if (string.IsNullOrEmpty(dbName))
            {
                _db = client.GetDatabase(dbName);
            }

            _db = client.GetDatabase(dbName);
            return this;
        }

        public MongoDbhandler GetDbConnection(DataSource dataSource, string userId, string pass,
            string dbName = "admin")
        {
            string conString = "";
            string port = "27017";
            if (string.IsNullOrEmpty(dbName))
            {
                dbName = dataSource.defaultDatabase;
            }

            if (string.IsNullOrEmpty(dataSource.serverPort))
            {
                port = dataSource.serverPort;
            }

            if (string.IsNullOrEmpty(userId))
            {
                conString = $"mongodb://{dataSource.serverIp}:{port}/{dbName}";
            }
            else
            {
                conString = $"mongodb://{userId}:{pass}@{dataSource.serverIp}{port}/{dbName}";
            }

            MongoClient client = new MongoClient(conString);
            _db = client.GetDatabase(dbName);
            return this;
        }


        public void Insert(string collectionName, string jsonData)
        {
            var collection = _db.GetCollection<BsonDocument>(collectionName);
            var document = BsonSerializer.Deserialize<BsonDocument>(jsonData);
            collection.InsertOne(document);
        }

        public BsonDocument Update(string collectionName, string filter, string updateFields)
        {
            string updateQuery = $@"{{
                              update:  ""{collectionName}"",
                              updates: [
                                 {{
                                   q: {filter},
                                   u: {updateFields},
                                   multi : true
                                 }},
                              ]
                           }}
                        ";
            var commdDoc = new BsonDocumentCommand<BsonDocument>(BsonDocument.Parse(updateQuery));
            var result = _db.RunCommand<BsonDocument>(commdDoc);
            return result;
        }

        public void Replace(string collectionName, string filter, string updateFields)
        {
            var cmdBulder = new StringBuilder();
            cmdBulder.AppendLine($"var coll = db.getCollection(\"{collectionName}\")");
            cmdBulder.AppendLine($"coll.replaceOne({filter} , {{$set: {updateFields} }})");
            var result = _db.RunCommand<BsonDocument>(cmdBulder.ToString());
        }

        

       

        public BsonDocument Delete(string collectionName, string deleteQuery)
        {
            string updateQuery = $@"{{
                               delete: ""{collectionName}"",
                               deletes: [
                                  {{
                                    q: {deleteQuery},
                                    limit : 0
                                  }}
                               ] }}";
            var commdDoc = new BsonDocumentCommand<BsonDocument>(BsonDocument.Parse(updateQuery));
            var result = _db.RunCommand<BsonDocument>(commdDoc);
            return result;
        }

        public BsonDocument Find(string collectionName, string query, string selectFields, string sortQuery)
        {
            string sort = "{}";
            string projection = "{}";
            if (!string.IsNullOrEmpty(sortQuery))
            {
                sort = sortQuery;
            }
            if (!string.IsNullOrEmpty(selectFields))
            {
                if (selectFields.IndexOf("{") > -1)
                {
                    projection = sortQuery;
                }
                else
                {
                    var arr = selectFields.Split(new string[] {"\n", ";", ","}, StringSplitOptions.RemoveEmptyEntries);
                    var jobj = JObject.Parse("{}");
                    foreach (var s in arr)
                    {
                        jobj[s] = 1;
                    }
                    projection = jobj.ToString();
                }
            }
            string cmdText = $"{{ find: \"{collectionName}\", filter: {query},sort: {sort},projection:{projection} }}";
            var commdDoc = new BsonDocumentCommand<BsonDocument>(BsonDocument.Parse(cmdText));
            var result = _db.RunCommand<BsonDocument>(commdDoc);
            return result;
        }

        public BsonDocument RunShellCommand(string commandString)
        {
            
            var commdDoc = new BsonDocumentCommand<BsonDocument>(BsonDocument.Parse(commandString));
            var result = _db.RunCommand<BsonDocument>(commdDoc);
            return result;
        }


        public bool TestDbConnection()
        {
            bool connected = false;
            try
            {
                var list = _db.ListCollections();
                connected = true;
            }
            catch (Exception ex)
            {
                Logger.Error(this, "Error connecting to Db >>", ex);
            }

            return connected;
        }
    }
}