using System;
using Newtonsoft.Json.Linq;
using ZenExpressoCore.Helpers;

namespace ZenExpressoCore.Models
{
    public class TaskAssignedGroups
    {
        public TaskAssignedGroups()
        {
            createdAt = DateTime.Now;
        }

        public int id { get; set; }
        public int taskId { get; set; }
        public string assginedGroups { get; set; }
        public string createdBy { get; set; }
        public DateTime createdAt { get; set; }

        public int Save()
        {
            var taskGroup = DbHandler.Instance.GetTaskAssignedGroupsByTaskId(taskId);
            if (taskGroup == null)
            {
                id = DbHandler.Instance.Save(this);
                return id;
            }
            id = taskGroup.id;
            var updated = DbHandler.Instance.Update(this);
            return updated ? 1 : 0;
        }


        public void SetGroups(JArray arr)
        {
            assginedGroups = arr.ToString();
        }

        public JArray GetGroups()
        {
            var groups = JArray.Parse(assginedGroups);
            return groups;
        }
    }
}