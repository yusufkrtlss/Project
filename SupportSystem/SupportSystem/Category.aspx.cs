using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DbConnection connection = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAllCategories();
        }

        protected void CategoryAddButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = connection.Connect();
            SqlCommand cmd = new SqlCommand("IF NOT EXISTS(SELECT * FROM Category WHERE Category.CategoryName = @Name)  BEGIN insert into Category(CategoryName) values(@Name) END", conn);
            cmd.Parameters.AddWithValue("@Name", categoryname.Value);
            cmd.ExecuteNonQuery();
            conn.Close();

            GetAllCategories();
        }

        public void GetAllCategories()
        {
            SqlConnection conn = connection.Connect();

            SqlCommand cmd = new SqlCommand("select * from Category", conn);
            // kullancı rolü per olanları getirdik 
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            CategoryRepeater.DataSource = sqlDataReader;
            CategoryRepeater.DataBind();

            conn.Close();
        }
    }
}