using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCApp.Models;
using System.Data.Entity;
using System.Data;
using System.Windows.Forms;
using System.Web.Security;

namespace MyMVCApp.Controllers
{
    [Authorize(Roles = "adm,manager")]
    public class TasksController : Controller
    {
        //
        // GET: /Tasks/

        public ActionResult Index()
        {
            IEnumerable<Task> _task = DataLayer.db.Task
                .OrderBy(task => task.ProjectID)
                .OrderBy(task => task.TaskID)
                .Select(task => task);
            return View(_task);
        }

        //
        // GET: /Tasks/Details/5

        public ActionResult Details(int id)
        {
            Task _task = DataLayer.db.Task
               .Where(task => task.TaskID == id)
               .Select(task => task)
               .FirstOrDefault();
            if (_task != null)
            {
                return View(_task);
            }
            else
            {
                return View("Deleted");
            }
        }

        //
        // GET: /Tasks/Create

        public ActionResult Create()
        {
            IEnumerable<SelectListItem> _projects = DataLayer.db.Project
                .Select(proj => new SelectListItem 
                {
                    Selected = true,
                    Text = proj.Name,
                    Value = System.Data.Objects.SqlClient.SqlFunctions.StringConvert((Double)proj.ProjectID)
                });
            ViewData.Add("proj", _projects);
            IEnumerable<SelectListItem> _users = DataLayer.db.User
                .Select(user => new SelectListItem
                {
                    Selected = true,
                    Text = user.UserName + " " + user.UserSurname,
                    Value = System.Data.Objects.SqlClient.SqlFunctions.StringConvert((Double)user.UserID)
                });
            ViewData.Add("users", _users);
            return View(new Task());
        } 

        //
        // POST: /Tasks/Create

        [HttpPost]
        public ActionResult Create(Task _task)
        {

            if (ModelState.IsValid)
            {
                _task.CreateDate = DateTime.Now;
                //_task.AuthorID = CurrentUserID  описать
                //_task.AuthorID = 9; //изменить
                _task.AuthorID = MyMVCApp.Security.SecurityManager.GetUserInfo(HttpContext.User.Identity.Name).UserID;
                if (_task.AssignedToID != 8)
                {
                    _task.StatusID = 2; //assigned
                }
                else
                {
                    _task.StatusID = 1; //created
                }
                _task.ConditionID = 1;
                //+nav prop
                #region nav prop
                _task.Author = DataLayer.db.User
                    .Where(user => user.UserID == _task.AuthorID)
                    .Select(user => user)
                    .FirstOrDefault();
                _task.AssignedTo = DataLayer.db.User
                    .Where(user => user.UserID == _task.AssignedToID)
                    .Select(user => user)
                    .FirstOrDefault();
                _task.Condition = DataLayer.db.Condition
                    .Where(con => con.ConditionID == _task.ConditionID)
                    .Select(con => con)
                    .FirstOrDefault();
                _task.Project = DataLayer.db.Project
                    .Where(proj => proj.ProjectID == _task.ProjectID)
                    .Select(proJ => proJ)
                    .FirstOrDefault();
                _task.Status = DataLayer.db.Status
                    .Where(stat => stat.StatusID == _task.StatusID)
                    .Select(stat => stat)
                    .FirstOrDefault();
                #endregion
                //-nav prop
                DataLayer.db.Task.Add(_task);
                DataLayer.db.SaveChanges();
                //MessageBox.Show("projectID = " + _task.ProjectID.ToString());
                //MessageBox.Show("AssignedToID = " + _task.AssignedToID.ToString());
                //MessageBox.Show("AuthorID = " + _task.AuthorID.ToString());
                //MessageBox.Show("StatusID = " + _task.StatusID.ToString());
                //MessageBox.Show("ConditionID = " + _task.ConditionID.ToString());
                //MessageBox.Show("Condition " + _task.Condition.ConditionName);
                //MessageBox.Show("Status " + _task.Status.StatusName);
                //MessageBox.Show("Project " + _task.Project.Name);
                //MessageBox.Show("Author name " + _task.Author.UserName);
                //MessageBox.Show("Assigned to " + _task.AssignedTo.UserName);
                //MessageBox.Show(_task.Name + " " + _task.Description);
                return RedirectToAction("Index");
            }
            else
            {
                return View(_task);
            }
        }
        
        //
        // GET: /Tasks/Edit/5
 
        public ActionResult Edit(int id)
        {
            Task _task = DataLayer.db.Task
                .Where(task => task.TaskID == id)
                .Select(task => task)
                .FirstOrDefault();
            IEnumerable<SelectListItem> _projects = DataLayer.db.Project
                .Select(proj => new SelectListItem
                {
                    Selected = true,
                    Text = proj.Name,
                    Value = System.Data.Objects.SqlClient.SqlFunctions.StringConvert((Double)proj.ProjectID)
                });
            ViewData.Add("proj", _projects);
            IEnumerable<SelectListItem> _assign = DataLayer.db.User
                .Select(assign => new SelectListItem
                {
                    Selected = true,
                    Text = assign.UserName + " " + assign.UserSurname,
                    Value = System.Data.Objects.SqlClient.SqlFunctions.StringConvert((Double)assign.UserID)
                });
            ViewData.Add("assign", _assign);
            IEnumerable<SelectListItem> _con = DataLayer.db.Condition
                .Select(con => new SelectListItem
                {
                    Selected = true,
                    Text = con.ConditionName,
                    Value = System.Data.Objects.SqlClient.SqlFunctions.StringConvert((Double)con.ConditionID)
                });
            ViewData.Add("condition", _con);
            return View(_task);
        }

        //
        // POST: /Tasks/Edit/5

        [HttpPost]
        public ActionResult Edit(Task _task)
        {
            if (ModelState.IsValid)
            {
                Task _curtask = DataLayer.db.Task
                    .Where(task => task.TaskID == _task.TaskID)
                    .Select(task => task)
                    .FirstOrDefault();
                //DataLayer.db.Task.Add(_task);
                DataLayer.db.Entry(_curtask).CurrentValues.SetValues(_task);
                DataLayer.db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View(_task);
            }
        }

        //
        // post: /Tasks/Delete/5

        [HttpPost]
        public ActionResult Delete(int id)
        {
            Task _task = DataLayer.db.Task
               .Where(task => task.TaskID == id)
               .Select(task => task)
               .FirstOrDefault();
            if (_task != null) 
            {
                DataLayer.db.Task.Remove(_task);
                DataLayer.db.SaveChanges();
            }
            IEnumerable<Task> _tasks = DataLayer.db.Task
                .OrderBy(task => task.ProjectID)
                .OrderBy(task => task.TaskID)
                .Select(task => task);
            return RedirectToAction("Index");
        }

        //
        // POST: /Tasks/Delete/5

        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here
 
        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}
