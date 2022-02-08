using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SupportSystem
{
    public class DbConnection
    {
        public DbConnection()
        {
        }
        // Code below allows us to connect Database 
        public SqlConnection Connect()
        {
            SqlConnection connect = new SqlConnection(@"Server=DESKTOP-TIRV6AC ;Database=SupportSystemDb;Trusted_Connection=True;Connect Timeout =30;MultipleActiveResultSets=True;");
            connect.Open();
            return connect;

        }
    }
}