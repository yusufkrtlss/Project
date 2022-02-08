using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class SendMail : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllCategoriesForDropdown();
            }
        }

        // Get ALL CATEGORIES.
        public void GetAllCategoriesForDropdown()
        {
            SqlConnection conn = connection.Connect();

            SqlCommand cmd = new SqlCommand("select * from Category", conn);
           
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            CategoryDrop.DataSource = sqlDataReader;
            CategoryDrop.DataBind();

            conn.Close();
        }

        // We can send mail with this code.
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = connection.Connect();

                SqlCommand cmd = new SqlCommand("insert into Mails values (@TITLE,@DETAIL,@CATEGORYID,@READSTATUS,@DATE)", conn);

                cmd.Parameters.AddWithValue("@TITLE", title.Value);
                cmd.Parameters.AddWithValue("@DETAIL", detail.Text);
                cmd.Parameters.AddWithValue("@CATEGORYID", CategoryDrop.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@READSTATUS", false);
                cmd.Parameters.AddWithValue("@DATE", DateTime.Now);
                cmd.ExecuteNonQuery();

                uyariLabel.Text = "Mesajınız gönderilmiştir";

                uyaridiv.Visible = true;


                conn.Close();
            }
            catch (Exception ex)
            {
                uyariLabel.Text = "Hata : " + ex.Message;

                uyaridiv.Visible = true;

            }

        }
    }
}