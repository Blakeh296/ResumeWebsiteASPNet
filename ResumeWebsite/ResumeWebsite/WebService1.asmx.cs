using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.IO;

namespace ResumeWebsite
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        //This is a private method the user wont be able to see
        public static string ReverseString(string s)
        {
            //send the input string to a CharArray
            char[] chararray = s.ToCharArray();
            //reverse the aray and return it
            Array.Reverse(chararray);
            return new string(chararray);
        }

        [WebMethod]
        public string OctalCalculator(long DecimalInput)
        {
            long input = DecimalInput;
            long remainder = 0;
            string result = string.Empty;
            try
            {
                while (input > 0)
                {
                    remainder = input % 8;
                    input = input / 8;
                    result = remainder.ToString() + result;
                }
                return result;
            }
            catch (Exception ex)
            {
                throw new System.ArgumentException(ex.Message);
            }
        }

        [WebMethod]
        public string HexCalculator(int DecimalInput)
        {
            return DecimalInput.ToString("X");
        }

        [WebMethod]
        public string BinaryTester(int DecimalInput)
        {
            StreamWriter writer = new StreamWriter("BinaryText.txt");
            try
            {
                long input = DecimalInput;
                long count = 0;
                long arryCount = 0;
                long div;
                string[] binaryString = new string[DecimalInput];
                Random rand = new Random();

                while (count <= DecimalInput)
                {
                    div = rand.Next(2, 100000);
                    while (div >= 1)
                    {
                        if (div % 2 == 1) //If ODD NUMBER
                            binaryString[arryCount] = binaryString[arryCount] + "1"; //Add a 1 to the end of the string
                        else if (div % 2 == 0) //if EVEN NUMBER
                        {
                            binaryString[arryCount] = binaryString[arryCount] + "0"; //Add a 0 to the end of the string
                        }
                        
                        div = div / 2;    //divide the value by 2 
                    }

                    ReverseString(binaryString[arryCount]);
                    count++;
                    arryCount++;
                }

                foreach(string String in binaryString)
                {
                    writer.WriteLine(binaryString);
                }
                return binaryString[count];
            }
            catch (Exception ex)
            {
                throw new System.ArgumentException(ex.Message);
            }
        }

        [WebMethod] //Must declare webmethod to make method visible to the caller
        public long BinaryCalculator(long DecimalInput)
        {
            try
            {
                long input = DecimalInput;
                string binaryString = string.Empty;

                while (input >= 1)
                {
                    if (input % 2 == 1) //If ODD NUMBER
                        binaryString = binaryString + "1"; //Add a 1 to the end of the string
                    else if (input % 2 == 0) //if EVEN NUMBER
                        binaryString = binaryString + "0"; //Add a 0 to the end of the string
                    //divide the value by 2
                    input = input / 2;
                }
                //Use our private method to reverse the string
                return long.Parse(ReverseString(binaryString));
            }
            catch (Exception ex)
            {
                //We can use message boxes so we use this
                throw new System.ArgumentException(ex.Message);
            }
        }
    }
}
