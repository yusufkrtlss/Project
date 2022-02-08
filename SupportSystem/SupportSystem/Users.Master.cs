using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class Users : System.Web.UI.MasterPage
    {
        DbConnection connection = new DbConnection();
        // We can see the user name and last name of the top of right.
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["USER"];
            HttpCookie forMail = Request.Cookies["cerezdosyam"];
            if (reqCookies != null)
            {
                SqlConnection conn = connection.Connect();
                SqlCommand sqlCommand = new SqlCommand("Select * from Users where Email=@EM", conn);
                //login yapılmamış şuan ondan mail boş sanırım oldu şuan
                sqlCommand.Parameters.AddWithValue("@EM", forMail["Email"].ToString());
                SqlDataReader reader = sqlCommand.ExecuteReader();
                while (reader.Read())
                {
                    if (reqCookies["ROLE"].ToString() == "2" && forMail["Password"].ToString()==reader["Password"].ToString())
                    {
                        Label1.Text = reader["Name"].ToString() + " " + reader["LastName"].ToString();
                    }
                    else
                    {
                        conn.Close();
                        Response.Redirect("login.aspx");
                    }
                    //bi label de personel mastera ekle
                    
                }
                conn.Close();





            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            SqlConnection conn = connection.Connect();

            if (Request.Cookies["cerezdosyam"] != null)
            {
                Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
                Response.Redirect("login.aspx");
            }
            else
            {
                // do nothing
            }
        }
    }
}