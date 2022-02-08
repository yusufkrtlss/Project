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
    public partial class WebForm6 : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        public byte up;

        // Cookie.
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cerezim = new HttpCookie("cerezdosyam");
            cerezim["Email"] = inputEmailAddress.Value;
            cerezim["Password"] = pass1.Value;
            cerezim.Expires = DateTime.Now.AddDays(10);
            Response.Cookies.Add(cerezim);
            GetProfile();
            
        }
        // Change Password.
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = connection.Connect();

            SqlCommand sqlCommand = new SqlCommand("Select * from Users", conn);


            SqlDataReader reader = sqlCommand.ExecuteReader();
            while (reader.Read())
            {
                if (inputEmailAddress.Value == reader["Email"].ToString())
                {
                    up = 1;
                }
            }
            reader.Close();
            conn.Close();
            if (up == 1)
            {
                SqlConnection conn1 = connection.Connect();
                SqlCommand sqlCommand1 = new SqlCommand("update Users set Password=@Password where Email=@EM", conn1);
                sqlCommand1.Parameters.AddWithValue("@EM", inputEmailAddress.Value);
                sqlCommand1.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar, 50));
                sqlCommand1.Parameters["@Password"].Value = pass2.Value;
                if(pass2.Value == pass3.Value)
                {
                    lbl_msg.Text = "same password";
                }
                else
                {
                    lbl_msg.Text = "not same password";
                }
                sqlCommand1.ExecuteNonQuery();
                conn1.Close();
                lbl_msg.Text = "Password changed Successfully";
            }
            else
            {
                lbl_msg.Text = "Please enter correct Current password";
            }
        }

        // Get all details.
        public void GetProfile()
        {
            SqlConnection conn = connection.Connect();
            SqlCommand sql = new SqlCommand("Select Users.Name as Name, Users.LastName as LastName, Users.Email as Email from Users where RoleID = @RD", conn);
            sql.Parameters.AddWithValue("RD", 2);

            SqlDataReader reader1 = sql.ExecuteReader();

            if (reader1.Read())
            {
                inputFirstName.Value = reader1["Name"].ToString();
                inputLastName.Value = reader1["LastName"].ToString();
                inputEmailAddress.Value = reader1["Email"].ToString();
                conn.Close();
            }

        }
    }
}