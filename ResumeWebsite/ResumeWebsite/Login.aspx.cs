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

// Using System.Text -- Allows the use of String builders
// Using System.Security.Cryptography; -- Allows the use of MD5 Encryption
// Using System.Data.SqlClient -- Allows you to connect to SQL

namespace ResumeWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        DataConn dataConn = new DataConn();
        Encryption encryption = new Encryption();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Write("Logged in as : " + Session["Username"]);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // string userName="";
          //  string passWord="";
           // string returnValue;

                try
                {

                if (Page.IsPostBack)
                {
                    string ConnString = null;
                    string hashValue = null;

                    // Declare a SQL Connection
                    SqlConnection sqlConn;

                    // Grab Default Connection string from Web.Config Page
                    ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                    sqlConn = new SqlConnection(ConnString);

                    SqlDataAdapter SqlDA = new SqlDataAdapter("dbo.UserNameandPassword", ConnString);

                    // Create A DataTabla
                    DataTable dtPasswordCheck = new DataTable();

                    // Fill the Data Table with data from Data Adapter
                    SqlDA.Fill(dtPasswordCheck);

                    // Create a DataRow, Add Where statement to Stored Proc through ("UserName = '" + TextBox1.Text + "'")
                    DataRow[] PasswordDR = dtPasswordCheck.Select("UserName = '" + TextBox1.Text + "'");

                    // Encrypt Textbox 2 
                    hashValue = encryption.Encrypt(TextBox2.Text);

                    if (PasswordDR.Any())
                    {
                        if (PasswordDR[0].ItemArray[2].ToString() == hashValue)
                        {
                            // Grab user id using Session State
                            Session["Username"] = PasswordDR[0].ItemArray[1];

                            // Post users UserName to the top
                            Response.Write("Logged in! " + Session["Username"]);
                        }
                        else
                        {
                            Response.Write("Password was Inncorect.");
                        }
                    }
                    else
                    {
                        Response.Write("UserName was Inncorect");
                    }
                }
                }
                catch(Exception ex)
                {
                    Response.Write(ex.Message);
                }
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

                hashValue =  encryption.Encrypt(TextBox2.Text);

                insertNewUser.Parameters.AddWithValue("@UserName", TextBox1.Text);
                insertNewUser.Parameters.AddWithValue("@Password", hashValue);
                sqlConn.Open();

                int k =insertNewUser.ExecuteNonQuery();
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
