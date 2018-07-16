using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ResumeWebsite
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Button1_Click(object sender, EventArgs e)
        {
            string qry = "select * from ";
            string userName;
            string passWord;

            try
            {
                userName = TextBox1.Text;
                passWord = TextBox2.Text;

                // Define the connection string
                string connString = @"Server=PL09/MTCDB;Database=LoginDB;Trusted_Connection=True;";
                // Define the connection using the connection string
                SqlConnection sqlConnection = new SqlConnection(connString);
                // Define a data adapter to pull the data from the server using the connection and a stored procedure

                SqlDataAdapter dataAdapter = new SqlDataAdapter("dbo.UserNameandPassword", sqlConnection);
                // Create a new datatable
                DataTable dataTable = new DataTable();
                // Use the data Adapter to fill the datatable
                dataAdapter.Fill(dataTable);

                dataTable.Select("UserName like '%" + userName + "%'");
            }
            catch(Exception ex)
            {
                Label1.Text = ex.Message;
            }
            

        }
    }
}