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

                    for (int i = 0; i < hash.Length; i++)
                    {
                        sb.Append(hash[i].ToString("X2"));
                    }

                    if (PasswordDR.Any())
                    {
                        if (PasswordDR[0].ItemArray[2].ToString() == sb.ToString())
                        {

                            // Grab user id using Session State
                            Session["Username"] = PasswordDR[0].ItemArray[1];

                            // Post users UserName to the top
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string userName = TextBox1.Text;
            string password = TextBox2.Text;

            try
            {
                dataConn.InsertNewUser(userName, password);
                Session["Username"] = userName;
                Response.Write("Successful Registration for UserName : " + Session["Username"]);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }  
        }
    }
    }
