using System;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using MyMVCApp.Models;
using System.Web.Mvc;

namespace MyMVCApp.Security
{
    public class SecurityManager
    {
        public static bool ValidateUser(string username, string password) 
        {
            String PassHash = HashPassword(password);
            User _user = DataLayer.db.User
                .Where(user => user.Login == username && user.Password == PassHash)
                .Select(user => user)
                .FirstOrDefault();
            return _user != null;
        }

        public static User GetUserInfo(string login)
        {
            User _user = DataLayer.db.User
                .Where(user => user.Login == login)
                .Select(user => user)
                .FirstOrDefault();
            return _user;
        }

        public static string[] GetRolesForUser(string login)
        {
            try
            {
                User _user = DataLayer.db.User
                    .Where(user => user.Login == login)
                    .Select(user => user)
                    .FirstOrDefault();

                if (_user != null)
                {
                    return (_user.UserRole.RoleName == "adm") ? new string[] { "adm" } : new string[] { "manager" };
                }
                else
                {
                    return new string[] { };
                }
            }
            catch (Exception e) 
            {
                return new string[] { };
            }
        }

        public static string HashPassword(string password) 
        {
            UnicodeEncoding encoding = new UnicodeEncoding();
            HashAlgorithm hash = HashAlgorithm.Create("MD5");

            if (password != null && encoding != null && hash != null)
            {
                byte[] valueToHash = new byte[encoding.GetByteCount(password)];
                byte[] binaryPassword = encoding.GetBytes(password);
                binaryPassword.CopyTo(valueToHash, 0);
                byte[] hashValue = hash.ComputeHash(valueToHash);
                string hashedPassword = "";
                foreach (byte hexdigit in hashValue)
                {
                    hashedPassword += hexdigit.ToString("X2", CultureInfo.InvariantCulture.NumberFormat);
                }

                return hashedPassword;
            }
            else 
            {
                return null;
            }
        }
    }
}