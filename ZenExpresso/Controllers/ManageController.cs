using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using ZenExpresso.Models;
using Microsoft.Extensions.Logging;
using ZenExpressoCore;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
    [Authorize]
     
    public class ManageController : Controller
    {
   

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ILogger _logger;

        public ManageController(
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            ILogger<AccountController> logger,
            IHttpContextAccessor accessor
        )
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _httpContextAccessor = accessor;
        }
 
        //
        // GET: /Manage/Index
        // public async Task<ActionResult> Index(ManageMessageId? message)
        // {
        //     ViewBag.StatusMessage =
        //         message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
        //         : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
        //         : message == ManageMessageId.SetTwoFactorSuccess ? "Your two-factor authentication provider has been set."
        //         : message == ManageMessageId.Error ? "An error has occurred."
        //         : message == ManageMessageId.AddPhoneSuccess ? "Your phone number was added."
        //         : message == ManageMessageId.RemovePhoneSuccess ? "Your phone number was removed."
        //         : "";
        //
        //     var tUser = await _userManager.GetUserAsync(User);
        //     var model = new IndexViewModel
        //     {
        //         HasPassword = true,
        //         PhoneNumber = await _userManager.GetPhoneNumberAsync(tUser),
        //         TwoFactor = await _userManager.GetTwoFactorEnabledAsync(tUser),
        //         Logins = await _userManager.GetLoginsAsync(tUser),
        //         
        //         BrowserRemembered = false
        //     };
        //     return View(model);
        // }

        [DedicatedAdminsAllowed]
        public async Task<ActionResult> DeleteUser(string id)
        {
            var user = DbHandler.Instance.GetUserById(id);
             return View(user);
        }

        [HttpPost("[controller]/[action]")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult>  DeleteUser([FromForm] AspnetUser user)
        {
            var result = await _userManager.FindByIdAsync(user.id);
            await _userManager.DeleteAsync(result);
             ViewBag.Deleted = true;
             return View();
        } 
        
        
        [DedicatedAdminsAllowed]
        public ActionResult ManageAdmins()
        {
            return View();
        }
        
        
        [DedicatedAdminsAllowed]
        public ActionResult ManageUsers()
        {
            var users = DbHandler.Instance.GetAspnetUsers();
            var admins = DbHandler.Instance.GetList<DedicatedAdmin>();
            var list = new List<AspnetUser>();
            foreach (AspnetUser user in users)
            {
                var isAdmin = admins.Any(x => x.userName.Equals(user.UserName,StringComparison.InvariantCultureIgnoreCase));
                if (!isAdmin)
                {
                    list.Add(user);
                }
            }
            return View(list);
        }
        
        [DedicatedAdminsAllowed]
        public ActionResult ManageRoles()
        {
            var username = Request.Query["username"].FirstOrDefault();
            if (string.IsNullOrEmpty(username))
            {
                return   RedirectToAction(nameof(ManageController.ManageUsers), "Manage");
            }
            var admin = DbHandler.Instance.GetDedicatedAdminByUserName(username);
            if (admin != null)
            {
                return   RedirectToAction(nameof(ManageController.ManageAdmins), "Manage");
            }
            var user = new AspnetUser() {UserName = username, email = username};
            return View(user); 
        }

 
        //
        // GET: /Manage/ChangePassword
        // public ActionResult ChangePassword()
        // {
        //     return View();
        // }

        //
        // POST: /Manage/ChangePassword
        // [HttpPost]
        // [ValidateAntiForgeryToken]
        // public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        // {
        //     if (!ModelState.IsValid)
        //     {
        //         return View(model);
        //     }
        //     var tUser = await _userManager.GetUserAsync(User);
        //     var result = await _userManager.ChangePasswordAsync(tUser, model.OldPassword, model.NewPassword);
        //     if (result.Succeeded)
        //     {
        //         var user = await _userManager.FindByIdAsync(tUser.Id);
        //         if (user != null)
        //         {
        //             await _signInManager.SignInAsync(user, isPersistent: false);
        //         }
        //         return RedirectToAction("Index", new { Message = ManageMessageId.ChangePasswordSuccess });
        //     }
        //     AddErrors(result);
        //     return View(model);
        // }

        

        // //
        // // GET: /Manage/ManageLogins
        // public async Task<ActionResult> ManageLogins(ManageMessageId? message)
        // {
        //     ViewBag.StatusMessage =
        //         message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
        //         : message == ManageMessageId.Error ? "An error has occurred."
        //         : "";
        //     var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
        //     if (user == null)
        //     {
        //         return View("Error");
        //     }
        //     var userLogins = await UserManager.GetLoginsAsync(User.Identity.GetUserId());
        //     var otherLogins = AuthenticationManager.GetExternalAuthenticationTypes().Where(auth => userLogins.All(ul => auth.AuthenticationType != ul.LoginProvider)).ToList();
        //     ViewBag.ShowRemoveButton = user.PasswordHash != null || userLogins.Count > 1;
        //     return View(new ManageLoginsViewModel
        //     {
        //         CurrentLogins = userLogins,
        //         OtherLogins = otherLogins
        //     });
        // }

        // //
        // // POST: /Manage/LinkLogin
        // [HttpPost]
        // [ValidateAntiForgeryToken]
        // public ActionResult LinkLogin(string provider)
        // {
        //     // Request a redirect to the external login provider to link a login for the current user
        //     return new AccountController.ChallengeResult(provider, Url.Action("LinkLoginCallback", "Manage"), User.Identity.GetUserId());
        // }

        // //
        // // GET: /Manage/LinkLoginCallback
        // public async Task<ActionResult> LinkLoginCallback()
        // {
        //     var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
        //     if (loginInfo == null)
        //     {
        //         return RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
        //     }
        //     var result = await _userManager.AddLoginAsync(User.Identity.GetUserId(), loginInfo.Login);
        //     return result.Succeeded ? RedirectToAction("ManageLogins") : RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
        // }

 

#region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

                  
        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(string.Empty, error.Description);
            }
        }
         
        public enum ManageMessageId
        {
            AddPhoneSuccess,
            ChangePasswordSuccess,
            SetTwoFactorSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            RemovePhoneSuccess,
            Error
        }

#endregion
    }
}