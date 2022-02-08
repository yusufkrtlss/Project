using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = connection.Connect();
            SqlCommand cmd = new SqlCommand("Select Mails.Title as Title, Mails.Detail as Detail, Category.CategoryName as CategoryName, Mails.Date as Date from Mails Join Category on Mails.CategoryID = Category.ID", conn);

            SqlDataReader reader = cmd.ExecuteReader();

            DetailRepeater.DataSource = reader;
            DetailRepeater.DataBind();

            conn.Close();
        }
    }
}