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

        public static async Task CustomSignInWithAdditionalClaimsAsync<TIdentityUser>(this SignInManager<TIdentityUser> signInManager, TIdentityUser user, bool isPersistent) where TIdentityUser : IdentityUser
        {
            var claimsPrincipal = await signInManager.CreateUserPrincipalAsync(user);
            await signInManager.Context.SignInAsync(IdentityConstants.ApplicationScheme,
                claimsPrincipal,
                new AuthenticationProperties { IsPersistent = isPersistent });
             
        }

        public static  List<Claim> GetUserClaims(string userName)
        {
            List<Claim> claims = new List<Claim>();
            var dedicatedeAdmins = MemDb.Instance.GetDedicatedAdmins();
            bool isAdmin = dedicatedeAdmins.Any(x => x.userName.ToLower() == userName.ToLower());
            if (isAdmin)
            {
                claims.Add(new Claim(ClaimTypes.Role, "Admin"));
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