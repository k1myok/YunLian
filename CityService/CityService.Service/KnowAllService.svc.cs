using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.IO;
using Newtonsoft.Json;
using System.Xml;
using System.Xml.Linq;
using CityService.Service.KnowAllNew;
using CityService.Service;
using CityService.DataAccess;
using System.Configuration;


namespace CityService.Service
{
    [ServiceContract(Namespace = "")] 
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class KnowAllService
    {
        //#region Get PageSize By Config Files
        protected static string pagesize = ConfigurationManager.ConnectionStrings["PageSize"].ToString();
        //#endregion

        //[WebGet]
        //[OperationContract]
        //public string GetInfo()
        //{
        //    var client = new KnowAllServiceReference.WebService1SoapClient();
        //    var result = client.GetInfoXml().Replace("\r","").Replace("\n","").Replace("\t","");
        //    return result;
        //}
        //[WebGet]
        //[OperationContract]
        //public string GetCaseInfo(string guid)
        //{
        //    var client = new KnowAllServiceReference.WebService1SoapClient();
        //    return client.GetcaseinfoByGuid(guid).Replace("\r", "").Replace("\n", "").Replace("\t", "");
        //}

      /// <summary>
      /// 接口获取生活服务站列表
      /// </summary>
      /// <returns></returns>
        [WebGet]
        [OperationContract]
        public SHFWZList Zwbst_GetShfwzList()
        {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetShfwzList();
             SHFWZList com = Newtonsoft.Json.JsonConvert.DeserializeObject<SHFWZList>(result);
            return com;
        }

        /// <summary>
        /// 获取企业服务明细
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]

        public Company Zwbst_GetEntDetail(string id)
        {
            ///ENTERPRICEGUID
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetEntDetail(id);
            Company com = Newtonsoft.Json.JsonConvert.DeserializeObject<Company>(result);
            return com;
        }
        /// <summary>
        /// 获取企业收费标准
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public ZWBSTSF Zwbst_GetEntSfbz(string id)
        {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetEntSfbz(id);
           var  resulttemp = result.Replace("\\", "\\\\");
           ZWBSTSF sfbz = Newtonsoft.Json.JsonConvert.DeserializeObject<ZWBSTSF>(resulttemp);
            return sfbz;
        }

        #region Andy Qian Add By 2015/12/11

        #region 政务百事通

        /// <summary>
        /// 获取政务百事通列表（1.便民公告，2.政务信息）
        /// </summary>
        /// <param name="Type">类型</param>
        /// <param name="Time">时间段</param>
        /// <param name="Title">标题</param>
        /// <param name="PageIndex">页码下标</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZwbst_GetInfoList(String Type, String Time, String Title, String PageIndex)
        {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetInfoList(Type, Time, Title,Convert.ToInt32(PageIndex), Convert.ToInt32(pagesize));
            return result;
        }

        /// <summary>
        /// 获取政务百事通明细
        /// </summary>
        /// <param name="Id">主键</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZwbst_GetInfoDetail(String Id) {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetInfoDetail(Id);
            return result;
        }

        /// <summary>
        /// 获取评价列表
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZwbst_GetInfoEvalList(String Id) {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetInfoEvalList(Id);
            return result;
        }

        /// <summary>
        /// 添加评价信息
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZwbst_AddEval(String Id, String Score)
        {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_AddEval(Id,Convert.ToInt32(Score));
            return result;
        }
        #endregion

        #region 便民地图

        /// <summary>
        /// 获取站点类别的集合
        /// </summary>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZwbst_GetBmdtType()
        {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetBmdtType();
            return result;
        }

        /// <summary>
        /// 通过站点类别获取站点集合
        /// </summary>
        /// <param name="TypeId">站点类别的GUID</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZwbst_GetBmdtList(String TypeId)
        {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetBmdtList(TypeId);
            return result;
        }

        /// <summary>
        /// 通过站点guid获取明细
        /// </summary>
        /// <param name="Id">主键</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZwbst_GetBmdtDetail(String Id)
        {
            var client = new KnowAllNew.WebService1SoapClient();
            var result = client.Zwbst_GetBmdtDetail(Id);
            return result;
        }

        #endregion 

        #endregion
    }
}
