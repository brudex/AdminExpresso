using System.Collections.Generic;

namespace ZenExpresso.Models
{
    public class CustomPrincipalSerializeModel
    {
        public string StaffId { get; set; }


        public string Role { get; set; }

        public bool IsAdmin { get; set; }


        public Dictionary<string, string> AllowedControllers { get; set; }
    }
}