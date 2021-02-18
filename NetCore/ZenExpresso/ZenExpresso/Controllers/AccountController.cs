using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;
using ZenExpressoCore;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using ZenExpresso.Models;
using System.Linq;

namespace ZenExpresso.Controllers
{

    [Route("[controller]/[action]")]
    public class AccountController : Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ILogger _logger;

        public AccountController(
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



        public string ErrorMessage { get; set; }


        [HttpGet]
        [DedicatedAdminsAllowed]
        public async Task<IActionResult> CreateUser(string returnUrl = null)
        {
            // Clear the existing external cookie to ensure a clean login process
            await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }

        
        [HttpPost]
        public async Task<IActionResult> CreateUser([FromForm]RegisterViewModel model)
        {
            var user = new ApplicationUser
            {
                UserName = model.Email,
                Email = model.Email,
            };
            var result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                _logger.LogInformation("New account with password.");
                ViewBag.Created = true;
                return View();
            }
            else
            {
                if (result.Errors.Any())
                {
                    ViewBag.Error = result.Errors.First().Description;
                }
                ViewBag.Created = false;
            }
            return  View(); ;
        }



        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> Login(string returnUrl = null)
        {
            // Clear the existing external cookie to ensure a clean login process
            await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login([FromForm] LoginViewModel model, string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            bool loginSuccess = false;
            if (SettingsData.LoginMode == Constants.LoginMode.Email)
            {
                loginSuccess = await LoginWithEmail(model);
            }
            else if (SettingsData.LoginMode == Constants.LoginMode.ActiveDirectory)
            {

            }
            if (loginSuccess)
            {
                return RedirectToLocal(returnUrl);
            }
            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public async Task<bool> LoginWithAd(LoginViewModel model)
        {

            var windowsLoginManager = new WindowsSignInManager(_userManager, _signInManager);
            // This doesn't count login failures towards account lockout
            // To enable password failures to trigger account lockout, change to shouldLockout: true
            var result = await windowsLoginManager.WindowsLoginAsync(model.Email, model.Password, model.RememberMe);
            switch (result)
            {
                case SignInStatus.Success:
                    return true;
                case SignInStatus.LockedOut:
                    return false;
                default:
                    return false;

            }
            return false;
        }

        private async Task<bool> LoginWithEmail(LoginViewModel model)
        {
            if (model.Email.IndexOf('@') > -1)
            {
                //Validate email format
                string emailRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                                    @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                                    @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
                Regex re = new Regex(emailRegex);
                if (!re.IsMatch(model.Email))
                {
                    ModelState.AddModelError("Email", "Email is not valid");
                }
            }
            else
            {
                //validate Username format
                string emailRegex = @"^[a-zA-Z0-9]*$";
                Regex re = new Regex(emailRegex);
                if (!re.IsMatch(model.Email))
                {
                    ModelState.AddModelError("", "Username or email is not valid");
                }
            }
            if (ModelState.IsValid)
            {
                var userName = model.Email;
                ApplicationUser user;
                if (userName.IndexOf('@') > -1)
                {

                    user = await _userManager.FindByEmailAsync(model.Email);

                    if (user == null)
                    {
                        ModelState.AddModelError(string.Empty, "Invalid login attempt or account inactive");
                        return false;
                    }
                    else
                    {
                        userName = user.UserName;
                    }
                }
                else
                {
                    user = await _userManager.FindByNameAsync(model.Email);
                }
                // This doesn't count login failures towards account lockout
                // To enable password failures to trigger account lockout, set lockoutOnFailure: true
                var correctPassword = await _userManager.CheckPasswordAsync(user, model.Password);
                if (correctPassword)
                {
                    // var result =  await _signInManager.PasswordSignInAsync(userName, model.Password, model.RememberMe, lockoutOnFailure: false);
                    await _signInManager.CustomSignInWithAdditionalClaimsAsync(user, model.RememberMe);
                    //                    if (result.Succeeded)
                    //                    {
                    //                        _logger.LogInformation("User logged in.");
                    //                        return RedirectToAction("Index", "Home");
                    //                    }
                    _logger.LogInformation("User logged in.");
                    return true;
                }
                //                if(result.RequiresTwoFactor) //todo implement 2 factor authentication
                //                {
                //                    return RedirectToAction(nameof(LoginWith2fa), new { returnUrl, model.RememberMe });
                //                }
                ModelState.AddModelError(string.Empty, "Invalid login attempt or account inactive");
                return false;
            }
            return false;
        }





        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            _logger.LogInformation("User logged out.");
            return RedirectToAction(nameof(AccountController.Login), "Account");
        }


        [HttpGet]
        [AllowAnonymous]
        public IActionResult Lockout()
        {
            return View();
        }



        #region Helpers

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(string.Empty, error.Description);
            }
        }

        private IActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction(nameof(HomeController.Index), "Home");
            }
        }
        #endregion
    }
}