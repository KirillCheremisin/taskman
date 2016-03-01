using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Objects;
using System.Data.Entity;

namespace MyMVCApp.Models
{
    public static class DataLayer
    {
        public static MySuperDuperProjectEntities db;

        public static void init() 
        {
            if (db == null) { db = new MySuperDuperProjectEntities(); }
        }
    }
}