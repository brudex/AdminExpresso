namespace ZenExpresso.Models
{
    public class InstallViewModel
    {
        public string dbHost { get; set; }
        public string dbPort { get; set; }
        public string dbName { get; set; }
        public string dbUser { get; set; }
        public string dbPass { get; set; }
         
        public string appName { get; set; }
        public string appDescription { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string confirmPass { get; set; }
    }
}