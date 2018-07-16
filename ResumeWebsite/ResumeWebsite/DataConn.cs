using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ResumeWebsite
{
    public class DataConn : IDisposable
    {
        private SqlConnection sqlconn;

        public DataConn()
        {
            string SQLConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            sqlconn = new SqlConnection(SQLConnString);
        }

        public DataConn(string ConnectionString)
        {
            sqlconn = new SqlConnection(ConnectionString);
        }

        public string VerifyUser(string UserName, string Password)
        {
            string returnValue = "";

            try
            {
                sqlconn.Open();
                SqlCommand sqlVerifyUser = new SqlCommand("UserNameandPassword", sqlconn);
                sqlVerifyUser.CommandType = CommandType.StoredProcedure;
                sqlVerifyUser.Parameters.AddWithValue("@UserName", UserName);

                DataTable sqlUsers = new DataTable();
                SqlDataAdapter sqlDA = new SqlDataAdapter(sqlVerifyUser);

                sqlDA.Fill(sqlUsers);

                if (sqlUsers.Rows.Count == 0)
                {
                    returnValue = "Access Denied..";
                }
                else
                {
                    if (sqlUsers.Rows[0]["UserPassWord"].ToString() == Password)
                    {
                        returnValue = "Access Granted !";
                    }
                    else
                    {
                        returnValue = "Access Denied..";
                    }   
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return returnValue;
        }

        public void Dispose()
        {
            sqlconn.Close();
            sqlconn = null;
        }
    }
}