using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class NewMember : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = connection.Connect();

            // e mail daha önce kayıtlı mı kontrolü
            // if uyarı değilse kodları çalıştır.

            SqlCommand cmd = new SqlCommand("insert into Users values (@Name,@Surname,@Email,@Password,@RoleId)", conn);

            cmd.Parameters.AddWithValue("@Name", name.Value);
            cmd.Parameters.AddWithValue("@Surname", lastname.Value);
            cmd.Parameters.AddWithValue("@Email", email.Value);
            cmd.Parameters.AddWithValue("@Password", password.Value);
            cmd.Parameters.AddWithValue("@RoleId", 2);

            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}