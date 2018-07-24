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
    public partial class Login : System.Web.UI.Page
    {
        DataConn dataConn = new DataConn();
        bool IspersonLoggedin = false;

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
                    SqlConnection sqlConn;
                    ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    sqlConn = new SqlConnection(ConnString);
                    SqlDataAdapter SqlDA = new SqlDataAdapter("dbo.UserNameandPassword", ConnString);
                    DataTable dtPasswordCheck = new DataTable();
                    SqlDA.Fill(dtPasswordCheck);
                    DataRow[] PasswordDR = dtPasswordCheck.Select("UserName = '" + TextBox1.Text + "'");

                    // Step 1, calculate MD5 from input
                    hashValue = TextBox2.Text;
                    MD5 EncryptionHash = System.Security.Cryptography.MD5.Create();
                    byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(hashValue);
                    byte[] hash = EncryptionHash.ComputeHash(inputBytes);

                    // step 2, convert byte array to hex string
                    StringBuilder sb = new StringBuilder();

                    if (PasswordDR.Any())
                    {
                        if (PasswordDR[0].ItemArray[2].ToString() == TextBox2.Text)
                        {
                            Session["Username"] = PasswordDR[0].ItemArray[1];
                            Response.Write("Logged in! " + Session["Username"]);
                            IspersonLoggedin = true;
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
        }
    }
