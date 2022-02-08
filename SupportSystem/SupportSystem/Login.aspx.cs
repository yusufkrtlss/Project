using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class Login : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        // Code below allows us to redirect to create new account.
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewMember.aspx");
        }
        // Code below allows us to login Admin Panel or Personel Panel
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = connection.Connect();
            int rolesid;
            SqlCommand cmd = new SqlCommand("Select * from Users where Email= @EM and Password =@PW", conn);
            cmd.Parameters.AddWithValue("@EM",email.Value);
            cmd.Parameters.AddWithValue("@PW",password.Value);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
            DataTable dtbl = new DataTable();
            sqlDataAdapter.Fill(dtbl);
            // şurdaki gibi 
            HttpCookie userInfo = new HttpCookie("USER");
            userInfo.Expires.Add(new TimeSpan(0, 1, 0));


            Response.Cookies.Add(userInfo);

            if (dtbl.Rows.Count > 0)
            {
                rolesid = int.Parse(dtbl.Rows[0]["RoleID"].ToString());
                HttpCookie cerezim = new HttpCookie("cerezdosyam");
                cerezim["Email"] = email.Value;
                cerezim["Password"] = password.Value;
                cerezim.Expires = DateTime.Now.AddDays(10);
                Response.Cookies.Add(cerezim);
                //orda swtich eyrine if kullan içinde 3 tane koşulu sağlayacak şekilde
                switch (rolesid)
                {
                    case 1:
                        userInfo["ROLE"] = "1";
                        Response.Redirect("Mails.aspx");
                        break;
                    case 2:
                        userInfo["ROLE"] = "2";
                        Response.Redirect("UsersMails.aspx");
                        break;
                }
            }


            conn.Close();


        }
    }
}