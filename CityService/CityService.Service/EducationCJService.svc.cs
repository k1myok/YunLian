using CityService.DataAccess;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Xml;
using System.Web;
using System.Configuration;

namespace CityService.Service
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class EducationCJService
    {
        #region Andy.Chien Add

        //获取xml的地址
        private static string xmlUrl = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["MappingUrl"]);
        //获取
        private List<CityService.DataAccess.TableMapping> lMapping = GetMapping();

        #region 考试日期查询

        /// <summary>
        /// CreatedBy:Andy.Chien
        /// CreatedDate:2015/11/04
        /// 获取考试日期的方法
        /// </summary>
        /// <returns>考试日期的JSON字符串</returns>
        [WebGet]
        [OperationContract]
        public String GetTestDate(String testType, String classification)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var TestType = GetValueByKey(testType);
                var Classification = GetValueByKey(classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == TestType && m.Classification == Classification);
                if (list != null)
                {
                    var newList = list.ToList();
                    //序列化成JSON字符串
                    return ListToJsonStr(newList);
                }
            }
            return "";
        }

        #endregion

        #region 高考

        /// <summary>
        /// 高考口语成绩查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="KJH">考籍号</param>
        /// <param name="XM">考生姓名</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetGKYCJCX(String TestType, String Classification, String KJH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE KJH='{1}' AND XM='{2}'", tableName, KJH, XM);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 高考学测成绩查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="KJH">考籍号</param>
        /// <param name="SFZH">身份证号</param>
        /// <param name="XM">考生姓名</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetGKXCCJCX(String TestType, String Classification, String KJH, String SFZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE KJH='{1}' AND SFZH='{2}' AND XM='{3}'", tableName, KJH, SFZH, XM);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        #endregion

        #region 中考

        /// <summary>
        /// 中考成绩查询
        /// </summary>
        /// <param name="TestType"></param>
        /// <param name="Classification"></param>
        /// <param name="ZKZH"></param>
        /// <param name="XM"></param>
        /// <param name="Date"></param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZKCJCX(String TestType, String Classification, String ZKZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE XM='{1}' AND ZKH='{2}'", tableName, XM, ZKZH);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }


        /// <summary>
        /// 中考考场查询
        /// </summary>
        /// <param name="TestType">分类</param>
        /// <param name="Classification">子类</param>
        /// <param name="ZKZH">准考证号</param>
        /// <param name="XM">姓名</param>
        /// <param name="Date">日期</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZKKCCX(String TestType, String Classification, String ZKZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE XM='{1}' AND ZKH='{2}'", tableName, XM, ZKZH);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 中考人机对话成绩查询
        /// </summary>
        /// <param name="TestType">分类</param>
        /// <param name="Classification">子类</param>
        /// <param name="KH">考号</param>
        /// <param name="XM">姓名</param>
        /// <param name="Date">日期</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZKRJDHCJCX(String TestType, String Classification, String KH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE 姓名='{1}' AND 考号='{2}'", tableName, XM, KH);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }


        #endregion

        #region 自考

        /// <summary>
        /// 自考通知查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="ZKZH">准考证号</param>
        /// <param name="XM">考生姓名</param>
        /// <returns></returns
        [WebGet]
        [OperationContract]
        public String GetZIKTZCX(String TestType, String Classification, String ZKZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE ZKZH='{1}' AND XM='{2}' ORDER BY T ", tableName, ZKZH, XM);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 自考成绩查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="ZKZH">准考证号</param>
        /// <param name="XM">考生姓名</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZIKCJCX(String TestType, String Classification, String ZKZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE ZKZH='{1}' AND XM='{2}'", tableName, ZKZH, XM);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 自考材料信息查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="KCDH">课程代号</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZIKCLXXCX(String TestType, String Classification, String KCDH, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE KCDH='{1}' ", tableName, KCDH);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 自考考试日程查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="ZYDM">专业代码</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetZIKKSRCCX(String TestType, String Classification, String ZYDM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    var rq1bm = list.ToList()[0].RQ1BM;
                    var rq2bm = list.ToList()[0].RQ2BM;
                    var rq3bm = list.ToList()[0].RQ3BM;
                    var rq4bm = list.ToList()[0].RQ4BM;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE ZYDM='{1}' ", tableName, ZYDM);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //添加列
                            ds.Tables[0].Columns.Add(new DataColumn("RQ1BM", typeof(String)));
                            ds.Tables[0].Columns.Add(new DataColumn("RQ2BM", typeof(String)));
                            ds.Tables[0].Columns.Add(new DataColumn("RQ3BM", typeof(String)));
                            ds.Tables[0].Columns.Add(new DataColumn("RQ4BM", typeof(String)));
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                row["RQ1BM"] = rq1bm;
                                row["RQ2BM"] = rq2bm;
                                row["RQ3BM"] = rq3bm;
                                row["RQ4BM"] = rq4bm;
                            }
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        #endregion

        #region 研究生

        /// <summary>
        /// 研究生考场查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="XM">姓名</param>
        /// <param name="BMH">报名号</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetYJSKCCX(String TestType, String Classification, String XM, String BMH, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE XM='{1}' AND BMH='{2}'", tableName, XM, BMH);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        #endregion

        #region 成人高考

        /// <summary>
        /// 成人高考成绩查询
        /// </summary>
        /// <param name="TestType">分类</param>
        /// <param name="Classification">子类</param>
        /// <param name="ZKZH">准考证号</param>
        /// <param name="XM">姓名</param>
        /// <param name="Date">日期</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetCKCJCX(String TestType, String Classification, String ZKZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT *,CASE XBDM WHEN '1' THEN '男' WHEN '2' THEN '女' END AS XB FROM {0} WHERE XM='{1}' AND ZKZH='{2}'", tableName, XM, ZKZH);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 成人高考考场查询查询
        /// </summary>
        /// <param name="TestType">分类</param>
        /// <param name="Classification">子类</param>
        /// <param name="ZKZH">准考证号</param>
        /// <param name="XM">姓名</param>
        /// <param name="Date">日期</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetCKKCCX(String TestType, String Classification, String ZKZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE XM='{1}' AND ZKZH='{2}'", tableName, XM, ZKZH);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        #endregion

        #region 证书考试

        /// <summary>
        /// 全国计算机等级考试成绩查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="ZKZH">准考证号</param>
        /// <param name="ZJH">证件号</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetQGJSJDJKSCX(String TestType, String Classification, String ZKZH, String ZJH, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        //SQL
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE 1=1 ", tableName);
                        if (!String.IsNullOrEmpty(ZKZH))
                        {
                            sqlStr += String.Format(@" AND ZKZH='{0}' ", ZKZH);
                        }
                        if (!String.IsNullOrEmpty(ZJH))
                        {
                            sqlStr += String.Format(@" AND ZJH='{0}' ", ZJH);
                        }
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 全国英语等级考试成绩查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="ZKZH">准考证号</param>
        /// <param name="ZJH">证件号</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String GetQGYYDJKSCJCX(String TestType, String Classification, String ZKZH, String ZJH, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        //SQL
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE 1=1 ", tableName);
                        if (!String.IsNullOrEmpty(ZKZH))
                        {
                            sqlStr += String.Format(@" AND ZKZH='{0}' ", ZKZH);
                        }
                        if (!String.IsNullOrEmpty(ZJH))
                        {
                            sqlStr += String.Format(@" AND ZJH='{0}' ", ZJH);
                        }
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        /// <summary>
        /// 教师资格证考试成绩查询
        /// </summary>
        /// <param name="testType">大类类型</param>
        /// <param name="classification">分类类型</param>
        /// <param name="SFZH">身份证号</param>
        /// <param name="XM">姓名</param>
        /// <returns></returns>
        [WebGet]
        [OperationContract]
        public String QGJSZGZKSCX(String TestType, String Classification, String SFZH, String XM, String Date)
        {
            //判断XML数据是否为空
            if (lMapping != null && lMapping.Count > 0)
            {
                #region 转换成XML存储的中文
                var testType = GetValueByKey(TestType);
                var classification = GetValueByKey(Classification);
                #endregion
                //XML数据筛选获取对应的表名
                var list = lMapping.Where(m => m.TestType == testType && m.Classification == classification && m.Date == Date);
                if (list != null)
                {
                    //获取表名
                    var tableName = list.ToList()[0].TableName;
                    if (!String.IsNullOrEmpty(tableName))
                    {
                        //SQL
                        var sqlStr = String.Format(@" SELECT * FROM {0} WHERE SFZH='{1}' AND XM='{2}' ", tableName, SFZH, XM);
                        //获取对应的数据
                        DbHelper db = new DbHelper();
                        DbCommand cmd = db.GetSqlStringCommond(sqlStr);
                        var ds = db.ExecuteDataSet(cmd);
                        if (ds != null && ds.Tables != null)
                        {
                            //调用反序列化生成JSON字符串
                            return DataTableToJsonStr(ds.Tables[0]);
                        }
                    }
                }
            }
            return "";
        }

        #endregion

        #region 通用方法

        /// <summary>
        /// CreatedBy:Andy.Chien
        /// CreatedDate:2015/11/04
        /// 数据表转换成JSON字符串的方法
        /// </summary>
        /// <returns></returns>
        private String DataTableToJsonStr(DataTable table)
        {
            var jsonStr = "";
            if (table != null && table.Rows != null && table.Rows.Count > 0)
            {
                //反序列化成JSON字符串
                jsonStr = JsonConvert.SerializeObject(table, new DataTableConverter());
            }
            return jsonStr;
        }

        /// <summary>
        /// CreatedBy:Andy.Chien
        /// CreatedDate:2015/11/04
        /// 数据集转换成JSON字符串的方法
        /// </summary>
        /// <returns></returns>
        private String ListToJsonStr(List<CityService.DataAccess.TableMapping> list)
        {
            var jsonStr = "";
            if (list != null && list.Count > 0)
            {
                //反序列化成JSON字符串
                jsonStr = JsonConvert.SerializeObject(list, new DataTableConverter());
            }
            return jsonStr;
        }

        /// <summary>
        /// CreatedBy:Andy.Chien
        /// CreatedDate:2015/11/04
        /// 获取XML数据集
        /// </summary>
        /// <returns></returns>
        private static List<CityService.DataAccess.TableMapping> GetMapping()
        {
            if (!String.IsNullOrEmpty(xmlUrl))
            {
                var lMapping = new List<CityService.DataAccess.TableMapping>();
                #region 读取XML文件并封装成对象集合

                XmlDocument doc = new XmlDocument();
                doc.Load(xmlUrl);    //加载Xml文件  
                XmlElement rootElem = doc.DocumentElement;   //获取根节点  
                XmlNodeList personNodes = rootElem.GetElementsByTagName("Mapping"); //获取Mapping子节点集合
                //判断节点内是否存在数据
                if (personNodes.Count > 0)
                {
                    foreach (XmlNode node in personNodes)
                    {
                        //实例化实体对象
                        var mapping = new CityService.DataAccess.TableMapping();
                        //获取TestType节点的值
                        var testTypeNodes = ((XmlElement)node).GetElementsByTagName("TestType");  //获取TestType子XmlElement集合  
                        if (testTypeNodes != null && testTypeNodes.Count > 0)
                        {
                            mapping.TestType = testTypeNodes[0].InnerText;
                        }
                        //获取Classification节点的值
                        var classificationNodes = ((XmlElement)node).GetElementsByTagName("Classification");  //获取Classification子XmlElement集合  
                        if (classificationNodes != null && classificationNodes.Count > 0)
                        {
                            mapping.Classification = classificationNodes[0].InnerText;
                        }
                        //获取Date节点的值
                        var dateNodes = ((XmlElement)node).GetElementsByTagName("Date");  //获取Classification子XmlElement集合  
                        if (dateNodes != null && dateNodes.Count > 0)
                        {
                            mapping.Date = dateNodes[0].InnerText;
                        }
                        //获取Date节点的值
                        var tableNameNodes = ((XmlElement)node).GetElementsByTagName("TableName");  //获取Classification子XmlElement集合  
                        if (tableNameNodes != null && tableNameNodes.Count > 0)
                        {
                            mapping.TableName = tableNameNodes[0].InnerText;
                        }
                        //获取RQ1BM节点的值
                        var rq1bmNodes = ((XmlElement)node).GetElementsByTagName("RQ1BM");  //获取Classification子XmlElement集合  
                        if (rq1bmNodes != null && rq1bmNodes.Count > 0)
                        {
                            mapping.RQ1BM = rq1bmNodes[0].InnerText;
                        }
                        //获取RQ2BM节点的值
                        var rq2bmNodes = ((XmlElement)node).GetElementsByTagName("RQ2BM");  //获取Classification子XmlElement集合  
                        if (rq2bmNodes != null && rq2bmNodes.Count > 0)
                        {
                            mapping.RQ2BM = rq2bmNodes[0].InnerText;
                        }
                        //获取RQ3BM节点的值
                        var rq3bmNodes = ((XmlElement)node).GetElementsByTagName("RQ3BM");  //获取Classification子XmlElement集合  
                        if (rq3bmNodes != null && rq3bmNodes.Count > 0)
                        {
                            mapping.RQ3BM = rq3bmNodes[0].InnerText;
                        }
                        //获取RQ4BM节点的值
                        var rq4bmNodes = ((XmlElement)node).GetElementsByTagName("RQ4BM");  //获取Classification子XmlElement集合  
                        if (rq4bmNodes != null && rq4bmNodes.Count > 0)
                        {
                            mapping.RQ4BM = rq4bmNodes[0].InnerText;
                        }
                        //添加到集合内
                        lMapping.Add(mapping);
                    }
                }

                #endregion
                return lMapping;
            }
            return null;
        }

        /// <summary>
        /// 通过传递过来的英文标签获取中文名称
        /// </summary>
        /// <param name="key">字母标签</param>
        /// <returns></returns>
        private string GetValueByKey(String key)
        {
            var value = "";
            switch (key)
            {
                case "NEMT":
                    value = "高考";
                    break;
                case "SelfStudy":
                    value = "自考";
                    break;
                case "Postgraduate":
                    value = "研究生";
                    break;
                case "gkcjcx":
                    value = "高考成绩查询";
                    break;
                case "gkkdcx":
                    value = "高考考点查询";
                    break;
                case "gkkjhkshcx":
                    value = "高考考籍号考生号查询";
                    break;
                case "kycjcx":
                    value = "口语成绩查询";
                    break;
                case "xyspcscx":
                    value = "学测成绩查询";
                    break;
                case "ziktzcx":
                    value = "考试通知书查询";
                    break;
                case "zikcjcx":
                    value = "自考成绩查询";
                    break;
                case "zikclxxcx":
                    value = "自考教材信息查询";
                    break;
                case "zikksrccx":
                    value = "自考考试日程查询";
                    break;
                case "yjskccx":
                    value = "研究生考场查询";
                    break;
                case "Certificate":
                    value = "证书";
                    break;
                case "NCRE":
                    value = "全国计算机等级考试查询";
                    break;
                case "PETS":
                    value = "全国英语等级考试成绩查询";
                    break;
                case "jszgkscx":
                    value = "教师资格考试成绩查询";
                    break;
                case "JuniorHigh":
                    value = "中考";
                    break;
                case "zkcjcx":
                    value = "中考成绩查询";
                    break;
                case "zkkccx":
                    value = "中考考场查询";
                    break;
                case "zkrjdhcjcx":
                    value = "中考人机对话成绩查询";
                    break;
                case "Adult":
                    value = "成考";
                    break;
                case "ckcjcx":
                    value = "成考成绩查询";
                    break;
                case "ckkccx":
                    value = "成考考场查询";
                    break;
            }
            return value;
        }

        #endregion

        #endregion
    }
}
