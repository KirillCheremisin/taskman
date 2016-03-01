using System.Web.Mvc;
using System.Web.Security;
using MyMVCApp.Models;
using MyMVCApp.Security;
using System.Windows.Forms;

namespace MyMVCApp.Controllers
{
    public class SecurityController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Login()
        {
            Response.StatusCode = 401;
            return View(new LoginPageView());
        }

        [HttpPost]
        public ActionResult Login(LoginPageView loginData, string returnUrl = "/") 
        {
            if (ModelState.IsValid)
            {
                if (SecurityManager.ValidateUser(loginData.Login, loginData.Password))
                {
                    FormsAuthentication.SetAuthCookie(loginData.Login, false);
                    return RedirectToAction("Index", "MyPage");
                    //return RedirectToAction("Index", "Projects");
                }
                else
                {
                    ModelState.AddModelError("Login", "Login or password is incorrect");
                    ModelState.AddModelError("Password", "Login or password is incorrect");
                }
            }
                return View(loginData);
        }

        public ActionResult Logout() 
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", new { returnUrl = "/"});
        }

    }
}
