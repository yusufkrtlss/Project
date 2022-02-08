using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
       

        protected void Page_Load(object sender, EventArgs e)
        {
           
            GetAllMails();
        }
        // We can see that all mails of users.
        public void GetAllMails()
        {
            SqlConnection conn = connection.Connect();
            HttpCookie reqCookies = Request.Cookies["USER"];
            HttpCookie forMail = Request.Cookies["cerezdosyam"];
            SqlCommand sqlCommand = new SqlCommand("select  Mails.Title as Title, Mails.Date as Date, Category.CategoryName as CategoryName, Mails.ReadStatus as ReadStatus, Mails.ID from User_Cat_Auth join Users on User_Cat_Auth.UserID = Users.ID join Category on User_Cat_Auth.CategoryID = Category.ID join Mails on Category.ID = Mails.CategoryID where Users.Email = @ID", conn);
            sqlCommand.Parameters.AddWithValue("@ID", forMail["Email"].ToString());

            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

            MailRepeater.DataSource = sqlDataReader;
            MailRepeater.DataBind();

            conn.Close();
        }

      
    }
}