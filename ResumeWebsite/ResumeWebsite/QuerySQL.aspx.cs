using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace ResumeWebsite
{
    public partial class QuerySQL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Write("Logged in as : " + Session["Username"]);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            try
            {
                GridView1.DataSourceID = String.Empty;
                string query = TextBox1.Text;
                // Grab the Connection string from the web.Config file
                string connString = ConfigurationManager.ConnectionStrings["QueryAdventureWorks2012"].ConnectionString;
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}