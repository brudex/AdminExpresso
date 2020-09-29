using System;
using System.Linq;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace ZenExpresso
{

 

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class DedicatedAdminsAllowedAttribute : ActionFilterAttribute, IAuthorizationFilter
    {
        private readonly string _someFilterParameter;

        public DedicatedAdminsAllowedAttribute()
        {
           // _someFilterParameter = someFilterParameter;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var user = context.HttpContext.User;

            if (!user.Identity.IsAuthenticated)
            {
                // it isn't needed to set unauthorized result 
                // as the base class already requires the user to be authenticated
                // this also makes redirect to a login page work properly
                context.Result = new UnauthorizedResult();
                return;
            }
            // you can also use registered services
            var claims    = context.HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.Role && c.Value == "Admin");
            bool hasClaim = false;
            if(claims.Any()){
                hasClaim= true;
            }else{
                claims = IdentityExtensions.GetUserClaims(context.HttpContext.User.Identity.Name);
                hasClaim =claims.Any(c => c.Type == ClaimTypes.Role && c.Value == "Admin");
            } 
            if (!hasClaim)
            { 
                context.Result = new StatusCodeResult(404);
                return;
            }
            
        }
    }


}