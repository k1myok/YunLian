using CityService.Service.PoliceInfo;
using Jayrock.Json;
using Jayrock.Json.Conversion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using Newtonsoft.Json;
using CityService.Service.test;
using System.Xml.Linq;
using System.Xml;
using System.Configuration;
namespace CityService.Service
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class PoliceService
    {
        /// <summary>
        /// 交通违法查询
        /// </summary>
        /// <param name="lic"></param>
        /// <param name="vin"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string  SelectPeccancyInfo(string lic, string vin)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/violation/vehicle?license={0}&vin={1}", lic, vin);

            var result = HttpHelper.GetHtmlExByByPost(url, "", Encoding.UTF8);

            if (result == null) 
            {
                return null;
            }

            return result;
        }

        /// <summary>
        /// 驾驶员记分查询
        /// </summary>
        /// <param name="dl"></param>
        /// <param name="fn"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string  SelectDriverScoreInfo(string dl, string fn) 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/violation/driver?drivingLicense={0}&fn={1}", dl, fn);

            var result = HttpHelper.GetHtmlExByByPost(url, "", Encoding.UTF8);

            if (result == null)
            {
                return null;
            }

            return result;
        }

        /// <summary>
        /// 重名查询
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string SelectSameNameInfo(string name) 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/name?name={0}", name);

            var result = HttpHelper.GetHtmlExByByPost(url, "", Encoding.UTF8);

            if (result == null)
            {
                return null;
            }

           return result;
        }

        /// <summary>
        /// 办事指南
        /// </summary>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string  WorkDirectoryInfo(string pageCount, string pageIndex, string ty, string bi, string ca, string kw, string pi, string su) 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/matters/page/case?type={0}&bureausId={1}&catalog={2}&policeId={3}&subject={4}&pageIndex={5}&keyword={6}&pageSize={7}",ty,bi,ca,pi,su,pageIndex,kw,pageCount);

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }
           return result;
        }

        /// <summary>
        /// 获取分局信息
        /// </summary>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string SelectPoliceBureausInfo() 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/police-bureaus");

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }



            return result;
        }

        /// <summary>
        /// 获取派出所信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string  SelectPoliceStationInfo(string id) 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/bureau-depts/{0}",id);

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }

            return result;
        }

        /// <summary>
        /// 警种信息
        /// </summary>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string SelectPoliceCategoryInfo() 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/police-catalogs");

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }

            return result;
        }


        /// <summary>
        /// 事项指南
        /// </summary>
        /// <param name="pcg"></param>
        /// <param name="pcdg"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string ItemGuideInfo(string pcg, string pcdg, string type) 
        {
            var ty = 2;
            if(type == "-1")
            {
                ty = 1;
            }

            var url = string.Format("http://221.224.13.5:8190/econsole/api/matters/detail/{0}/{1}/{2}", ty, pcdg, pcg);

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }

            return result;
        }

        /// <summary>
        /// 居住证办理进度查询
        /// </summary>
        /// <param name="idcard"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string  SelectRegisterResidentCardInfo(string idcard) 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/progress/residence/{0}",idcard);

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }
            return result;
        }
        /// <summary>
        /// 监控点模糊查询
        /// </summary>
        /// <param name="place">监控点模糊查询</param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string GetVideoslocation(string place)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/monitors/search?address={0}", place);
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            if (result == null)
            {
                return null;
            }
            return result;
        }
        /// <summary>
        /// 获取所有分局下的派出所
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string SelectAllPoliceStationInfo(string id) 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/police-stations/{0}", id);

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }

            return result;
        }

        /// <summary>
        /// 获取派出所下所有警务室
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string SelectRegisterResidentCardAddressInfo(string id) 
        {

            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/police-offices/{0}", id);

            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);

            if (result == null)
            {
                return null;
            }
            return result;
        }

        /// <summary>
        /// 身份证办理进度查询
        /// </summary>
        /// <param name="idcard"></param>
        /// <param name="no"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string  SelectRegisterIDCardInfo(string idcard, string no) 
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/progress/idcard?idCard={0}&pendingId={1}", idcard, no);

            var result = HttpHelper.GetHtmlExByByPost(url,"", Encoding.UTF8);

            if (result == null)
            {
                return null;
            }
            return result;
        }

        [WebGet]
        [OperationContract]
        public string FindPolicePlaces(double lon, double lat)
        {
            var url = "http://testapi.sz-map.com/test/poi/category?categoryId=4060101;4060102;4060103&coding=0&distance=50000&encoded=0&geometry={0},{1}&index=0&lenth=1000";
            url = string.Format(url, lon, lat);
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            return result;
        }
        /// <summary>
        /// 办事大厅办件查询其他办件查询
        /// </summary>
        /// <param name="caseid">办件序号</param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]

        public string FindOtherCaseResult(string caseid)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/progress/case/{0}",caseid);
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            if (result == null)
            {
                return null;
            }
            return result;
        }
        /// <summary>
        /// 案件查询
        /// </summary>
        /// <param name="idCard">身份证号</param>
        /// <param name="pendingId"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string FindCaseQuery(string idCard, string pendingId)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/caseinfo?idCard={0}&pendingId={1}",idCard,pendingId);
            //url = "http://221.224.13.5:8190/econsole/api/query/caseinfo?idCard=320503199202152259&pendingId=J3205025212051000003";
            var result = HttpHelper.GetHtmlExByByPost(url,"", Encoding.UTF8);
            if (result == null)
            {
                return null;
            }
           return result;
        }
        /// <summary>
        ///便民咨询
        /// </summary>
        /// <param name="keyword">关键字</param>
        /// <param name="page_index">页码</param>
        /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string  Consultingservices(string keyword, string page_index,string guid)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/matters/page/consult?keyword={0}&start_time=&end_time=&page_size=10&page_index={1}&user_id={2}&question", keyword, page_index, guid);
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            if (result == null)
            {
                return null;
            }

            return result;
        }
        /// <summary>
        /// 根据Guid 去获取问题的答案
        /// </summary>
        /// <param name="Guid"></param>
        /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string GetAnswer(string Guid)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/matters/consult/answer/{0}",Guid);
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            if (result == null)
            {
                return null;
            }
            return result;
        }
        /// <summary>
        /// 用户提交个人问题
        /// </summary>
        /// <param name="msgtext"></param>
        /// <param name="Guid"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string SubmitQuestion(string msgtext,string Guid) 
        {
            var json = "{" + "\"uid\"" + ":" + "\"" + Guid + "\"" + ",\"msgtext\"" + ":" + "\"" + msgtext + "\"" + "}";

            var url = string.Format("http://221.224.13.5:8190/econsole/api/matters/ask/question");
            var result = HttpHelper.GetHtmlExByByPost(url, json, Encoding.UTF8, p => p.ContentType = "application/json");
            if (result == null)
            {
                return null;
            }
            return result;
        }

        [WebGet]
        [OperationContract]
        public htm GetJGG() 
        {
            var h = new htm();

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(@"E:\Projects\PreProjects\Source\CityService\CityService.Service\test\jgg.xml");
            XmlNode xn = xmlDoc.SelectSingleNode("root");

            h.title = xn.SelectSingleNode("title").InnerText.Trim();
            h.foot = xn.SelectSingleNode("foot").InnerXml;
            h.type = xn.SelectSingleNode("type").InnerText.Trim();

            var contNode = xn.SelectNodes("menus");
            h.menuList = new List<Menu>();
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
                    h.menuList.Add(m);
                }
            }

            return h;
        }

        /// <summary>
        /// 临时通行证查询
        /// </summary>
        /// <param name="tempPass"></param>
        /// <returns></returns>
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        public string SelectTemporaryPassInfo(string tempPass)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/query/pass/temp/{0}", tempPass);
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            if (result == null)
            {
                return null;
            }
            return result;
        }


        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string GetAllTrafficMonitors()
        {
            var url = "http://221.224.13.5:8190/econsole/api/query/monitors";
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            return result;
        }

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string GeTrafficMonitorInfo(string id)
        {
            var url = "http://221.224.13.5:8190/econsole/api/query/road/" + id;
            var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            return result;
        }
        /// <summary>
        /// 获取用户的微信OPenID
        /// </summary>
        /// <param name="code">接收到的临时参数</param>
        /// <returns>返回包含openID的json字符串</returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string GetwechatOPenID(string code)
        {
            var grantType = "authorization_code";
            var appId = "wxe8dc58e12b05f6a7";
            var secret ="1df11da8734cf02dbb79989f27021d7c";
            var url = string.Format("https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type={3}",appId, secret,code,grantType);
            var result = HttpHelper.GetHtmlExByByPost(url, "", Encoding.UTF8);
            return result;
        }
        /// <summary>
        ///判断是否绑定
        /// </summary>
        /// <param name="openID"></param>
        /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
       
        public string ExsitOpenID(string openID)
        {
           // openID = "11223424234";
           var u = "{\"openId\":\"" + openID + "\"}";
           var url ="http://221.224.13.5:8190/econsole/api/accident/auth";
           var result = HttpHelper.GetHtmlExByByPost(url,u,Encoding.UTF8, p => p.ContentType = "application/json");
            //var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
            return result;
        }
      /// <summary>
      ///未绑定的进行绑定
      /// </summary>
      /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string Login(string loginId,string password,string openId)
        {
            var u = "{\"openId\":\"" + openId + "\",\"loginId\":\"" + loginId + "\",\"password\":\"" + password + "\"}";
            var url = "http://221.224.13.5:8190/econsole/api/accident/login";
            var result = HttpHelper.GetHtmlExByByPost(url, u, Encoding.UTF8, p => p.ContentType = "application/json");
            return result;
        }
        /// <summary>
        /// 获取手机验证码
        /// </summary>
        /// <param name="mobile">手机号</param>
        /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string GetvalidateCode(string mobile)
        {
            // mobile = "{\"mobile\":\""+mobile+"\"}";
             var url = string.Format("http://221.224.13.5:8190/econsole/api/sms/send?tel={0}&type=2&content=&expire=120",mobile);
             var result = HttpHelper.GetHtmlExByByPost(url,"",Encoding.UTF8, p => p.ContentType = "application/json");
             return result;
        }
        /// <summary>
        /// 用户注册
        /// </summary>
        /// <param name="password">密码</param>
        /// <param name="realName">名字</param>
        /// <param name="idCard">身份证号</param>
        /// <param name="mobile">手机号</param>
        /// <param name="validateCode">验证码</param>
        /// <param name="openId">支付宝openID</param>
        /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string Register(string password, string realName, string idCard, string mobile, string validateCode, string openId)
        {
            var temp = "{\"password\":\"" + password + "\",\"realName\":\"" + realName + "\",\"idCard\":\"" + idCard + "\",\"mobile\":\"" + mobile + "\",\"validateCode\":\"" + validateCode + "\",\"openId\":\"" + openId + "\"}";
            var url = "http://221.224.13.5:8190/econsole/api/accident/register";
            var result = HttpHelper.GetHtmlExByByPost(url, temp, Encoding.UTF8, p => p.ContentType = "application/json");
            return result;
        }
        //系统时间转为时间戳
        public static double ConvertDateTimeInt(System.DateTime time)
        {
            double intResult = 0;
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1,0,0,0));
            intResult = (time - startTime).TotalSeconds;
            return intResult;
        }

        [WebInvoke(Method = "POST")]
        [OperationContract]
       // public string uploadPhoto(Object fd)
        public string uploadPhoto(string userId)
        {

            var url = string.Format("http://221.224.13.5:8190/econsole/api/accident/photos/upload");
            var result = HttpHelper.GetHtmlExByByPost(url,"", Encoding.UTF8,p =>p.ContentType ="multipart/form-data");
            if(result==null)
            { 
               return null;
            }
            return result;
        }
        [OperationContract]
        [WebInvoke(Method = "POST",
                    BodyStyle = WebMessageBodyStyle.Wrapped,
                    RequestFormat = WebMessageFormat.Json,
                    ResponseFormat = WebMessageFormat.Json)]
        public string  UploadFile(string fileData1, string fileData2, string fileData3,string takerName,string userId,string coord,string shootTime,string position)
        {
            fileData1 = fileData2 = fileData3 = "";
            var url =string.Format("http://221.224.13.5:8190/econsole/api/accident/photos/place?takerName={0}&userId={1}&coord={2}&shootTime={3}&position={4}&photo={5}&photo={6}&photo={7}", takerName, userId, coord, shootTime, position, fileData1, fileData2, fileData3);
           // var url = "http://221.224.13.5:8190/econsole/api/accident/photos/place";
           // var temp = "{\"takerName\":\"" + takerName + "\",\"userId\":\"" + userId + "\",\"coord\":\"" + coord + "\",\"shootTime\":\"" + shootTime + "\",\"position\":\"" + position + "\",\"photo\":\"" + fileData1 + "\",\"photo\":\"" + fileData2 + "\",\"photo\":\"" + fileData3 + "\"}";
            var result = HttpHelper.GetHtmlExByByPost(url,"", Encoding.UTF8);
            if (result == null)
            {
                return null;
            }
            return result; 
        }

        /// <summary>
        /// 快撤理赔提交用户信息
        /// </summary>
        /// <param name="telA">本人手机号</param>
        /// <param name="telB">对方手机号</param>
        /// <param name="licenseA">本人驾驶证</param>
        /// <param name="licenseB">对方驾驶证</param>
        /// <param name="accidentId">事故编号</param>
        /// <param name="takerName">用户姓名</param>
        /// <param name="userId">用户ID</param>
        /// <returns></returns>
        /// 快撤理赔事故理赔中心处理  post 方法	

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string Submit(string telA, string telB, string licenseA, string licenseB, string accidentId, string takerName, string userId)
        {
            telA = telB = "15850222222";
            licenseA = licenseB = "4104201990010126610";
            accidentId = "KC20151116000006";
            takerName = "测试数据";
            userId="1693335";
            var handler = "3";
            var url = string.Format("http://221.224.13.5:8190/econsole/api/accident/info/process?telA={0}&telB={1}&licenseA={2}&licenseB={3}&accidentId={4}&takerName={5}&userId={6}&handler={7}",telA,telB,licenseA, licenseB,accidentId,takerName,userId,handler);
            // var url = "http://221.224.13.5:8190/econsole/api/accident/info/process";
            var result = HttpHelper.GetHtmlExByByPost(url,"", Encoding.UTF8);
             return result;
        }
        /// <summary>
        /// 查询用户的理赔记录
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <param name="page_index">页码</param>
        /// <param name="start_date">开始时间</param>
        /// <param name="end_date">结束时间</param>
        /// <returns>返回json格式的历史记录</returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string TrafficHistory(string userid, string page_index, string start_date, string end_date, string card_num)
        {
           var url = string.Format("http://221.224.13.5:8190/econsole/api/accident/history?user_id={0}&page_index={1}&start_date={2}&end_date={3}&cards_num={4}", userid,page_index,start_date,end_date,card_num);
           var result = HttpHelper.GetHtmlExByByPost(url,"",Encoding.UTF8);
           if (result == null)
           { return null; }
            return result;
        }
      
        /// <summary>
        /// 理赔详情中的图片
        /// </summary>
        /// <param name="user_id">用户ID</param>
        /// <param name="accident_id">事故Id</param>
        /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string accidentphotos(string user_id, string accident_id)
        {
           // user_id = "1693335";
           // accident_id = "KC20151116000006";
            var url = string.Format("http://221.224.13.5:8190/econsole/api/accident/accidentphotos?user_id={0}&accident_id={1}",user_id,accident_id);
            var result = HttpHelper.GetHtmlExByByPost(url,"",Encoding.UTF8);
            return result;
        }
        /// <summary>
        /// 撤销快撤理赔上报
        /// </summary>
        /// <param name="accidentid">事故ID</param>
        /// <param name="uid">用户ID</param>
        /// <returns></returns>
        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string revoke(string accidentid,string uid)
        {
            var url = string.Format("http://221.224.13.5:8190/econsole/api/accident/report/revoke?accidentId={0}&uid={1}",accidentid,uid);
            var result = HttpHelper.GetHtmlExByByPost(url,"", Encoding.UTF8);
            return result;
        }
        

    }
}

