using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllUsersForRepeater();
                GetAllUsersForDropdown();
                GetAllCategoriesForDropdown();
            }
        }

        public void GetAllUsersForRepeater()
        {
            SqlConnection conn = connection.Connect();

            SqlCommand cmd = new SqlCommand("select Users.Name, Users.LastName, Users.Email, Users.ID,  Category.CategoryName, Roles.RoleName from Users join Roles on Users.RoleID = Roles.ID join User_Cat_Auth  on User_Cat_Auth.UserID = Users.ID join Category  ON Category.ID = User_Cat_Auth.CategoryID where Roles.ID != 1", conn);
           
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            UserRepeater.DataSource = sqlDataReader;
            UserRepeater.DataBind();

            conn.Close();
        }

        public void GetAllUsersForDropdown()
        {
            SqlConnection conn = connection.Connect();

            SqlCommand cmd = new SqlCommand("select (Users.Name + ' '  + Users.LastName + ' ' + Users.Email) AS 'Name Surname', Users.ID  from Users join Roles on Users.RoleID = Roles.ID where Roles.ID != 1", conn);
             
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            UserList.DataSource = sqlDataReader;
            UserList.DataBind();

            conn.Close();
        }

        public void GetAllCategoriesForDropdown()
        {
            SqlConnection conn = connection.Connect();

            SqlCommand cmd = new SqlCommand("select * from Category", conn);
            // kullancı rolü per olanları getirdik 
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            CategoryDrop.DataSource = sqlDataReader;
            CategoryDrop.DataBind();

            conn.Close();
        }
        protected void AuthorizationButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = connection.Connect();

            // e mail daha önce kayıtlı mı kontrolü
            // if uyarı değilse kodları çalıştır.

            SqlCommand cmd = new SqlCommand("IF NOT EXISTS(SELECT * FROM User_Cat_Auth WHERE User_Cat_Auth.UserID = @USERID) BEGIN insert into User_Cat_Auth values (@USERID,@CATEGORYID) END", conn);

            cmd.Parameters.AddWithValue("@USERID", UserList.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@CATEGORYID", CategoryDrop.SelectedItem.Value);

            cmd.ExecuteNonQuery();
            GetAllUsersForRepeater();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = connection.Connect();

            SqlCommand sqlCommand = new SqlCommand("Delete from User_Cat_Auth where User_Cat_Auth.UserID = @UI",conn);

            sqlCommand.Parameters.AddWithValue("@UI", UserList.SelectedItem.Value);

            sqlCommand.ExecuteNonQuery();
            GetAllUsersForRepeater();
            conn.Close();
        }
    }
}