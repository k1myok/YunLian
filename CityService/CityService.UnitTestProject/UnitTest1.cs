using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Text;
using System.Net;
using System.IO;
using CityService.Service;

namespace CityService.UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            //var url = "http://221.224.13.5:8190/econsole/api/query/violation/vehicle?license=%E8%8B%8FEUM029&vin=0072420";
            var url = "http://221.224.13.5:8190/econsole/api/query/violation/vehicle?license=苏EUM029&vin=0072420";
            //var url = "http://221.224.13.5:8190/econsole/api/query/violation/vehicle";
            var result = HttpHelper.GetHtmlExByByPost(url, "", Encoding.UTF8);

            //var result = PostHttp(url, "{'license':'苏EUM029','vin':'0072420'}", "text/xml; charset=utf-8");
            //var result = new HttpWebRequestHelper().Post(url, "","","utf-8");
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void TestMethod2()
        {
            var result = new HospitalInfoService().GetHospitials();
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void TestFindPolicePlaces()
        {
            //var result = new PoliceService().FindPolicePlaces(116.514384, 39.916771);
            //Assert.IsNotNull(result);
        }

        public static string PostHttp(string url, string body, string contentType)
        {
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);

            httpWebRequest.ContentType = contentType;
            httpWebRequest.Method = "POST";
            httpWebRequest.Timeout = 20000;

            byte[] btBodys = Encoding.UTF8.GetBytes(body);
            httpWebRequest.ContentLength = btBodys.Length;
            httpWebRequest.GetRequestStream().Write(btBodys, 0, btBodys.Length);

            HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            StreamReader streamReader = new StreamReader(httpWebResponse.GetResponseStream());
            string responseContent = streamReader.ReadToEnd();

            httpWebResponse.Close();
            streamReader.Close();
            httpWebRequest.Abort();
            httpWebResponse.Close();

            return responseContent;
        }  
    }
}
