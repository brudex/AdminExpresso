using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ZenExpresso.Helpers;
using ZenExpressoCore;
using ZenExpressoCore.Models;

namespace ZenExpresso.Controllers
{
    [Route("api/[controller]/[action]")]
    public class SetupApiController : Controller
    {
        // GET: Settings
        [HttpGet]
        public ServiceResponse GetMenuList()
        {
            var response = new ServiceResponse();
            var list = DbHandler.Instance.GetList<TopMenu>();
            response.status = "00";
            response.message = "Success";
            response.data = list;
            return response;
        }

        [HttpPost]
        public ServiceResponse SaveMenu([FromBody]JObject data)
        {
            var Menu = new TopMenu();
            Menu.menuName = data["menuName"].ToStringOrEmpty();
            Menu.menuOrder = data["menuOrder"].ToInteger();
            DbHandler.Instance.Save(Menu);
            MemDb.Instance.ReloadMenus();
            var response = new ServiceResponse();
            response.status = "00";
            response.message = "Success";
            return response;
        }


        [HttpPost]
        public ServiceResponse DeleteMenu([FromBody]JObject data)
        { 
            int id = data["id"].ToInteger();
            DbHandler.Instance.DeleteTopMenuById(id);
            MemDb.Instance.ReloadMenus();
            var response = new ServiceResponse();
            response.status = "00";
            response.message = "Success";
            return response;
        }

        /***************************************************DataSources***************************************/ 

        public ServiceResponse GetDataSources()
        {

            var response = new ServiceResponse();
            var list = DbHandler.Instance.GetList<DataSource>();
            response.status = "00";
            response.message = "Success";
            response.data = list;
            return response;
        }

        [HttpPost]
        public ServiceResponse SaveDataSource([FromBody]JObject data)
        {
            var dataSource = JsonConvert.DeserializeObject<DataSource>(data.ToString());
            if (dataSource.Id > 0)
            {
                DbHandler.Instance.Update(dataSource);
            }
            else
            {
                DbHandler.Instance.Save(dataSource);
            }

            MemDb.Instance.ReloadDataSources();
            var response = new ServiceResponse();
            response.status = "00";
            response.message = "Success";
            return response;
        }


        [HttpPost]
        public ServiceResponse DeleteDataSource([FromBody]JObject data)
        {

            int id = data["id"].ToInteger();
            DbHandler.Instance.DeleteDataSourceById(id);
            MemDb.Instance.ReloadMenus();
            var response = new ServiceResponse();
            response.status = "00";
            response.message = "Success";
            return response;
        }

        /******************************************************Admin****************************/
        [HttpGet]
        public ServiceResponse GetAdminList()
        {
            var response = new ServiceResponse();
            var list = DbHandler.Instance.GetList<DedicatedAdmin>();
            response.status = "00";
            response.message = "Success";
            response.data = list;
            return response;
        }

        [HttpPost]
        public ServiceResponse SaveDedicatedAdmin([FromBody]JObject data)
        {
            var admin = new DedicatedAdmin();
            admin.userName = data["userName"].ToStringOrEmpty();
            admin.fullName = data["fullName"].ToStringOrEmpty();
            DbHandler.Instance.Save(admin);
            MemDb.Instance.ReloadAdmins();
            var response = new ServiceResponse();
            response.status = "00";
            response.message = "Success";
            return response;
        }

        [HttpPost]
        public ServiceResponse SetDedicatedAdminPreviledges([FromBody] DedicatedAdmin admin)
        {
            DbHandler.Instance.UpdateAdmin(admin);
            MemDb.Instance.ReloadAdmins();
            var response = new ServiceResponse();
            response.status = "00";
            response.message = "Success: Previledges Updated";
            return response;
        }


        [HttpPost]
        public ServiceResponse DeleteAdmin([FromBody]JObject data)
        {
            int id = data["id"].ToInteger();
            DbHandler.Instance.DeleteAdminById(id);
            MemDb.Instance.ReloadAdmins();
            var response = new ServiceResponse();
            response.status = "00";
            response.message = "Success";
            return response;
        }


        [HttpGet]
        public ServiceResponse GetUsersList()
        {
            var list = DbHandler.Instance.GetUsersList();
            var response = new ServiceResponse();
            response.status = "00";
            response.data = list;
            return response;
        }

    }
}