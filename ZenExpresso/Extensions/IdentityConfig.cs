using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Security.Principal;

using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using ZenExpresso.Helpers;
using ZenExpresso.Models;
using ZenExpressoCore;

namespace ZenExpresso
{

    public enum SignInStatus
    {
        /// <summary>Sign in was successful</summary>
        Success,
        /// <summary>User is locked out</summary>
        LockedOut,
        /// <summary>
        /// Sign in requires addition verification (i.e. two factor)
        /// </summary>
        RequiresVerification,
        /// <summary>Sign in failed</summary>
        Failure,
    }
    // Configure the application user manager used in this application. UserManager is defined in ASP.NET Identity and is used by the application.

    // Configure the application sign-in manager which is used in this application.
    public class WindowsSignInManager 
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public WindowsSignInManager(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager)
            
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        public  async Task<ClaimsPrincipal> CreateUserIdentityAsync(ApplicationUser user)
        {
           return await _signInManager.CreateUserPrincipalAsync(user);
        }

       
        public async Task<SignInStatus> WindowsLoginAsync(string userName, string password, bool isPersistent)
        {
            var signInStatus = SignInStatus.Failure;
            using (var context = new PrincipalContext(ContextType.Domain, "ZENITH.ZENITHBANK.COM.GH"))
            {
                var valid = context.ValidateCredentials(userName, password);
                if (valid)
                {
                    UserPrincipal userPrincipal = UserPrincipal.FindByIdentity(context, userName);
                    
                    if (userPrincipal != null)
                    {
                       
                         
                        var user = await _userManager.FindByNameAsync(userName);
                        if (user == null)
                        {
                            //first time login, create local account with no password.
                            user = new ApplicationUser { UserName = userName, Email = userPrincipal.EmailAddress };
                            try
                            {
                                await _userManager.CreateAsync(user);  
                            }
                            catch (Exception ex)
                            {
                                Logger.Error(this, ex);
                            }
                             
                        }
                        var claimsPrincipal = await CreateUserIdentityAsync(user);
                        if (claimsPrincipal?.Identity is ClaimsIdentity claimsIdentity)
                        {
                            var claims = GetUserClaims(userName);
                            claimsIdentity.AddClaims(claims);
                        }
                        
                        await _signInManager.Context.SignInAsync(IdentityConstants.ApplicationScheme, claimsPrincipal,                new AuthenticationProperties { IsPersistent = isPersistent });
                        Logger.Info(this,"User signed in>>"+userName);
                        return SignInStatus.Success;
                    }
                }
            }
            return signInStatus;
        }

        private List<Claim> GetUserClaims(string userName)
        {
            
            List<Claim> claims = new List<Claim>();
            using (var principalContext = new PrincipalContext(ContextType.Domain, "ZENITH.ZENITHBANK.COM.GH")) //or ContextType.Machine
            {
                using (UserPrincipal userPrincipal = UserPrincipal.FindByIdentity(principalContext, userName))
                {
                    if (userPrincipal != null)
                    {
                        claims.Add(new Claim(ClaimTypes.Email, userPrincipal.EmailAddress ?? string.Empty));
                        claims.Add(new Claim(ClaimTypes.Surname, userPrincipal.Surname ?? string.Empty));
                        claims.Add(new Claim(ClaimTypes.GivenName, userPrincipal.GivenName ?? string.Empty));

                        var authorizingGroups = userPrincipal.GetAuthorizationGroups();

                        foreach (var authorizingGroup in authorizingGroups)
                        {
                            if (!string.IsNullOrEmpty(authorizingGroup.DisplayName))
                            {
                                claims.Add(new Claim(ClaimTypes.Role, authorizingGroup.DisplayName??string.Empty));

                            }
                        }
                        var dedicatedeAdmins = MemDb.Instance.GetDedicatedAdmins();
                        bool isAdmin = dedicatedeAdmins.Any(x => x.userName == userName);
                        if (isAdmin)
                        {
                            claims.Add(new Claim(ClaimTypes.Role, "Admin"));
                        }
                    }
                }
            }
            return claims;
            
        }
    }
}
