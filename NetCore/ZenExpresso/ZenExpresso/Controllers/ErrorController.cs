using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZenExpresso.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult Index()
        {
           if (Session["data"] != null)
            {
                ViewBag.Description = Session["data"];
            }
            return View();
        }
        public ActionResult NotFound()
        {
            return View();
        }
    }
}