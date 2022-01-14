using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
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
        private IApplicationLifetime ApplicationLifetime { get; set; }
        public InstallController(
            UserManager<ApplicationUser> userManager,
            IApplicationLifetime appLifetime

        )
        {
            _userManager = userManager;
            ApplicationLifetime = appLifetime;
        }
        
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Index()
        {
            if (SettingsData.DbInitialzed)
            {
                return RedirectToAction(nameof(AccountController.Login), "Account");
            }
            return View();
        }
        
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Index([FromForm]InstallViewModel model, IFormFile logo)
        {
            // model.dbInitialized = true;
            // return View(model);
            string error = "";
            model.error = null;
            model.dbInitialized = false;
            if (!ModelState.IsValid)
            {
                error = string.Join(" | ", ModelState.Values
                    .SelectMany(v => v.Errors)
                    .Select(e => e.ErrorMessage));
                model.error = error;
              
                return View(model);
            }
            var passwordErrors = await GetPasswordErrors(model.password);
            if (passwordErrors.Count > 0)
            {
                model.error = string.Join("<br/>", passwordErrors);
                return View(model);
            }
            string  connectionString=null;
            if (!SettingsData.DbInitialzed)
            {
                var datasource = new DataSourceExtended();
                datasource.serverPort = model.dbPort;
                datasource.serverIp = model.dbHost;
                datasource.defaultDatabase = model.dbName;
                datasource.userName = model.dbUser;
                datasource.password = model.dbPass;
                connectionString = AppInstallHandler.WriteConnectionStringToAppSettings(datasource,out error);
                SettingsData.DefaultConnection = connectionString;
                DbHandler.Instance.UpdateDefaultConnectionString();
            }
            if (string.IsNullOrEmpty(connectionString))
            {
                model.error = error;
                return View(model);
            }

            if (logo != null)
            {
                string fileName = await HandleLogoUpload(logo);
                if (string.IsNullOrEmpty(fileName))
                {
                    model.error = "Please upload application logo";
                    return View(model);
                }
            }
            else
            {
                model.error = "Please upload application logo";
                return View(model);
            }
            var initialized = InitializeDatabase.Init(out error);
            if (initialized)
            {
                var installSettings = new AppInstallSettings();
                installSettings.appName = model.appName; 
                installSettings.appDescription = model.appDescription;
                AppInstallHandler.SaveAppSettings(installSettings);
                var admin = new DedicatedAdmin();
                admin.userName = model.email;
                admin.fullName = model.email;
                admin.canCreateAdmin = true;
                admin.canCreateTask = true;
                admin.canCreateUser = true;
                admin.canManageLogs = true;
                admin.canManageUserRoles = true;
                AppInstallHandler.SaveInitialAdmin(admin);
                AppInstallHandler.SaveAdminInitialPassword(model.password);
                SettingsData.DbInitialzed = true;
                model.dbInitialized = true;
                return RedirectToAction(nameof(InstallController.InstallCompleted), "Install");
            }
            else
            {
                model.error = error;
            }
            return View(model);
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult InstallCompleted()
        {
            // if (!SettingsData.DbInitialzed)
            // {
            //     return RedirectToAction(nameof(InstallController.Index), "Install");
            // }
            Func<int> restart =() => {
                ApplicationLifetime.StopApplication();
                return 0;
            };
            //Task.Factory.StartNew(() => { setTimeOut(restart, 5000); });
            Task.Factory.StartNew(() => { setTimeOut(restart, 5000); });
            return View();
        }


        private int setTimeOut(Func<int> action,int seconds )
        {
            var task = Task.Run(() => action());
            if (task.Wait(TimeSpan.FromSeconds(seconds)))
                return task.Result;
            else
                return 0;
        }
        private async Task<string>  HandleLogoUpload(IFormFile file)
        {
            var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/assets/images", "logo.jpg");
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }
            var stream = new FileStream(path, FileMode.Create);
            await file.CopyToAsync(stream);
            stream.Dispose();
            return file.FileName;
        }
        
       

        private async Task<List<string>> GetPasswordErrors(string password)
        {
            var validators = _userManager.PasswordValidators;
           var list = new List<string>();
            foreach (var validator in validators)
            {
                var result = await validator.ValidateAsync(_userManager, null, password);

                if (!result.Succeeded)
                {
                    foreach (var error in result.Errors)
                    {
                        list.Add(error.Description);
                    }
                }
            }

            return list;
        }
    }
}