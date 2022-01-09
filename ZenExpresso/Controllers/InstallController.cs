using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ZenExpresso.Models;
using ZenExpressoCore;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
    
    [AllowAnonymous]
    public class InstallController : Controller
    {
        
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public InstallController(
            UserManager<ApplicationUser> userManager 
        )
        {
            _userManager = userManager; 
        }
        
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }
        
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Index([FromForm]InstallViewModel model, IFormFile logo)
        {
            string  connectionString=null;
            string error = "";
            if (string.IsNullOrEmpty(SettingsData.DefaultConnection))
            {
                var datasource = new DataSourceExtended();
                datasource.serverPort = model.dbPort;
                datasource.serverIp = model.dbHost;
                datasource.defaultDatabase = model.dbName;
                datasource.userName = model.dbUser;
                datasource.password = model.dbPass;
                connectionString = AppInstallHandler.WriteConnectionStringToAppSettings(datasource,out error);
                SettingsData.DefaultConnection = connectionString;
            }
            if (string.IsNullOrEmpty(connectionString))
            {
                ViewBag.error = error;
                return View();
            }

            string fileName = await HandleLogoUpload(logo);
            if (string.IsNullOrEmpty(fileName))
            {
                ViewBag.error = "Please upload application logo";
                return View();
            }
            new InitializeDatabase(); //install scripts
            if (CreateAdmin(model.email, model.password))
            {
                var installSettings = new AppInstallSettings();
                installSettings.appName = model.appName; 
                installSettings.appDescription = model.appDescription;
                AppInstallHandler.SaveAppSettings(installSettings);
                return RedirectToAction(nameof(AccountController.Login), "Account");
            }
            else
            {
                error = "Creating admin failed";
                ViewBag.error= error;
            }
           
            return View(model);
        }
        
        private async Task<string>  HandleLogoUpload(IFormFile file)
        {
            var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images", file.FileName);
            var stream = new FileStream(path, FileMode.Create);
            await file.CopyToAsync(stream);
            return file.FileName;
        }
        
        private bool CreateAdmin(string email,string password)
        {
            var user = new ApplicationUser() { Email = email ,UserName = email };
            var result = _userManager.CreateAsync(user, password).Result;
            if (result.Succeeded)
            {
                Logger.Info(this, "Initial account created.");
                return true; 
            }
            return false;
        }
    }
}