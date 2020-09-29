using System;
using Newtonsoft.Json.Linq;

namespace ZenExpressoCore.Models
{
    public class ExecutedTasks
    {
        public ExecutedTasks()
        {}

        public ExecutedTasks(JObject values, SupportTask supportTask, SupportTaskResult taskResult)
        {
            parameterValues = values.ToString();
            taskId = supportTask.id;
            dateExecuted= DateTime.Now;
            taskName = supportTask.taskName;
            taskDescription = supportTask.description;
            topMenu = supportTask.topLevelMenu;
            responseStatus = taskResult.status; 
        }
        public int id { get; set; }
        public int taskId { get; set; }
        public string parameterValues { get; set; }
        public string topMenu { get; set; }
        public string taskName { get; set; }
        public string taskDescription { get; set; }
        public string executedBy { get; set; }
        public string responseStatus { get; set; }
        public DateTime dateExecuted { get; set; }
    }
}