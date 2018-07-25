using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace ResumeWebsite
{
    public class Encryption
    {
        public string Encrypt(string hashValue)
        {
            string returnValue;

            MD5 EncryptionHash = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(hashValue);
            byte[] hash = EncryptionHash.ComputeHash(inputBytes);

            // step 2, convert byte array to hex string
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }

            returnValue = sb.ToString();

            return returnValue;
        }
    }
}