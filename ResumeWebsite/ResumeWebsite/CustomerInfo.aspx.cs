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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}