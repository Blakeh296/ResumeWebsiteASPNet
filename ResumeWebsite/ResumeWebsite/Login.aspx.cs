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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName="";
            string passWord="";

            try
            {
                userName = TextBox1.Text;
                passWord = TextBox2.Text;

                Label1.Text = dataConn.VerifyUser(userName, passWord);

                dataConn.Dispose();
            }
            catch(Exception ex)
            {
                Label1.Text = ex.Message;
            }
            

        }
    }
}