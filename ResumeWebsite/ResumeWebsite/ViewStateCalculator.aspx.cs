using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeWebsite
{
    public partial class ViewStateCalculator : System.Web.UI.Page
    {
        // Create a variable to hold textbox values
        double tb1Values = 0;
        double tb2Values = 0;

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

            if (Page.IsPostBack)
            {
                if (ViewState["Total"] == null)
                {
                    ViewState["Total"] = 0;
                }
                else
                {
                    tbOutPut.Text = ViewState["Total"].ToString();
                }
            }
        }

        protected void btnEquals_Click(object sender, EventArgs e)
        {
            try
            {

                if (Page.IsPostBack)
                {
                    
                    tb1Values = double.Parse(tbInput1.Text);
                    tb2Values = double.Parse(tbInput2.Text);

                    if (cbMath.Text == "Add")
                    {
                        ViewState["Total"] = tb1Values + tb2Values;
                        ViewState["CompileTotal"] = tb1Values + " + " + tb2Values + " = " + ViewState["Total"];
                    }
                    else if (cbMath.Text == "Subtract")
                    {
                        ViewState["Total"] = tb1Values - tb2Values;
                        ViewState["CompileTotal"] = tb1Values + " - " + tb2Values + " = " + ViewState["Total"];
                    }
                    else if (cbMath.Text == "Multiply")
                    {
                        ViewState["Total"] = tb1Values * tb2Values;
                        ViewState["CompileTotal"] = tb1Values + " * " + tb2Values + " = " + ViewState["Total"];
                    }
                    else if (cbMath.Text == "Divide")
                    {
                        ViewState["Total"] = tb1Values / tb2Values;
                        ViewState["CompileTotal"] = tb1Values + " / " + tb2Values + " = " + ViewState["Total"];
                    }

                    tbOutPut.Text = ViewState["Total"].ToString();
                    ListBox1.Items.Add(ViewState["CompileTotal"].ToString());
                }
            }
            catch
            {
                tbOutPut.Text = "!* Ensure Neither Box is Blank..";
            }

        }
    }
}