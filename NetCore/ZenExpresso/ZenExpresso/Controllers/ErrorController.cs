using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;

namespace ZenExpresso.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult Index()
        {
           //if (Session["data"] != null)
           // {
           //     ViewBag.Description = Session["data"];
           // }
            return View();
        }
        public ActionResult NotFound()
        {
            return View();
        }
    }
}