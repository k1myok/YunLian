using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Xml.Linq;
using CityService.DataAccess;
using Aop.Api.Request;
using Aop.Api.Response;
using Aop.Api;
using CityService.Service;
using System.Xml;

[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class HospitalInfoService
{
    // 要使用 HTTP GET，请添加 [WebGet] 特性。(默认 ResponseFormat 为 WebMessageFormat.Json)
    // 要创建返回 XML 的操作，
    //     请添加 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
    //     并在操作正文中包括以下行:
    //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
    [OperationContract]
    public void DoWork()
    {
        // 在此处添加操作实现
        return;
    }
    private static string wechatappId = ConfigurationManager.AppSettings["wechatappId"];
    private static string wechatsecret = ConfigurationManager.AppSettings["wechatsecret"];
    /// <summary>
    /// 获取微信用户的OPenID
    /// </summary>
    /// <param name="code">接收到的临时参数</param>
    /// <returns>返回包含openID的json字符串</returns>
    [OperationContract]
    [WebGet(ResponseFormat = WebMessageFormat.Json)]
    public string GetwechatOPenID(string code)
    {
        var grantType = "authorization_code";
        var url = string.Format("https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type={3}", wechatappId, wechatsecret, code, grantType);
        var result = HttpHelper.GetHtmlExByByPost(url, "", Encoding.UTF8);
        return result;
    }
    /// <summary>
    /// 获取支付宝当前用户的OpenID
    /// </summary>
    /// <param name="code"></param>
    /// <returns>openID</returns>
    [WebGet]
    [OperationContract]
    public string GetOpenID(string code)
    {
        var appid = "2015060100099966";
        var url = "https://openapi.alipay.com/gateway.do";
        //35测试服务
        //var privateKeyPem = @"C:\Projects\PreProjects\Releases\CompanyWebSite\AlipayCityService_Debug\CityService.Service\Resource\rsa_private_key.pem";
        //35服务器
       //var privateKeyPem = @"C:\Projects\PreProjects\Releases\CityService\CityService.Service\Resource\rsa_private_key.pem";
      
        //本地服务器
        var privateKeyPem = @"E:\Projects\PreProjects\Source\CityService\CityService.Service\Resource\rsa_private_key.pem";
        //阿里 7 /156
        //var privateKeyPem = @"D:\Projects\Preprojects\Releases\CityService\CityService.Service\Resource\rsa_private_key.pem";
        IAopClient client = new DefaultAopClient(url, appid, privateKeyPem);
        AlipaySystemOauthTokenRequest req = new AlipaySystemOauthTokenRequest();
        req.Code = code;
        req.GrantType = "authorization_code";
        AlipaySystemOauthTokenResponse res = client.Execute(req);
        return res.AlipayUserId;
    }
    [WebGet]
    [OperationContract]
    public string GetExamReport(string idCard, string examNumber)
    {
        return GetReports("GetExamReport", idCard, examNumber);
    }
    [WebGet]
    [OperationContract]
    public string GetLabReport(string idCard, string labOrOutpatientNumber)
    {
        return GetReports("GetLabReport", idCard, labOrOutpatientNumber);
    }
    /// <summary>
    /// 获取医院列表
    /// </summary>
    /// <returns>XML格式的医院信息列表</returns>
    [WebGet]
    [OperationContract]
    public string GetHospitials()
    {
        var args = "<?xml version='1.0' encoding='UTF-8'?>" +
        "<S:Envelope xmlns:S='http://schemas.xmlsoap.org/soap/envelope/'>" +
        " <S:Body>" +
        "     <GetHospInfoReq xmlns='http://new.webservice.namespace'>" +
        "         <AuthInfo>" +
        "            <UserName>SZYunLian</UserName>" +
        "            <Password>YunLian1156</Password>" +
        "        </AuthInfo>" +
        "        <Filter>" +
        "            <OperType>GetHospBasic</OperType>" +
        "            <HospName></HospName>" +
        "            <DepartName></DepartName>" +
        "            <DoctorName></DoctorName>" +
        "            <BeginDate></BeginDate>" +
        "            <EndDate></EndDate>" +
        "        </Filter>" +
        "        <NotifyAddr></NotifyAddr>" +
        "    </GetHospInfoReq>" +
        "    </S:Body>" +
        "</S:Envelope>";
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        return result;
    }
    /// <summary>
    /// 获取医院科室的号源信息
    /// </summary>
    /// <param name="HospName">医院名称</param>
    /// <param name="DepartName">科室名称</param>
    /// <returns>XML格式的号源</returns>
    [WebGet]
    [OperationContract]
    public string GetDepartDetail(string HospName, string DepartName)
    {
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\regpool_req.txt");
        var context = System.IO.File.ReadAllText(fileName);
        var WorkType = string.Empty;
        var WorkDate = DateTime.Now.ToString("yyyy-MM-dd");
        if (Convert.ToInt32(System.DateTime.Now.Hour.ToString()) > 11)
        {
            WorkType = "下午";
        }
        else
        {
            WorkType = "上午";
        }
        var args = string.Format(context, "SZYunLian", "YunLian1156", HospName, DepartName, "", WorkDate, WorkType);
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        return result;
    }
    /// <summary>
    /// 获取号源信息
    /// </summary>
    /// <param name="HospName"></param>
    /// <param name="DepartName"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    // public List<XElement> GetComDepartDetail(string HospName, string DepartName)
    public string GetComDepartDetail(string HospName, string DepartName)
    {
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\regpool_req.txt");
        var context = System.IO.File.ReadAllText(fileName);
        var WorkType = string.Empty;
        var WorkDate = DateTime.Now.ToString("yyyy-MM-dd");
        if (Convert.ToInt32(System.DateTime.Now.Hour.ToString()) > 11)
        {
            WorkType = "下午";
        }
        else
        {
            WorkType = "上午";
        }
        var args = string.Format(context, "SZYunLian", "YunLian1156", HospName, DepartName, "", WorkDate, WorkType);
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        return result;
    }
    public List<XElement> FindHosptitalNodes(string xmlData)
    {
        XDocument document = XDocument.Parse(xmlData);
        var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
        var responseNode = bodyNode.Element(XName.Get("GetHospInfoRsp", "http://new.webservice.namespace"));
        var hospitalNodes = responseNode.Elements(XName.Get("Hospital", "http://new.webservice.namespace"));
        foreach (var details in hospitalNodes)
        {
            var StartTime = details.Element(XName.Get("StartTime", "http://new.webservice.namespace")).Value;
            var Endtime = details.Element(XName.Get("EndTime", "http://new.webservice.namespace")).Value;
            var TotalNum = details.Element(XName.Get("TotalNum", "http://new.webservice.namespace")).Value;
        }
        return hospitalNodes.ToList();
    }

    private string GetReports(string action, string idCard, string number)
    {
        var input = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><GetCheckRptReq><Action>{0}</Action><Message><IdCard>{1}</IdCard><DocumentNo>{2}</DocumentNo></Message></GetCheckRptReq>";
        input = string.Format(input, action, idCard, number);
        var client = new CityService.Service.EhrServiceReference.EhrServiceClient();
        return client.ehrService(input);
    }
    /// <summary>
    /// 获取医院名字列表
    /// </summary>
    /// <returns>医院名字</returns>
    [WebGet]
    [OperationContract]
    public string[] GetHospitalList()
    {
        var context = new CityServiceModelContainer();
        var result = context.Hospital.OrderBy(p => p.HospName).Select(p => p.HospName).ToArray();
        return result;
    }
    /// <summary>
    /// 获取普通科室列表
    /// </summary>
    /// <param name="HospName">医院名字</param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string[] GetCommonDepart(string HospName)
    {
        var workType = "";
        var context = new CityServiceModelContainer();
        var dateTime = DateTime.Parse(DateTime.Now.ToShortDateString());
        if (Convert.ToInt32(DateTime.Now.Hour.ToString()) > 11)
            workType = "下午";
        else
            workType = "上午";
        var result = context.schedual.Where(p => p.HospName == HospName && p.WorkType == workType && p.DoctorName == null && p.WorkDate == dateTime && p.WorkStatus == "正常").Select(p => p.DepartName).OrderBy(p=>p).Distinct().ToArray();
        return result;
    }

    /// <summary>
    /// 查询普通门诊
    /// </summary>
    /// <param name="HospName"></param>
    /// <param name="SearchDepartName"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string[] GetSearchCommonDepart(string HospName, string SearchDepartName) 
    {
        var context = new CityServiceModelContainer();
        var result = context.schedual.Where(
         s => s.HospName == HospName && s.DepartName.Contains(SearchDepartName) && s.WorkDate == DateTime.Today&&s.WorkStatus=="正常"
        ).Select(s => s.DepartName).Distinct().ToArray();
        return result;
    }
    /// <summary>
    /// 获取专家科室列表
    /// </summary>
    /// <param name="HospName">医院名字</param>
    /// <returns>医院的相关专家科室</returns>
    [WebGet]
    [OperationContract]
    public string[] GetExpertDepart(string HospName)
    {
        var context = new CityServiceModelContainer();
        var result = context.schedual.Where(p => p.HospName == HospName && p.WorkType != null && p.DoctorName != null && p.WorkDate != null && p.WorkStatus == "正常").OrderBy(p => p.DepartName).Select(p => p.DepartName).Distinct().ToArray();
        return result;
    }
    /// <summary>
    /// 获取专家挂号科室的医生列表
    /// </summary>
    /// <param name="HospName">医院名字</param>
    /// <param name="DepartName">科室名字</param>
    /// <returns>所选科室的排班专家列表</returns>
    /// 更改为表的链接 排除没有排班的医生
    [WebGet]
    [OperationContract]
    public List<ExDepartDoc> GetDepartDoc(string HospName, string DepartName)
    {
        var context = new CityServiceModelContainer();
        var result=(from d in context.schedual
                    join p in context.Doctor
                    on d.DoctorName equals p.DoctorName
                    where p.HospName==HospName&&p.DepartName==DepartName&&d.HospName==HospName&&d.DepartName==DepartName&&d.DoctorName!=null
                     select new ExDepartDoc()
                      {
                          DoctorName = d.DoctorName,
                          DocSex = p.DocSex,
                          DocPhotoURL = p.DocPhotoURL,
                          DocRank = p.DocRank,
                          HospName = d.HospName,
                          DepartName = d.DepartName
                      }).Distinct().ToList();
        return result;
    }
    /// <summary>
    /// 查询专家门诊
    /// </summary>
    /// <param name="HospName"></param>
    /// <param name="SearchDepartName"></param>
    /// <param name="SearchDocName"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public List<ExDepartDoc> GetSearchDepartDoc(string HospName, string SearchDepartName, string SearchDocName) 
    {
        var context = new CityServiceModelContainer();
        var result = (from s in context.schedual
                      join d in context.Doctor
                       on s.DoctorName equals d.DoctorName
                      where s.HospName == HospName && d.DepartName.Contains(SearchDepartName) && s.DepartName.Contains(SearchDepartName) && s.DoctorName.Contains(SearchDocName) && d.HospName == HospName
                      select new ExDepartDoc()
                      {
                          DoctorName = d.DoctorName,
                          DocSex = d.DocSex,
                          DocPhotoURL = d.DocPhotoURL,
                          DocRank = d.DocRank,
                          HospName = d.HospName,
                          DepartName = d.DepartName
                      }).Distinct().ToList();
        return result;
    }
    /// <summary>
    /// 添加挂号人信息
    /// </summary>
    /// <param name="Name">姓名</param>
    /// <param name="IDCard">身份证号</param>
    /// <param name="Phone">手机号</param>
    /// <param name="Style">就诊类型（自费或者市民卡)</param>
    /// <returns>布尔类型</returns>
    [WebGet]
    [OperationContract]
    public string Addmember(string Name, string IDCard, string Phone, string Fee, string OpenID)
    {
        var tempName = Name.Trim();
        var tempFee = Fee.Trim();
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\getReg_req.txt");
        var context1 = System.IO.File.ReadAllText(fileName);
        var args = string.Format(context1, "SZYunLian", "YunLian1156", "", IDCard, "", "", "", "", "", "", "");
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        if (result != null)
        {
            XDocument document = XDocument.Parse(result);
            var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
            var responseNode = bodyNode.Element(XName.Get("GetRegInfoRsp", "http://new.webservice.namespace"));
            var ResultNode = responseNode.Element(XName.Get("Result", "http://new.webservice.namespace"));
            var answer = Convert.ToInt32(ResultNode.Element(XName.Get("ResultCode", "http://new.webservice.namespace")).Value);
            var context = new CityServiceModelContainer();
            if (answer == 601)
            {
                //用户在平台上不存在，添加到平台 
                var fileNameAdd = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\register_req.txt");
                var contextAdd = System.IO.File.ReadAllText(fileNameAdd);
                var argsAdd = string.Format(contextAdd, "AddReg", "", IDCard, tempName, Phone, tempFee, "苏州医院", "白内障", "", "2015-09-18", "上午", "08:10", "09:10", "", "");
                var resultAdd = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", argsAdd, Encoding.UTF8);
                if (resultAdd != null)
                {
                    var resultsave = SaveMember(tempName, IDCard, Phone, tempFee, OpenID);
                    return resultsave;
                }
                else
                { return "No"; }
            }
            else if (answer == 0)
            {
                //用户已经存在 遍历数据
                var Patient = responseNode.Element(XName.Get("Patient", "http://new.webservice.namespace"));
                var Nametemp = Patient.Element(XName.Get("Name", "http://new.webservice.namespace")).Value;
                var Phonetemp = Patient.Element(XName.Get("Phone", "http://new.webservice.namespace")).Value;
                var InsureTypetemp = Patient.Element(XName.Get("InsureType", "http://new.webservice.namespace")).Value;
                if (Nametemp == tempName && Phonetemp == Phone && InsureTypetemp == tempFee)
                {   //完全相同  存储到Member表
                    var resultsave = SaveMember(tempName, IDCard, Phone, tempFee, OpenID);
                    return resultsave;
                }
              else
             {
                    var fileNameMod = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\register_req.txt");
                    var contextMod = System.IO.File.ReadAllText(fileNameMod);
                    var argsMod = string.Format(contextMod, "ModReg", "", IDCard, tempName, Phone, tempFee, "", "", "", "", "", "", "", "", "");
                    var resultMod = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", argsMod, Encoding.UTF8);
                    if (resultMod != null)
                    {
                        XDocument documentMod = XDocument.Parse(resultMod);
                        var bodyNodeMod = documentMod.Root.Element(XName.Get("Body", documentMod.Root.Name.NamespaceName));
                        var responseNodeMod = bodyNodeMod.Element(XName.Get("RegisterRsp", "http://new.webservice.namespace"));
                        var ResultNodeMod = responseNodeMod.Element(XName.Get("Result", "http://new.webservice.namespace"));
                        var answerMod = Convert.ToInt32(ResultNodeMod.Element(XName.Get("ResultCode", "http://new.webservice.namespace")).Value);
                        if (answerMod == 0)
                        {
                            var resultsave = SaveMember(tempName, IDCard, Phone, tempFee, OpenID);
                            return resultsave;
                        }
            else
            { return "No"; }
         }
                    else
                    {
                        return "No";
                    }
                }
            }
            else
            {
                return "No";
            }
        }
        else
        {
            return "No";
        }
    }
 
    /// <summary>
    /// 普通科室获取挂号费和诊疗费
    /// </summary>
    /// <param name="HospName">医院</param>
    /// <param name="DepartName">科室</param>
    /// <returns>返回普通科室诊疗费/挂号费</returns>
    [WebGet]
    [OperationContract]
    public List<Fee> GetFee(string HospName, string DepartName)
    {
        var context = new CityServiceModelContainer();
            var result = (from p in context.Depart
                          where p.HospName == HospName && p.DepartName == DepartName
                          select new Fee()
                          {
                              RegistryFee = p.RegistryFee,
                              ClinicFee = p.ClinicFee
                          }).ToList();
            return result;
    }
    /// <summary>
    /// 获取专家科室的挂号费和这诊断费
    /// </summary>
    /// <param name="HospName"></param>
    /// <param name="DepartName"></param>
    /// <param name="DoctorName"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public List<Fee> GetEXFee(string HospName, string DepartName, string DoctorName)
    {
        var context = new CityServiceModelContainer();
        var result = (from p in context.Doctor
                      where p.HospName == HospName && p.DepartName == DepartName && p.DoctorName == DoctorName
                      select new Fee()
                      {
                          RegistryFee = p.RegistryFee,
                          ClinicFee = p.ClinicFee
                      }).ToList();
        return result;
    }
   /// <summary>
   /// 返回普通科室的专家费
   /// </summary>
   /// <param name="HospName"></param>
   /// <param name="DepartName"></param>
   /// <param name="DoctorName"></param>
   /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string[] GetExpertFee(string HospName, string DepartName, string DoctorName,string ClinicDate)
    {
       var  ClinicDat = Convert.ToDateTime(ClinicDate);
        var context = new CityServiceModelContainer();
        var result = context.schedual.Where(p => p.HospName == HospName && p.DepartName == DepartName && p.WorkStatus == "正常" && p.DoctorName == DoctorName && p.WorkDate == ClinicDat).Select(p => p.ExpertFee).Distinct().ToArray();
        return result;
    }
    /// <summary>
    /// 获取普通号的专家费
    /// </summary>
    /// <param name="HospName"></param>
    /// <param name="DepartName"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string[] GetComExpertFee(string HospName, string DepartName)
    {
        var context = new CityServiceModelContainer();
        var result = context.schedual.Where(p => p.HospName == HospName && p.DepartName == DepartName && p.WorkStatus == "正常").Select(p => p.ExpertFee).Distinct().ToArray();
        return result;
    }
    [WebGet]
    [OperationContract]
    public string GetMembertList(string IDCard)
    {  
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\getReg_req.txt");
         var context1 = System.IO.File.ReadAllText(fileName);
         var args = string.Format(context1, "SZYunLian", "YunLian1156", "", IDCard, "", "", "", "", "", "", "");
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        return result;     
    }
    /// <summary>
    /// 获取常用挂号人姓名列表
    /// </summary>
    /// <param name="name">姓名</param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public List<Member> GetMemberNameList(string OpenID)
    {
        List<Member> memList = new List<Member>();
        var content = new CityServiceModelContainer();
        var ID = content.Member.Where(p => p.openID == OpenID).Select(p => p.IDCard).ToArray();
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\getReg_req.txt");
        var context1 = System.IO.File.ReadAllText(fileName);
        for (int i = 0; i < ID.Length; i++)
        {
            Member mem = new Member();
            var args = string.Format(context1, "SZYunLian", "YunLian1156", "", ID[i], "", "", "", "", "", "", "");
            var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
            XDocument document = XDocument.Parse(result);
            var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
            var responseNode = bodyNode.Element(XName.Get("GetRegInfoRsp", "http://new.webservice.namespace"));
            var Patient = responseNode.Element(XName.Get("Patient", "http://new.webservice.namespace"));
            mem.Name = Patient.Element(XName.Get("Name", "http://new.webservice.namespace")).Value;
            mem.IDCard = Patient.Element(XName.Get("IdCard", "http://new.webservice.namespace")).Value;
            mem.Phone = Patient.Element(XName.Get("Phone", "http://new.webservice.namespace")).Value;
            mem.Style = Patient.Element(XName.Get("InsureType", "http://new.webservice.namespace")).Value;
            memList.Add(mem);
        }
        return memList;
    }
    //获取医生的详细信息
    [WebGet]
    [OperationContract]
    public List<ExDepartDoc> GetExDocIntro(string HospName, string DepartName, string DoctorName)
    {
        var context = new CityServiceModelContainer();
        var result = (from p in context.Doctor
                      where p.DepartName == DepartName && p.HospName == HospName && p.DoctorName == DoctorName
                      select new ExDepartDoc()
                      {
                          DocPhotoURL = p.DocPhotoURL,
                          DoctorName = p.DoctorName,
                          DocRank = p.DocRank,
                          HospName = p.HospName,
                          DoctorInro = p.DoctorInro,
                          DepartName = p.DepartName
                      }).ToList();
        return result;
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="HospName">医院</param>
    /// <param name="DepartName">科室</param>
    /// <param name="DoctorName">医生姓名</param>
    /// <returns>返回专家科室特定医生的所有可用排班信息</returns>
    [WebGet]
    [OperationContract]
    public List<Schedualdate> GetRegistDetails(string HospName, string DepartName, string DoctorName,string WorkDate)
    {
        if (WorkDate == "undefined")
        { 
            return null; 
        }
        else
        {
            var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\regpool_req.txt");
            var context1 = System.IO.File.ReadAllText(fileName);
            var WorkType = string.Empty;
            DateTime workDat1 = DateTime.Now;
            var context = new CityServiceModelContainer();
            if (Convert.ToString(WorkDate) != null)
            {
                workDat1 = Convert.ToDateTime(WorkDate);
            }
            else
            { return null; }
            var workDat = context.schedual.Where(p => p.HospName == HospName && p.DepartName == DepartName && p.DoctorName == DoctorName && p.WorkDate == workDat1 && p.WorkStatus == "正常").Select(p => p.WorkType).ToArray();

            if (workDat.Length >= 2)
            {
                workDat = new string[2] { "上午", "下午" };
            }
            List<Schedualdate> schedu = new List<Schedualdate>();
            for (int i = 0; i <= workDat.Length -1; i++)
            {
                //var hour = Convert.ToInt32(System.DateTime.Now.Hour.ToString());
                var args = string.Format(context1, "SZYunLian", "YunLian1156", HospName, DepartName, DoctorName, WorkDate, workDat[i]);
                var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
                XDocument document = XDocument.Parse(result);
                var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
                var responseNode = bodyNode.Element(XName.Get("GetRegPoolRsp", "http://new.webservice.namespace"));
                var ResultNode = responseNode.Element(XName.Get("Result", "http://new.webservice.namespace"));
                var answer = Convert.ToInt32(ResultNode.Element(XName.Get("ResultCode", "http://new.webservice.namespace")).Value);
                if (answer == 0)
                {
                    var PoolInfos = responseNode.Elements(XName.Get("PoolInfo", "http://new.webservice.namespace"));
                    if (PoolInfos.Count() > 0)
                    {
                        foreach (var PoolInfo in PoolInfos)
                        {
                            Schedualdate sched = new Schedualdate();
                            sched.TotalNum = PoolInfo.Element(XName.Get("TotalNum", "http://new.webservice.namespace")).Value;
                            sched.LeftNum = PoolInfo.Element(XName.Get("LeftNum", "http://new.webservice.namespace")).Value;
                            sched.StartTime = PoolInfo.Element(XName.Get("StartTime", "http://new.webservice.namespace")).Value;
                            sched.EndTime = PoolInfo.Element(XName.Get("EndTime", "http://new.webservice.namespace")).Value;
                            schedu.Add(sched);

                        }

                    }
                    else
                    { return null; };
                }
                else
                {
                    return null;
                }
            }
            return schedu;
        }
    }
    /// <summary>
    /// 普通门诊挂号
    /// </summary>
    /// <param name="idCard"></param>
    /// <param name="HospName"></param>
    /// <param name="DepartName"></param>
    /// <param name="WorkType"></param>
    /// <param name="WorkDate"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string SaveComRegistered(string HospName, string DepartName, string StartTime, string EndTime, string Name, string Phone, string IDCard, string Style, string ExpertFee, string RegistryFee, string ClinicFee, string OpenID)
    {
        var answer = 0;
        var TotalFee = Convert.ToDouble(ExpertFee) + Convert.ToDouble(RegistryFee) + Convert.ToDouble(ClinicFee);
        var membName = Name.Trim();
        var membPhone = Phone.Trim();
        var membStyle = Style.Trim();
        var WokeDate = DateTime.Now.ToString("yyyy-MM-dd");
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\register_req.txt");
        var context1 = System.IO.File.ReadAllText(fileName);
        var workType = string.Empty;
        if (Convert.ToInt32(DateTime.Now.Hour.ToString()) > 11)
            workType = "下午";
        else
            workType = "上午"; 
        var args = string.Format(context1, "AddReg", "", IDCard, membName, membPhone, membStyle, HospName, DepartName, "", WokeDate, workType, StartTime, EndTime, "", "");
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        XDocument document = XDocument.Parse(result);
        var SN = "";
        var ClinicSerialNo = "";
        var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
        var responseNode = bodyNode.Element(XName.Get("RegisterRsp", "http://new.webservice.namespace"));
        var ResultNode = responseNode.Element(XName.Get("Result", "http://new.webservice.namespace"));
         answer = Convert.ToInt32(ResultNode.Element(XName.Get("ResultCode", "http://new.webservice.namespace")).Value);

         if (answer != 0) 
        {
            return answer.ToString();
        }
        else
        { 
            SN = responseNode.Element(XName.Get("SN", "http://new.webservice.namespace")).Value;
            ClinicSerialNo = responseNode.Element(XName.Get("ClinicSerialNo", "http://new.webservice.namespace")).Value;
            var contextDB = new CityServiceModelContainer();
            var Reg = new Register();
            Reg.Name = Name.Trim();
            Reg.IDCard = IDCard.Trim();
            Reg.OPenId = OpenID;
            Reg.HospName = HospName.Trim();
            Reg.DepartName = DepartName.Trim();
            //Reg.DoctorName = DoctorName.Trim();
            Reg.Phone = Phone.Trim();
            var RegisterDate = DateTime.Now.ToString("yyyy-MM-dd");
            Reg.RegisteDate = Convert.ToDateTime(RegisterDate);
            Reg.ClinicDate = Convert.ToDateTime(WokeDate);
            Reg.StartTime = StartTime.Trim();
            Reg.EndTime = EndTime.Trim();
            Reg.RegisterFee = Convert.ToString(TotalFee);
            Reg.SN = SN;
            Reg.Status = "T";
            Reg.ClinicSerialNo = ClinicSerialNo;
            Reg.Style = Style;
            contextDB.Register.Add(Reg);
            contextDB.SaveChanges();
            return answer.ToString() + ":" + ClinicSerialNo;
        }
    }
    /// <summary>
    /// 专家科室挂号
    /// </summary>
    /// <param name="HospName"></param>
    /// <param name="DepartName"></param>
    /// <param name="DoctorName"></param>
    /// <param name="WorkType"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string SaveExRegistered(string HospName, string DepartName, string DoctorName, string StartTime, string EndTime, string Name, string Phone, string IDCard, string Style, string ExpertFee, string RegistryFee, string ClinicFee, string OpenID, string ClinicDate)
    {
        var answer = 0;
        var membName = Name.Trim();
        var membPhone = Phone.Trim();
        var TotalFee = Convert.ToDouble(ExpertFee) + Convert.ToDouble(RegistryFee) + Convert.ToDouble(ClinicFee);
        var membStyle = Style.Trim();
        var RegisterDate = DateTime.Now.ToString("yyyy-MM-dd");
        var WorkType = "";
        var a = StartTime.Split(':');
        var d = Convert.ToInt32(a[0]);
        if (d > 12)
        { WorkType = "下午"; }
        else { WorkType = "上午"; }
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\register_req.txt");
        var context1 = System.IO.File.ReadAllText(fileName);
        var args = string.Format(context1, "AddReg", "", IDCard.Trim(), membName, membPhone, membStyle, HospName, DepartName, DoctorName, ClinicDate, WorkType, StartTime, EndTime, "", "");
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        XDocument document = XDocument.Parse(result);
        var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
        var responseNode = bodyNode.Element(XName.Get("RegisterRsp", "http://new.webservice.namespace"));
        var ResultNode = responseNode.Element(XName.Get("Result", "http://new.webservice.namespace"));
        answer = Convert.ToInt32(ResultNode.Element(XName.Get("ResultCode", "http://new.webservice.namespace")).Value);
        var SN = "";
        var ClinicSerialNo = "";
        if (answer != 0)
        {
            return answer.ToString();
        }
        else
        {
        
            SN = responseNode.Element(XName.Get("SN", "http://new.webservice.namespace")).Value;
            ClinicSerialNo = responseNode.Element(XName.Get("ClinicSerialNo", "http://new.webservice.namespace")).Value;
            var contextDB = new CityServiceModelContainer();
            var Reg = new Register();
            Reg.Name = Name.Trim();
            Reg.IDCard = IDCard.Trim();
            Reg.OPenId = OpenID;
            Reg.HospName = HospName.Trim();
            Reg.DepartName = DepartName.Trim();
            Reg.DoctorName = DoctorName.Trim();
            Reg.Phone = Phone.Trim();
            Reg.RegisteDate = Convert.ToDateTime(RegisterDate);
            Reg.ClinicDate = Convert.ToDateTime(ClinicDate);
            Reg.StartTime = StartTime.Trim();
            Reg.EndTime = EndTime.Trim();
            Reg.RegisterFee = Convert.ToString(TotalFee);
            Reg.SN = SN;
            Reg.Status = "T";
            Reg.ClinicSerialNo = ClinicSerialNo;
            Reg.Style = Style;
            contextDB.Register.Add(Reg);
            contextDB.SaveChanges();
            return answer.ToString() + ":" + ClinicSerialNo;
        }
    }
 /// <summary>
 /// 取消预约信息
 /// </summary>
 /// <param name="ID"></param>
 /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string CancelRegister(string IDCard, string Name, string SN,string Style)
    {
  
        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\register_req.txt");
        var conte = System.IO.File.ReadAllText(fileName);
        var args = string.Format(conte, "DelReg", SN, IDCard, Name, "", Style, "", "", "", "", "", "", "", "", "");
        //var args = string.Format(conte, "DelReg", tempSN, tempIDCard, tempName, tempPhone, tempStyle);
        var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
        XDocument document = XDocument.Parse(result);
        var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
        var responseNode = bodyNode.Element(XName.Get("RegisterRsp", "http://new.webservice.namespace"));
        var resultNode = responseNode.Element(XName.Get("ResultCode", "http://new.webservice.namespace"));
        return null;
    }
    /// <summary>
    /// 获取未来一周内的可用专家的值班日期
    /// </summary>
    /// <param name="HospName"></param>
    /// <param name="DepartName"></param>
    /// <param name="DoctorName"></param>
    /// <returns>返回选定专家的未来一周的可用时间排班</returns>
    
     [WebGet]
     [OperationContract]
    public string GetAvaliableschedual(string HospName, string DepartName, string DoctorName)
    {
        var context = new CityServiceModelContainer();
        var result = context.schedual.Where(p => p.HospName == HospName && p.DepartName == DepartName && p.DoctorName == DoctorName&&p.WorkStatus=="正常").Select(p => p.WorkDate).Distinct().ToList();
        var dates = "";
        foreach (var date in result)
        {
            var d = Convert.ToDateTime(date).ToString("yyyy-MM-dd");
            if (HospName != "苏州市立医院东区" && HospName != "苏州市中医医院" && HospName != "苏州明基医院")
            {
                if (date == Convert.ToDateTime(DateTime.Now.ToShortDateString()))
                {
                    continue;
                }
            }
            dates += d + ",";
        }
        return dates;
    }

    /// <summary>
    /// 判断当前openIDea的用户是否存在
    /// </summary>
    /// <param name="openid">用户的OpenID</param>
    /// <returns></returns>
     [WebGet]
     [OperationContract]
    public string[] ExistOpenID(string openId)
    {
        var context = new CityServiceModelContainer();
         var result = context.Member.Where(p => p.openID == openId).Select(p => p.openID).ToArray();
         return result;
    }
    /// <summary>
    /// 根据OpenID获取当前用户未就诊记录
    /// </summary>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public List<RegisterDB> GetNotreatment(string OpenID)
    {
       
        var result = GetInfoByType("未就诊", OpenID);
        return result;
    }


    static RegisterDB[] DBResult;
     /// <summary>
    /// 根据OpenID获取当前用户已退号记录
    /// </summary>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public List<RegisterDB> GetHaveretired(string OpenID)
    {
        var result = GetInfoByType("已退号", OpenID);
        return result;
    }

    /// <summary>
    /// 根据OpenID获取当前用户已就诊记录
    /// </summary>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public List<RegisterDB> GetHavetreatment(string OpenID)
    {
        var result = GetInfoByType("已就诊",OpenID);
        return result;
    }

    /// <summary>
    /// 根据不同类型（已就诊、未就诊、已退号）获取相应的详细信息
    /// </summary>
    /// <param name="type"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    private List<RegisterDB> GetInfoByType(string type, string OpenID) 
    {
        List<RegisterDB> regList = new List<RegisterDB>();
        var beginTime = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
        var endTime = DateTime.Now.AddDays(+8).ToString("yyyy-MM-dd");
        var idCards = GetIDCardByOpenID(OpenID);

        var fileName = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\getReg_req.txt");
        var conte = System.IO.File.ReadAllText(fileName);
        for (int i = 0; i < idCards.Count(); i++)
        {
            var args = string.Format(conte, "SZYunLian", "YunLian1156", "", idCards[i], "", "", beginTime, endTime, "", "", "");
            var result = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl", args, Encoding.UTF8);
            if (result == null)
                continue;
            XDocument document = XDocument.Parse(result);
            var bodyNode = document.Root.Element(XName.Get("Body", document.Root.Name.NamespaceName));
            var regsNode = bodyNode.Element(XName.Get("GetRegInfoRsp", "http://new.webservice.namespace"));
            var msgNode = regsNode.Element(XName.Get("Result", "http://new.webservice.namespace"));
            var resultCode = msgNode.Element(XName.Get("ResultCode", "http://new.webservice.namespace")).Value;
            if (resultCode == "304" || resultCode == "602") 
            {
                continue;
            }

            var userNode = regsNode.Element(XName.Get("Patient", "http://new.webservice.namespace"));
            var regNode = regsNode.Elements(XName.Get("RegInfo", "http://new.webservice.namespace"));
            foreach (var r in regNode)
            {
                if (type == "已退号" && !string.IsNullOrEmpty(r.Element(XName.Get("QuitTime", "http://new.webservice.namespace")).Value))
                {

                    RegisterDB reg = new RegisterDB();
                    reg.Name = userNode.Element(XName.Get("Name", "http://new.webservice.namespace")).Value;
                    reg.IDCard = userNode.Element(XName.Get("IdCard", "http://new.webservice.namespace")).Value;
                    reg.HospName = r.Element(XName.Get("HospName", "http://new.webservice.namespace")).Value;
                    reg.DepartName = r.Element(XName.Get("DepartName", "http://new.webservice.namespace")).Value;
                    reg.DoctorName = r.Element(XName.Get("DoctorName", "http://new.webservice.namespace")).Value;
                    reg.ClinicDateTime = r.Element(XName.Get("ClinicDateTime", "http://new.webservice.namespace")).Value;
                    reg.ClinicSerialNo = r.Element(XName.Get("ClinicSN", "http://new.webservice.namespace")).Value;
                    reg.RegisterDate = Convert.ToDateTime(r.Element(XName.Get("RegDateTime", "http://new.webservice.namespace")).Value);
                    reg.RegisterFee = r.Element(XName.Get("UnpayedFee", "http://new.webservice.namespace")).Value;
                    regList.Add(reg);

                }
                else
                {
                    var cdt = r.Element(XName.Get("ClinicDateTime", "http://new.webservice.namespace")).Value;
                    var time = cdt.Substring(0, cdt.IndexOf(" ")) + " " + cdt.Substring(cdt.LastIndexOf("-") + 1);
                    if (type == "已就诊" && Convert.ToDateTime(time) <= DateTime.Now && string.IsNullOrEmpty(r.Element(XName.Get("QuitTime", "http://new.webservice.namespace")).Value))
                    {

                        RegisterDB reg = new RegisterDB();
                        reg.Name = userNode.Element(XName.Get("Name", "http://new.webservice.namespace")).Value;
                        reg.IDCard = userNode.Element(XName.Get("IdCard", "http://new.webservice.namespace")).Value;
                        reg.HospName = r.Element(XName.Get("HospName", "http://new.webservice.namespace")).Value;
                        reg.DepartName = r.Element(XName.Get("DepartName", "http://new.webservice.namespace")).Value;
                        reg.DoctorName = r.Element(XName.Get("DoctorName", "http://new.webservice.namespace")).Value;
                        reg.ClinicDateTime = r.Element(XName.Get("ClinicDateTime", "http://new.webservice.namespace")).Value;
                        reg.ClinicSerialNo = r.Element(XName.Get("ClinicSN", "http://new.webservice.namespace")).Value;
                        reg.RegisterDate = Convert.ToDateTime(r.Element(XName.Get("RegDateTime", "http://new.webservice.namespace")).Value);
                        reg.RegisterFee = r.Element(XName.Get("UnpayedFee", "http://new.webservice.namespace")).Value;
                        regList.Add(reg);
                    }
                    else if (type == "未就诊" && Convert.ToDateTime(time) > DateTime.Now && string.IsNullOrEmpty(r.Element(XName.Get("QuitTime", "http://new.webservice.namespace")).Value))
                    {

                        RegisterDB reg = new RegisterDB();
                        reg.Name = userNode.Element(XName.Get("Name", "http://new.webservice.namespace")).Value;
                        reg.IDCard = userNode.Element(XName.Get("IdCard", "http://new.webservice.namespace")).Value;
                        reg.HospName = r.Element(XName.Get("HospName", "http://new.webservice.namespace")).Value;
                        reg.DepartName = r.Element(XName.Get("DepartName", "http://new.webservice.namespace")).Value;
                        reg.DoctorName = r.Element(XName.Get("DoctorName", "http://new.webservice.namespace")).Value;
                        reg.ClinicDateTime = r.Element(XName.Get("ClinicDateTime", "http://new.webservice.namespace")).Value;
                        reg.ClinicSerialNo = r.Element(XName.Get("ClinicSN", "http://new.webservice.namespace")).Value;
                        reg.Style = userNode.Element(XName.Get("InsureType", "http://new.webservice.namespace")).Value;
                        reg.RegisterDate = Convert.ToDateTime(r.Element(XName.Get("RegDateTime", "http://new.webservice.namespace")).Value);
                        reg.RegisterFee = r.Element(XName.Get("UnpayedFee", "http://new.webservice.namespace")).Value;
                        reg.SN = r.Element(XName.Get("SN", "http://new.webservice.namespace")).Value;
                        regList.Add(reg);

                    }

                }
            }      
        }

        return regList;
    }
    /// <summary>
    /// 根据openID获取身份证号码
    /// </summary>
    /// <param name="openID"></param>
    /// <returns></returns>
    public List<string> GetIDCardByOpenID(string openID) 
                      {

        var content = new CityServiceModelContainer();
        var result = (from m in content.Member
                      where m.openID == openID
                      select m.IDCard).Distinct().ToList();
        return result;
    }

    /// <summary>
    /// 保存已就诊信息中对医生的评价，并提交到平台
    /// </summary>
    /// <param name="score"></param>
    /// <param name="ID"></param>
    /// <returns></returns>
    public bool GiveScore(string score, int ID)
    {
        var context = new CityServiceModelContainer();
        //Register reg = (context.Register.First(p => p.ID ==ID);
        //reg.DocRate = score;
        //reg.SaveChanges();
        Register reg = (from c in context.Register
                        where c.ID == ID
                       select c).Single();
        reg.DocRate = score;
        context.SaveChanges();
        return true;
    }
    [WebGet]
    [OperationContract]
    public string DelMember(string Name, string IdCard, string Phone, string Fee, string OpenID)
    {
        var tempName = Name.Trim();
        var tempIDCard = IdCard.Trim();
        var tempPhone = Phone.Trim();
        var tempStyle = Fee.Trim();
        var context = new CityServiceModelContainer();
        var result = (from r in context.Member
                      where r.IDCard == tempIDCard && r.Name == tempName && r.openID == OpenID && r.Style == tempStyle && r.Phone == tempPhone
                     select r);
        foreach (var a in result)
        {
            context.Member.Remove(a);
        }
        if (context.SaveChanges() > 0)
        {
            return "OK";
        
        }
        else
        {
            return "";
        }
    }
   /// <summary>
   /// 更新用户的个人信息
   /// </summary>
   /// <param name="ID"></param>
   /// <param name="Name"></param>
   /// <param name="Phone"></param>
   /// <param name="IdCard"></param>
   /// <param name="Fee"></param>
   /// <param name="OpenID"></param>
   /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string  UpMemberDetials(string Name, string Phone, string IdCard, string Fee, string OpenID)
    {
        var tempName = Name.Trim();
        var tempIDCard = IdCard.Trim();
        var tempPhone = Phone.Trim();
        var tempStyle = Fee.Trim();
        var fileNameMod = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\register_req.txt");
        var contextMod = System.IO.File.ReadAllText(fileNameMod);
        var argsMod = string.Format(contextMod, "ModReg", "", tempIDCard, tempName, Phone,tempStyle, "", "", "", "", "", "", "", "", "");
        var resultMod = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl",argsMod, Encoding.UTF8);
        if (resultMod != null)
        {
            XDocument documentMod = XDocument.Parse(resultMod);
            var bodyNodeMod = documentMod.Root.Element(XName.Get("Body", documentMod.Root.Name.NamespaceName));
            var responseNodeMod = bodyNodeMod.Element(XName.Get("RegisterRsp", "http://new.webservice.namespace"));
            var ResultNodeMod = responseNodeMod.Element(XName.Get("Result", "http://new.webservice.namespace"));
            var answerMod = Convert.ToInt32(ResultNodeMod.Element(XName.Get("ResultCode", "http://new.webservice.namespace")).Value);
            var context = new CityServiceModelContainer();
            if (answerMod == 0)
            {
             Member mem = (from c in context.Member
                           where c.IDCard == IdCard && c.openID == OpenID
                      select c).Single();
            mem.Name = tempName;
            mem.Phone = tempPhone;
            mem.Style = tempStyle;
            if (context.SaveChanges() > 0)
              { return "OK"; }
               else
              { return "NO"; }
            }
            else
            { return "No"; }
        }
        else { return "No"; }
    }
    [WebGet]
    [OperationContract]
    public string GetNews()
    {
        var StartTime = DateTime.Now.AddMonths(-3).ToString("yyyy-MM-dd");
        var EndTime = DateTime.Now.ToString("yyyy-MM-dd");
        var fileNameNews = System.IO.Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "Resource\\Template\\news_req.txt");
        var contextNews = System.IO.File.ReadAllText(fileNameNews);
        var argsModNews = string.Format(contextNews,StartTime,EndTime);
        var resultNews = HttpHelper.GetHtmlExByByPost("http://plat.jssz12320.cn:8001/szregplat/yuyue.wsdl",argsModNews,Encoding.UTF8);
        return resultNews;
    }



    /// <summary>
    /// 保存用户的个人信息到数据库
    /// </summary>
    /// <param name="Name"></param>
    /// <param name="IDCard"></param>
    /// <param name="Phone"></param>
    /// <param name="OpenID"></param>
    /// <param name="Style"></param>
    /// <returns></returns>
    [WebGet]
    [OperationContract]
    public string SaveMember(string Name, string IDCard, string Phone,string Style,string OpenID)
    {
        var context = new CityServiceModelContainer();
        var result = context.Member.Where(p => p.IDCard == IDCard && p.openID == OpenID).Select(p => p.Name).ToArray();
        if (result.Length > 0)
        {
        //    Member mem = (from c in context.Member
        //                  where c.IDCard == IDCard &&c.openID==OpenID
        //                  select c).Single();
        //    mem.Name = Name;
        //    mem.Phone = Phone;
        //    mem.Style = Style;
        //context.SaveChanges();
            return "exsit";
        }
        else
        {
            var mem = new Member();
            mem.Name = Name;
            mem.IDCard = IDCard;
            mem.Phone = Phone;
            mem.Style = Style;
            mem.openID = OpenID;
            context.Member.Add(mem);
            if (context.SaveChanges() > 0)
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
    }
}

