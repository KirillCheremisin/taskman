using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace MyMVCApp.Models
{
    public partial class LoginPageView
    {
        [DisplayName("Login")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Please enter Login")]
        public string Login { get; set; }

        [DisplayName("Password")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Please enter Password")]
        public string Password { get; set; }
    }
}