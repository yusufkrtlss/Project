using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAllMails();
        }

        public void GetAllMails()
        {
            SqlConnection conn = connection.Connect();

            SqlCommand cmd = new SqlCommand("select Mails.ID, Mails.Title, Mails.Date, Category.CategoryName, Mails.ReadStatus from Mails join Category on Mails.CategoryID = Category.ID", conn);
            
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            MailRepeater.DataSource = sqlDataReader;
            MailRepeater.DataBind();

            conn.Close();
        }
    }
}