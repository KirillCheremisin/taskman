using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCApp.Models;

namespace MyMVCApp.Controllers
{
    [HandleError]
    [Authorize(Roles = "adm,manager")]
    public class MyPageController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            ViewData.Add("Name", Security.SecurityManager.GetUserInfo(HttpContext.User.Identity.Name).EmployeeName);
            ViewData.Add("Surname", Security.SecurityManager.GetUserInfo(HttpContext.User.Identity.Name).EmployeeSurname);

            IEnumerable<Project> _project = DataLayer.db.Project
                .OrderBy(proj => proj.ProjectID)
                .Select(proj => proj);

            return View(_project);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
