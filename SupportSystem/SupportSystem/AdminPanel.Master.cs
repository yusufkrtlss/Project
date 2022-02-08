using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class AdminPanel : System.Web.UI.MasterPage
    {
        DbConnection connection = new DbConnection();  
        protected void Page_Load(object sender, EventArgs e)
        {

            // masterların loadında rol kontrolü yapıyorduk ya
            // şimdi mail ve password kontrolü de ekle ona 

            HttpCookie reqCookies = Request.Cookies["USER"];
            HttpCookie forMail = Request.Cookies["cerezdosyam"];
            //forMail den mail ve şifreyi oku eğer vtdeki değerle doğruysa ve rolü 1 se admin
            // aynı şekilde şifre ve mail kontrolü rol 2 ise personel


            if (reqCookies != null)
            {
                SqlConnection conn = connection.Connect();
                SqlCommand sqlCommand = new SqlCommand("Select * from Users where Email=@EM", conn);
                //login yapılmamış şuan ondan mail boş sanırım oldu şuan
                sqlCommand.Parameters.AddWithValue("@EM", forMail["Email"].ToString());
                SqlDataReader reader = sqlCommand.ExecuteReader();
                while (reader.Read())
                {
                    if (reqCookies["ROLE"].ToString() == "1"  && forMail["Password"].ToString() == reader["Password"].ToString())
                    {
                        Label1.Text = reader["Name"].ToString() + " " + reader["LastName"].ToString();
                    }
                    else
                    {
                        conn.Close();
                        Response.Redirect("login.aspx");
                    }

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