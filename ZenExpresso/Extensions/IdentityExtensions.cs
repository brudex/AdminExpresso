using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using ZenExpresso.Helpers;
using ZenExpresso.Models;
using ZenExpressoCore.Models;

namespace ZenExpresso
{
    public static class IdentityExtensions
    {
        public static bool IsAdmin(this IPrincipal user)
        {
            var identity = (ClaimsIdentity)user.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var roleClaims = claims.Where(x => x.Type == ClaimTypes.Role).ToList();
            if(!roleClaims.Any()){
                roleClaims = GetUserClaims(user.Identity.Name);
            }
            if (roleClaims.Any(x => x.Value == "Admin"))
            {
                return true;
            } 
            return false;
        }

          
        public static DedicatedAdmin GetPreviledges(this IPrincipal user)
        {
            Console.Write("The Current UserName is >>", user.Identity.Name);
            var identity = (ClaimsIdentity)user.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var roleClaims = claims.Where(x => x.Type == ClaimTypes.Role).ToList();

            if (!roleClaims.Any())
            {
                roleClaims = GetUserClaims(user.Identity.Name);
            }
            var admin = new DedicatedAdmin();

            if (roleClaims.Any(x => x.Value == "Admin"))
            {
                admin.fullName = user.Identity.Name;
                admin.userName = user.Identity.Name;
               
            }
            if (roleClaims.Any(x => x.Value == "canCreateTask"))
            {
                admin.canCreateTask = true;
            }
            if (roleClaims.Any(x => x.Value == "canCreateAdmin"))
            {
                admin.canCreateAdmin = true;
            }
            if (roleClaims.Any(x => x.Value == "canCreateUser"))
            {
                admin.canCreateUser = true;
            }
            if (roleClaims.Any(x => x.Value == "canManageUserRoles"))
            {
                admin.canManageUserRoles = true;
            }
            if (roleClaims.Any(x => x.Value == "canManageLogs"))
            {
                admin.canManageLogs = true;
            }
            return admin;
        }

        public static async Task CustomSignInWithAdditionalClaimsAsync<TIdentityUser>(this SignInManager<TIdentityUser> signInManager, TIdentityUser user, bool isPersistent) where TIdentityUser : IdentityUser
        {
            var claimsPrincipal = await signInManager.CreateUserPrincipalAsync(user);
            Console.WriteLine("The PrincipalUser", user.Email);
            await signInManager.Context.SignInAsync(IdentityConstants.ApplicationScheme,
                claimsPrincipal,new AuthenticationProperties { IsPersistent = isPersistent });
             
        }

        public static  List<Claim> GetUserClaims(string userName)
        {
            Console.WriteLine("The username is >>", userName);
            List<Claim> claims = new List<Claim>();
            var dedicatedeAdmins = MemDb.Instance.GetDedicatedAdmins();
            var admin = dedicatedeAdmins.FirstOrDefault(x => x.userName.ToLower() == userName.ToLower());
            if (admin!=null)
            {
                claims.Add(new Claim(ClaimTypes.Role, "Admin"));
                if (admin.canCreateTask)
                {
                    claims.Add(new Claim(ClaimTypes.Role, "canCreateTask"));
                }
                if (admin.canCreateAdmin)
                {
                    claims.Add(new Claim(ClaimTypes.Role, "canCreateAdmin"));
                }
                if (admin.canManageUserRoles)
                {
                    claims.Add(new Claim(ClaimTypes.Role, "canManageUserRoles"));
                }
                if (admin.canCreateUser)
                {
                    claims.Add(new Claim(ClaimTypes.Role, "canCreateUser"));
                }
                if (admin.canManageLogs)
                {
                    claims.Add(new Claim(ClaimTypes.Role, "canManageLogs"));
                }
            }
                
            return claims;
        }

        
         
 

}


    public class CustomClaimsPrincipalFactory : UserClaimsPrincipalFactory<ApplicationUser>
    {
        public CustomClaimsPrincipalFactory(
            UserManager<ApplicationUser> userManager,
            IOptions<IdentityOptions> optionsAccessor)
            : base(userManager, optionsAccessor)
        {
        }

        protected override async Task<ClaimsIdentity> GenerateClaimsAsync(ApplicationUser user)
        {
            var identity = await base.GenerateClaimsAsync(user);
            //identity.AddClaim(new Claim("ContactName", user.ContactName ?? "[Click to edit profile]"));
            string userName = user.UserName;
            var claims = IdentityExtensions.GetUserClaims(userName);
            claims.ForEach(c=>identity.AddClaim(c));
            return identity;
        }
    }
}