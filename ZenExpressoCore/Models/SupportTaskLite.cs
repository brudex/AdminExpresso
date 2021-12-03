using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using Newtonsoft.Json.Linq;

namespace ZenExpressoCore.Models
{
    public class SupportTaskLite  
    {
        private JArray _assignedGroups;
        public int id { get; set; }
        public string topLevelMenu { get; set; }
        public string taskName { get; set; }
        public string description { get; set; }
        public string assginedGroups { get; set; }

        public bool UserHasAccess(string staffID, IEnumerable<Claim> claims)
        {
            var roleClaims = claims.Where(x => x.Type == ClaimTypes.Role).ToList();
            if (roleClaims.Any(x => x.Value == "Admin"))
            {
                return true;
            }
            if (string.IsNullOrEmpty(assginedGroups))
            {
                return false;
            }
            if (_assignedGroups == null)
            {
                _assignedGroups = JArray.Parse(assginedGroups);
            }
            if (_assignedGroups != null)
            {
                foreach (var assignedGroup in _assignedGroups)
                {
                    var groupType = assignedGroup["groupType"].ToString();
                    var groupName = assignedGroup["groupName"].ToString();
                    if (groupType == Constants.GroupType.SingleUser)
                    {
                        if (staffID == groupName)
                        {
                            return true;
                        }
                    }
                    else
                    {
                        var found = roleClaims.FirstOrDefault(x => x.Value == groupName);
                        if (found != null)
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }
    }
}