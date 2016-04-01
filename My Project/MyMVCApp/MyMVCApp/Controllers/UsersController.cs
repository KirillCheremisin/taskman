using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCApp.Models;
using System.Windows.Forms;
using System.Data.Objects;
using System.Data.Entity;


namespace MyMVCApp.Controllers
{
    [Authorize(Roles = "adm")]
    public class UsersController : Controller
    {
        //
        // GET: /Users/

        public ActionResult Index()
        {
            IEnumerable<Employee> _user = DataLayer.db.Employee
                .OrderBy(user => user.EmployeeID)
                .Select(user => user);
            return View(_user);
        }

        //
        // GET: /Users/Details/5

        public ActionResult Profile(int id)
        {
            Employee _user = DataLayer.db.Employee
                .Where(user => user.EmployeeID == id)
                .Select(user => user)
                .FirstOrDefault();
            return View(_user);
        }

        //
        // GET: /Users/Create

        public ActionResult Create()
        {
            return View(new Employee());
        } 

        //
        // POST: /Users/Create

        [HttpPost]
        public ActionResult Create(Employee _user)
        {
            if (ModelState.IsValid) 
            {
                _user.Password = MyMVCApp.Security.SecurityManager.HashPassword(_user.Password);
                DataLayer.db.Employee.Add(_user);
                DataLayer.db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View(_user); 
            }
        }
        
        //
        // GET: /Users/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Users/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, System.Web.Mvc.FormCollection collection)
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
        // POST: /Users/Delete/5

        [HttpPost]
        public void Delete(Int32 id)
        {
            //id = id.Replace('{', ' ');
            //id = id.Replace('}', ' ');
            //id = id.Trim();
            //Int32 ident = Int32.Parse(id);
            Int32 ident = id;
            MyMVCApp.Models.Employee _user = DataLayer.db.Employee
                .Where(user => user.EmployeeID == ident)
                .Select(user => user)
                .FirstOrDefault();
            if (_user != null)
            {
                DataLayer.db.Employee.Remove(_user);
                DataLayer.db.SaveChanges();
            }

            //if (id != null)
            //{
            //    MessageBox.Show(id.ToString());
            //    MessageBox.Show(ident.ToString());
            //    MessageBox.Show(_user.Email.ToString());
            //}
            //else
            //    MessageBox.Show("null");

        }

        //
        // POST: /Users/Delete/5

        //[HttpPost]
        //public ActionResult Delete(int id, System.Web.Mvc.FormCollection collection)
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
