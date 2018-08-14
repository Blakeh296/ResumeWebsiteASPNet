using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace ResumeWebsite
{
    public partial class Register : System.Web.UI.Page
    {
        Encryption encryption = new Encryption();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string userName = TextBox1.Text;
            string password = TextBox2.Text;
            string ConnString;
            string hashValue;

            try
            {

                SqlConnection sqlConn;

                ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                sqlConn = new SqlConnection(ConnString);

                SqlCommand insertNewUser = new SqlCommand("dbo.InsertNewUser", sqlConn);
                insertNewUser.CommandType = CommandType.StoredProcedure;

                hashValue = encryption.Encrypt(TextBox2.Text);

                insertNewUser.Parameters.AddWithValue("@UserName", TextBox1.Text);
                insertNewUser.Parameters.AddWithValue("@Password", hashValue);
                sqlConn.Open();

                int k = insertNewUser.ExecuteNonQuery();
                if (k != 0)
                {
                    lblMessage.Text = "Record Recored";
                    lblMessage.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                sqlConn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}