using System.ComponentModel.DataAnnotations;

namespace ZenExpresso.Models
{
    public class InstallViewModel
    {

        [Required]
        public string dbHost { get; set; }

        [Required]
        public string dbPort { get; set; }

        [Required]
        public string dbName { get; set; }

        [Required]
        public string dbUser { get; set; }

        [Required]
        public string dbPass { get; set; }
        [Required]
        public string appName { get; set; }
        public string appDescription { get; set; }

        [Required]
        [EmailAddress]
        public string email { get; set; }

        [Required]
        public string password { get; set; }

        [DataType(DataType.Password)]
        
        [System.ComponentModel.DataAnnotations.Compare("password",
            ErrorMessage = "The password and confirmation password do not match.")]
        public string confirmPass { get; set; }

        public bool dbInitialized { get; set; }
        public string error { get; set; }

       
    }
}