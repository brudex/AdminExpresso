using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using ZenExpresso.Helpers;
using ZenExpresso.Models;

namespace ZenExpresso
{
    public static class IdentityExtensions
    {
        public static bool IsAdmin(this IPrincipal user)
        {
            var identity = (ClaimsIdentity)user.Identity;
            IEnumerable<Claim> claims = identity.Claims;
            var roleClaims = claims.Where(x => x.Type == ClaimTypes.Role).ToList();
            if (roleClaims.Any(x => x.Value == "Admin"))
            {
                return true;
            }
            return false;
        }

        public static async Task CustomSignInWithAdditionalClaimsAsync(this ApplicationSignInManager signInManager, ApplicationUser user, bool isPersistent)  
        { 
            var claims = GetUserClaims(user.UserName);
            foreach (var claim in claims)
            {
                user.Claims.Add(claim);
            }
            await signInManager.SignInAsync(user, isPersistent, true); 
        }

        public static List<IdentityUserClaim> GetUserClaims(string userName)
        {
            List<IdentityUserClaim> claims = new List<IdentityUserClaim>();
            var dedicatedeAdmins = MemDb.Instance.GetDedicatedAdmins();
            bool isAdmin = dedicatedeAdmins.Any(x => x.userName.ToLower() == userName.ToLower());
            if (isAdmin)
            {
                var claim =new IdentityUserClaim();
                claim.ClaimType = ClaimTypes.Role;
                claim.ClaimValue = "Admin";
                claims.Add(claim);
            }
            return claims;
        }


    }
}