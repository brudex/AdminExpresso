using System;
using System.Web.Mvc;
using System.Web.Mvc.Filters;

namespace ZenExpresso
{
    public class DedicatedAdminsAllowed : ActionFilterAttribute, IAuthenticationFilter
    {
        public void OnAuthentication(AuthenticationContext filterContext)
        {
           
        }

        public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        {
            var user = filterContext.HttpContext.User;
            if (user != null )
            {
                if (!user.IsAdmin())
                {
                    filterContext.Result = new HttpUnauthorizedResult();
                }

            }
            else
            {
                filterContext.Result = new HttpUnauthorizedResult();
            }
        }
    }
}