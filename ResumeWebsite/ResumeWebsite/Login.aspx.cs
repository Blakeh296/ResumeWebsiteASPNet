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
                Label1.Visible = false;
                Label2.Visible = false;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                LoginBtn.Visible = false;
                ImageButton1.Visible = false;
                lblMessage.Visible = false;
                Header.Visible = true;
                lblCoverLetter.Visible = true;
                lblCustomerInfo.Visible = true;
                lblResume.Visible = true;
                lblQuery.Visible = true;
                lblViewStateCal.Visible = true;
                WelcomeIMG.Visible = false;
                GreenCheck.Visible = true;
                ImageButton2.Visible = true;
                lblMessage.Text = "Logged in! As : " + Session["UserName"];
            }
            if (Session["Username"]==null)
            {
                Response.Write("Login OR Register here to continue");
                Label1.Visible = true;
                Label2.Visible = true;
                TextBox1.Visible = true;
                TextBox2.Visible = true;
                LoginBtn.Visible = true;
                ImageButton1.Visible = true;
                lblMessage.Visible = true;
                Header.Visible = false;
                lblCoverLetter.Visible = false;
                lblCustomerInfo.Visible = false;
                lblResume.Visible = false;
                lblQuery.Visible = false;
                lblViewStateCal.Visible = false;
                lblWebServiceDemo.Visible = false;
                WelcomeIMG.Visible = true;
                GreenCheck.Visible = false;
                ImageButton2.Visible = false;
            }
        }

        protected void btnLogin(object sender, EventArgs e)
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

                            // Redirect logged in user to site content
                            Response.Redirect("Login.aspx");
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Login.aspx");
        }
    }
    }
