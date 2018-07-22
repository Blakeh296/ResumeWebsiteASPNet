using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ResumeWebsite
{
    public class Global : System.Web.HttpApplication
    {
        DataConn dataConn = new DataConn();
        int sessionID;
        int counter = 0;

        

        protected void Application_Start(object sender, EventArgs e)
        {
            if (counter < 1)
            {
                dataConn.ApplicationLog("Application Started.");
            }
            else if (counter >= 1)
            {
                dataConn.ApplicationLog("New Form Request");
            }
        }

        protected void Application_Int(object sender, EventArgs e)
        {
            dataConn.ApplicationLog("Application_Int.");
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Random Identifier = new Random();
            sessionID = Identifier.Next(0, 10000);
            dataConn.ApplicationLog("Session Started. Session ID: " + sessionID) ;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            
            dataConn.ApplicationLog("Application_BeginRequested.");
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            dataConn.ApplicationLog("Error Recorded.");
        }

        protected void Session_End(object sender, EventArgs e)
        {
            dataConn.ApplicationLog("SessionEnded.");
        }

        protected void Application_End(object sender, EventArgs e)
        {
            dataConn.ApplicationLog("Application End.");
        }
    }
}