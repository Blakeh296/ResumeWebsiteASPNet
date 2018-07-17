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

                    string ConnString = "";
                    ConnString = @"Server=PL10\MTCDB; Database=LoginDB; Trusted_Connection=True;";

                    SqlConnection sqlConn = new SqlConnection(ConnString);
                    SqlDataAdapter SqlDA = new SqlDataAdapter("dbo.UserNameandPassword", ConnString);
                    DataTable dtPasswordCheck = new DataTable();
                    SqlDA.Fill(dtPasswordCheck);

                    DataRow[] PasswordDR = dtPasswordCheck.Select(TextBox1.Text);

                    if (PasswordDR.Any())
                    {
                        if (PasswordDR[0].ItemArray[1].ToString() == TextBox2.Text)
                        {
                            Response.Write("You are In !");
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
