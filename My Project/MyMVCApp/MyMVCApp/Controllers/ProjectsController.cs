using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCApp.Models;

namespace MyMVCApp.Controllers
{
    [Authorize(Roles = "adm,manager")]
    public class ProjectsController : Controller
    {
        //
        // GET: /Projects/
        
        public ActionResult Index()
        {
            IEnumerable<Project> prj = DataLayer.db.Project
                .OrderBy(proj => proj.ProjectID)
                .Select(proj => proj);
            return View(prj);
        }
        
        public JsonResult List()
        {
            JsonResult Result = new JsonResult();
            JsonResult Result2 = new JsonResult();
            var q = from p in DataLayer.db.Project
                    join u in DataLayer.db.User on  p.AuthorID equals u.UserID
                    select new { ProjectId = p.ProjectID, Name = p.Name, Descr = p.Description, Author = u.UserName + u.UserSurname, CreateDate = p.CrateDate };
            Result.Data = new
            {
                @callback = "ProjectsList",
                @data = q,
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
            Result2.Data = new
            {
                @callback = "ProjectsList",
                @data = DataLayer.db.Project
                    .Select(p => new {p.ProjectID, p.Name, p.Description, p.AuthorID, p.CrateDate})
            };
            return Result2;
        }

        //
        // GET: /Projects/Details/5

        public ActionResult Details(Int32 id)
        {
            Project _project = DataLayer.db.Project
                .Where(proj => proj.ProjectID == id)
                .Select(proj => proj)
                .FirstOrDefault();

            if (_project != null) 
            {
                return View(_project);
            }
            else
            {
                return View("Deleted");
            }
            
        }

        //
        // GET: /Projects/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Projects/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Projects/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Projects/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Projects/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Projects/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
