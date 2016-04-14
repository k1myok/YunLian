using CityService.Service.CityServicesInfo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Xml;

namespace CityService.Service
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service2
    {
        // 要使用 HTTP GET，请添加 [WebGet] 特性。(默认 ResponseFormat 为 WebMessageFormat.Json)
        // 要创建返回 XML 的操作，
        //     请添加 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
        //     并在操作正文中包括以下行:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public void DoWork()
        {
            var url = "http://221.224.13.5:8190/econsole/api/query/violation/vehicle?license=苏EUM029&vin=0072420";
            var result = HttpHelper.GetHtmlExByByPost(url, "", Encoding.UTF8);

            // 在此处添加操作实现
            return;
        }

        // 在此处添加更多操作并使用 [OperationContract] 标记它们
        //D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay
        //D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay
        //D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay
        //D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay  本地
        //D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay  7/156
        //E:\Projects\PreProjects\Source\CityService\CityService.Service\CityServicesInfo_Alipay
        [WebGet]
        [OperationContract]
        public IndexPage GetMenu(string type)
        {
            var page = new IndexPage();
            XmlDocument xmlDoc = new XmlDocument();

            if (type == "health")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\healthMenuPage.xml");
            }
            else if (type == "szqx")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\szqxMenuPage.xml");
            }
            else if (type == "traval")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\travalMenuPage.xml");
            }
            else if (type == "police")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\policeMenuPage.xml");
            }
            else if (type == "edu")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\eduMenuPage.xml");
            }
            else if (type == "szbm")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\szbmMenuPage.xml");
            }
            else
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\menuPage.xml");
            }
            XmlNode xn = xmlDoc.SelectSingleNode("root");

            page.title = xn.SelectSingleNode("title").InnerText.Trim();
            page.foot = xn.SelectSingleNode("foot").InnerXml;
            page.type = xn.SelectSingleNode("type").InnerText.Trim();

            var contNode = xn.SelectNodes("menus");
            page.menuList = new List<Menu>();
            foreach (var cn in contNode)
            {
                XmlElement xe = (XmlElement)cn;
                var menuNode = xe.SelectNodes("menu");
                foreach (var mn in menuNode)
                {
                    XmlElement xe2 = (XmlElement)mn;
                    Menu m = new Menu();
                    m.content = xe2.SelectSingleNode("content").InnerText.Trim();
                    m.url = xe2.SelectSingleNode("url").InnerText.Trim();
                    m.image = xe2.SelectSingleNode("image").InnerText.Trim();
                    page.menuList.Add(m);
                }
            }
            return page;
        }


        [WebGet]
        [OperationContract]
        public IndexPage GetMenu_Alipay(string type)
        {
            var page = new IndexPage();
            XmlDocument xmlDoc = new XmlDocument();

            if (type == "health")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\healthMenuPage.xml");
            }
            else if (type == "szqx")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\szqxMenuPage.xml");
            }
            else if (type == "traval")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\travalMenuPage.xml");
            }
            else if (type == "police")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\policeMenuPage.xml");
            }
            else if (type == "edu")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\eduMenuPage.xml");
            }
            else if (type == "szbm")
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\szbmMenuPage.xml");
            }
            else
            {
                xmlDoc.Load(@"D:\Projects\Preprojects\Releases\CityService\CityService.Service\CityServicesInfo_Alipay\menuPage.xml");
            }
            XmlNode xn = xmlDoc.SelectSingleNode("root");

            page.title = xn.SelectSingleNode("title").InnerText.Trim();
            page.foot = xn.SelectSingleNode("foot").InnerXml;
            page.type = xn.SelectSingleNode("type").InnerText.Trim();

            var contNode = xn.SelectNodes("menus");
            page.menuList = new List<Menu>();
            foreach (var cn in contNode)
            {
                XmlElement xe = (XmlElement)cn;
                var menuNode = xe.SelectNodes("menu");
                foreach (var mn in menuNode)
                {
                    XmlElement xe2 = (XmlElement)mn;
                    Menu m = new Menu();
                    m.content = xe2.SelectSingleNode("content").InnerText.Trim();
                    m.url = xe2.SelectSingleNode("url").InnerText.Trim();
                    m.image = xe2.SelectSingleNode("image").InnerText.Trim();
                    page.menuList.Add(m);
                }
            }

            return page;
        }

    }
}
