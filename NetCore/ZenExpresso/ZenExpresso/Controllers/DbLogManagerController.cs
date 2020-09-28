using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using ZenExpresso.Models;
using ZenExpressoCore;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
    public class DbLogManagerController :Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [System.Web.Mvc.HttpGet]
        public ActionResult ListApps()
        {
            var vm = new DbLogManagerViewModel();
            vm.appLogs = DbHandler.Instance.GetLogManagements();
            return View(vm);
        }

        [System.Web.Mvc.HttpGet]
        public ActionResult DeleteApp(int id)
        {
            var appLog = DbHandler.Instance.GetLogManagerById(id);
            return View(appLog);
        }

        [System.Web.Mvc.HttpPost]
        public ActionResult DeleteApp([FromBody]LogManagement data)
        {
            var deleted = DbHandler.Instance.DeleteLogAppById(data.id);
            if (deleted)
            {
                ViewBag.Message = "Data successufully deleted";
                ViewBag.Deleted = true;
            }
            return View(data);
        }

        [System.Web.Mvc.HttpGet]
        public ActionResult ClearLogs(int id)
        {
            var appLog = DbHandler.Instance.GetLogManagerById(id);
            return View(appLog);
        }

        [System.Web.Mvc.HttpPost]
        public ActionResult ClearLogs([FromBody]LogManagement data)
        {
            var appLog = DbHandler.Instance.GetLogManagerById(data.id);
            string sqlQuery = appLog.GetClearLogQuery();
            var affected = DbHandler.Instance.ExecuteScalarOnLogApp(sqlQuery, appLog);
            ViewBag.Message = "Logs Cleared successfully";
            ViewBag.Deleted = true;
            return View(data);
        }

        [System.Web.Mvc.HttpGet]
        public ActionResult SearchLogs(int id)
        {
            var appLog = DbHandler.Instance.GetLogManagerById(id);
            return View(appLog);
        }
    }
}