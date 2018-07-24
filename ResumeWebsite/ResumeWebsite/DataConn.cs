using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace ResumeWebsite
{
    public class DataConn : IDisposable
    {
        private SqlConnection sqlconn;

        public void ApplicationLog(string LogMessage)
        {
            StreamWriter logOutput = new StreamWriter(HttpRuntime.AppDomainAppPath + "\\AppLog.txt", true);
            logOutput.WriteLine(DateTime.Now.ToString() + ":  " + LogMessage);
            logOutput.Close();
        }

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
                SqlCommand sqlVerifyUser = new SqlCommand("dbo.UserNameandPassword", sqlconn);
                sqlVerifyUser.CommandType = CommandType.StoredProcedure;
                sqlVerifyUser.Parameters.AddWithValue("@UserName", UserName);
                sqlVerifyUser.Parameters.AddWithValue("@Password", Password);

                DataTable sqlUsers = new DataTable();
                SqlDataAdapter sqlDA = new SqlDataAdapter(sqlVerifyUser);

                sqlDA.Fill(sqlUsers);

                if (sqlUsers.Rows.Count == 0)
                {
                    returnValue = "Access Denied..";
                }
                else
                {
                    if (sqlUsers.Rows[0]["Password"].ToString() == Password)
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

        public bool InsertNewUser(string Username, string Password)
        {
            bool returnValue = false;
            string ConnString;
            try
            {
                SqlConnection sqlConn;

                ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                sqlConn = new SqlConnection(ConnString);

                SqlCommand insertNewUser = new SqlCommand("dbo.InsertNewUser", sqlConn);
                insertNewUser.CommandType = CommandType.StoredProcedure;

                insertNewUser.Parameters.AddWithValue("@UserName", Username);
                insertNewUser.Parameters.AddWithValue("@Password", Password);
                sqlconn.Open();
                insertNewUser.ExecuteNonQuery();
                returnValue = true;
            }
            catch (Exception ex)
            {
                returnValue = false;
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