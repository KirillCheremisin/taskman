using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Web.Mvc;

namespace MyMVCApp.Models
{
    public class ChangePasswordPageView
    {
        [HiddenInput(DisplayValue = false)]
        public int UserID { get; set; }

        [HiddenInput(DisplayValue = false)]
        public string UserName { get; set; }

        [HiddenInput(DisplayValue = false)]
        public string UserSurname { get; set; }

        [DisplayName("New Password")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Please enter Password")]
        public string Password { get; set; }

        [DisplayName("New Password Confirm")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Please enter Password Confirm")]
        public string PasswordConfirm { get; set; }
    }
}