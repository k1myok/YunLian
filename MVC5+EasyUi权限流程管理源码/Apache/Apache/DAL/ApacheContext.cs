using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using Apache.Models;


namespace Apache.DAL
{
    public class ApacheContext : DbContext
    {

        public ApacheContext()
            : base("ApacheConnection")
        {
        }


    }
}