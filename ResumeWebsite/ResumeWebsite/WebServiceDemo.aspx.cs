using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumeWebsite.ServiceReference1;
using DecimalConversionsDLL;

namespace ResumeWebsite
{
    public partial class WebServiceDemo : System.Web.UI.Page
    {
        WebService1 WS1 = new WebService1();
        DecimalConvert DecimalConvert = new DecimalConvert();

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

        protected void btnBinaryTest_Click(object sender, EventArgs e)
        {
            long search = long.Parse(tbTextbox1.Text);
            string returnValue = " ";

            try
            {
                //Decemal convert stems from the DecimalConversion DLL
                returnValue = search + " In Binary: " + DecimalConvert.BinaryCalculator(search).ToString();
                returnValue = returnValue + " Hex: " + WS1.HexCalculator(search).ToString();
                returnValue = returnValue + " Octal: " + DecimalConvert.OctalCalculator(search).ToString();

                ListBox1.Items.Add(returnValue);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
                Session["Username"] = null;
                Response.Redirect("Login.aspx");
        }
    }
}