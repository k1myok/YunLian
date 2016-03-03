using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace CityService.Service.EducationInfo
{
    public class Encrypt
    {
        /// <summary>
        /// 获取加密字符串
        /// </summary>
        /// <param name="xml"></param>
        /// <param name="method"></param>
        /// <returns></returns>
        public static string GetEncrypt(string xml, string method) 
        {
            string val = string.Format(@"7a8f13afb1b199a2ed6dd52cdfc40666appKey20150930155124500001formatxmllocalezh_CNmethod{0}request_xml{1}sign_methodmd5v1.07a8f13afb1b199a2ed6dd52cdfc40666", method, xml);

            return MD5Encrypt(val);
        }


        /// <summary>
        /// MD5加密
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        private static string MD5Encrypt(string input)
        {
            return MD5Encrypt(input, new UTF8Encoding());
        }

        private static string MD5Encrypt(string input, Encoding encode)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] t = md5.ComputeHash(encode.GetBytes(input));
            StringBuilder sb = new StringBuilder(32);
            for (int i = 0; i < t.Length; i++)
                sb.Append(t[i].ToString("x").PadLeft(2, '0'));
            return sb.ToString().ToUpper();
        }

    }
}