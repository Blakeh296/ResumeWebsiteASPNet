using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumeWebsite.ServiceReference1;

namespace ResumeWebsite
{
    public partial class WebServiceDemo : System.Web.UI.Page
    {
        WebService1 WS1 = new WebService1();

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

            long count = 1;
            string returnValue = " ";


            while (100000 >= count)
            {
                returnValue = count + " In Binary: " + WS1.BinaryCalculator(count).ToString();
                returnValue = returnValue + " Hex: " + WS1.HexCalculator(count).ToString();
                returnValue = returnValue + " Octal: " + WS1.OctalCalculator(count).ToString();
                BulletedList1.Items.Add(returnValue);
                count++;
            }
        }

        protected void btnBinaryTest_Click(object sender, EventArgs e)
        {
            long search = long.Parse(tbTextbox1.Text);
            string returnValue = " ";

            try
            {
                    returnValue = WS1.BinaryCalculator(search).ToString()
                    + " / " + search;

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