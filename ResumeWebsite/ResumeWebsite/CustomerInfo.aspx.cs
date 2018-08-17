using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeWebsite
{
    public struct ContactInfo
    {
        public string FirstName;
        public string MiddleName;
        public string LastName;
        public string CompanyName;
        public string AddressLine1;
        public string AddressLine2;
        public string City;
        public string AddressState;
        public string PostalCode;
        public string Email;
    }

    public partial class CustomerInfo : System.Web.UI.Page
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

            ImageButton3.Visible = false;
        }

        protected void btnAddContact_Click(object sender, EventArgs e)
        {
            ContactInfo newContact = new ContactInfo();
            DataConn dataConn = new DataConn();

            try
            {
                newContact.FirstName = tbFname.Text;
                newContact.MiddleName = tbMiddleInit.Text;
                newContact.LastName = tbLname.Text;
                newContact.CompanyName = tbCompanyName.Text;
                newContact.AddressLine1 = tbAddressLine1.Text;
                newContact.AddressLine2 = tbAddressLine2.Text;
                newContact.City = tbCity.Text;
                newContact.AddressState = tbState.Text;
                newContact.PostalCode = tbPostalCode.Text;
                newContact.Email = tbEmail.Text;

                dataConn.InsertNewContact(newContact);

                Response.Write("Contact ADDED!");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;

            tbFname.Visible = false;
            tbMiddleInit.Visible = false;
            tbLname.Visible = false;
            tbCompanyName.Visible = false;
            tbAddressLine1.Visible = false;
            tbAddressLine2.Visible = false;
            tbPostalCode.Visible = false;
            tbState.Visible = false;
            tbCity.Visible = false;
            tbEmail.Visible = false;

            btnAddContact.Visible = false;

            ImageButton2.Visible = false;
            ImageButton3.Visible = true;
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            Label7.Visible = true;
            Label8.Visible = true;
            Label9.Visible = true;
            Label10.Visible = true;

            tbFname.Visible = true;
            tbMiddleInit.Visible = true;
            tbLname.Visible = true;
            tbCompanyName.Visible = true;
            tbAddressLine1.Visible = true;
            tbAddressLine2.Visible = true;
            tbPostalCode.Visible = true;
            tbState.Visible = true;
            tbCity.Visible = true;
            tbEmail.Visible = true;

            btnAddContact.Visible = true;

            ImageButton3.Visible = false;
            ImageButton2.Visible = true;
        }
    }
}