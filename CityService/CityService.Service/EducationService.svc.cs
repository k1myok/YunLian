using CityService.DataAccess;
using CityService.Service.EducationInfo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Xml.Linq;

namespace CityService.Service
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class EducationService
    {
        // 要使用 HTTP GET，请添加 [WebGet] 特性。(默认 ResponseFormat 为 WebMessageFormat.Json)
        // 要创建返回 XML 的操作，
        //     请添加 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
        //     并在操作正文中包括以下行:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [WebGet]
        [OperationContract]
        public string[] GetRegions()
        {
            var context = new CityServiceModelContainer();
            return context.SchoolDistrict.Select(p => p.Region).Distinct().ToArray();
        }

        [WebGet]
        [OperationContract]
        public SchoolDistrict[] Search(string region, string schoolType, string searchType, string searchText)
        {
            var context = new CityServiceModelContainer();
            if(region == "不限")
                region = "";

            var queryCommand = context.SchoolDistrict.Where(p => p.SchoolType == schoolType && p.Region.Contains(region));

            if (searchType == "学校")
                queryCommand = queryCommand.Where(p => p.SchoolName.Contains(searchText));
            else
                queryCommand = queryCommand.Where(p => p.SchoolDistricts.Contains(searchText));

            return queryCommand.OrderBy(p => p.SchoolName).ToArray();
        }


        /// <summary>
        /// 存取款查询
        /// </summary>
        /// <param name="idNumber"></param>
        /// <param name="start"></param>
        /// <param name="end"></param>
        /// <param name="pageIndex"></param>
        /// <param name="Count"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public List<DepositAndDraw> GetDepositAndDrawResult(string idNumber, string start, string end, int pageIndex, int Count)
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><flows><usercode>{0}</usercode><type>02</type><page>{1}</page><pagesize>{2}</pagesize><begintime>{3}</begintime><endtime>{4}</endtime></flows>", idNumber, pageIndex, Count, start, end);

            var method = "getUserFlows";

            var result = GetResult(xml, method);

            XDocument document = XDocument.Parse(result);
            var fNode = document.Element(XName.Get("flows", ""));
            var rc = fNode.Element(XName.Get("return__code", "")).Value;
            if (rc != "SUCCESS")
            {
                return null;
            }
            else
            {
                List<DepositAndDraw> dadList = new List<DepositAndDraw>();
                var dwmflow = fNode.Elements(XName.Get("dwmflow", ""));

                foreach (var df in dwmflow)
                {
                    DepositAndDraw d = new DepositAndDraw();

                    d.date = df.Element(XName.Get("consumetime", "")).Value;
                    d.winname = df.Element(XName.Get("winname", "")).Value;
                    d.type = df.Element(XName.Get("typename", "")).Value;
                    d.money = df.Element(XName.Get("transactmoney", "")).Value;
                    d.beforeMoney = df.Element(XName.Get("primarydbmoney", "")).Value;
                    d.afterMoney = df.Element(XName.Get("currentdbmoney", "")).Value;

                    dadList.Add(d);
                }

                return dadList;
            }
        } 

        /// <summary>
        /// 考勤查询
        /// </summary>
        /// <param name="idNumber"></param>
        /// <param name="start"></param>
        /// <param name="end"></param>
        /// <param name="pageIndex"></param>
        /// <param name="Count"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public List<Attendance> GetAttendanceResult(string idNumber, string start, string end, int pageIndex, int Count) 
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><flows><usercode>{0}</usercode><type>01</type><page>{1}</page><pagesize>{2}</pagesize><begintime>{3}</begintime><endtime>{4}</endtime></flows>", idNumber, pageIndex, Count, start, end);

            var method = "getUserFlows";

            var result = GetResult(xml, method);

            XDocument document = XDocument.Parse(result);
            var fNode = document.Element(XName.Get("flows", ""));
            var rc = fNode.Element(XName.Get("return__code", "")).Value;
            if (rc != "SUCCESS")
            {
                return null;
            }
            else
            {
                List<Attendance> attList = new List<Attendance>();
                var attdflow = fNode.Elements(XName.Get("attdflow", ""));

                foreach (var af in attdflow)
                {
                    Attendance a = new Attendance();

                    a.attTime = af.Element(XName.Get("attdtime", "")).Value;
                    a.time = af.Element(XName.Get("attdsj", "")).Value;
                    a.ruleName = af.Element(XName.Get("rulename", "")).Value;
                    a.status = af.Element(XName.Get("status", "")).Value;
                    string date = af.Element(XName.Get("attdrq", "")).Value;
                    a.date = date.Substring(0, 4) + "/" + date.Substring(4, 2) + "/" + date.Substring(6, 2);
                    
                    attList.Add(a);
                }

                return attList;
            }
        }

        /// <summary>
        /// 消费流水
        /// </summary>
        /// <param name="idNumber"></param>
        /// <param name="start"></param>
        /// <param name="end"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public List<Spending> GetSpendingResult(string idNumber, string start, string end, int pageIndex, int Count) 
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><flows><usercode>{0}</usercode><type>03</type><page>{1}</page><pagesize>{2}</pagesize><begintime>{3}</begintime><endtime>{4}</endtime></flows>",idNumber,pageIndex,Count,start,end);

            var method = "getUserFlows";

            var result = GetResult(xml, method);

            XDocument document = XDocument.Parse(result);
            var fNode = document.Element(XName.Get("flows", ""));
            var rc = fNode.Element(XName.Get("return__code", "")).Value;
            if (rc != "SUCCESS")
            {
                return null;
            }
            else 
            {
                List<Spending> spendingList = new List<Spending>();
                var tradeflow = fNode.Elements(XName.Get("tradeflow", ""));

                foreach (var tf in tradeflow) 
                {
                    Spending s = new Spending();

                    s.time = Convert.ToDateTime(tf.Element(XName.Get("consumetime", "")).Value).ToShortDateString();
                    s.Momey = tf.Element(XName.Get("transactmoney", "")).Value;
                    s.winname = tf.Element(XName.Get("winname", "")).Value;

                    spendingList.Add(s);
                }

                return spendingList;
            }
        }

        /// <summary>
        /// 获取ecard 卡号
        /// </summary>
        /// <param name="name"></param>
        /// <param name="idNumber"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public string GetUserCode(string name, string idNumber) 
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><base_info><idnumber>{0}</idnumber><username>{1}</username></base_info>",idNumber,name);
            var method = "getUsercodeByIdNumberAndName";

            return GetResult(xml,method);
        }
        
        /// <summary>
        /// 获取发卡人信息
        /// </summary>
        /// <param name="userCode"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public string GetCardConfirm(string userCode) 
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><apply_card><usercode>{0}</usercode></apply_card>", userCode);
            var method = "getCardConfirm";

            return GetResult(xml,method);
        }

        /// <summary>
        /// 确认发卡
        /// </summary>
        /// <param name="userCode"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public string doCardConfirm(string userCode) 
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><account_info><usercode>{0}</usercode></account_info>", userCode);
            var method = "doCardConfirm";

            return GetResult(xml, method);
        }

        /// <summary>
        /// 查询卡状态
        /// </summary>
        /// <param name="userCode"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public string getAccountInfo(string userCode) 
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><account_info><usercode>{0}</usercode></account_info>", userCode);
            var method = "getAccountInfo";

            return GetResult(xml, method);
        }

        /// <summary>
        /// 卡片挂失
        /// </summary>
        /// <param name="userCode"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public string reportLossCard(string userCode) 
        {
            var xml = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?><report_loss><usercode>{0}</usercode></report_loss>", userCode);


            var method = "reportLossCard";

            return GetResult(xml, method);
        }


        /// <summary>
        /// 共用方法
        /// </summary>
        /// <param name="xml"></param>
        /// <param name="method"></param>
        /// <returns></returns>
        public static string GetResult(string xml, string method) 
        {
            var sign = Encrypt.GetEncrypt(xml, method);

            var url = string.Format("http://test.szzhjy.net/openApitest/api?appKey=20150930155124500001&format=xml&locale=zh_CN&method={0}&request_xml={1}&sign={2}&sign_method=md5&v=1.0", method, xml, sign);

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            return result;
        }
    }
}
