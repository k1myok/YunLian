﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Aop.Api.Util;
using Aop.Api.Request;
using Aop.Api.Response;
using Jayrock.Json;
using System.IO;
using System.Text;

namespace Alipay.Demo
{
    public partial class Gateway : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            log("Gateway", "====================================");
            log("Get RequestType", Request.RequestType);
            StreamReader reader = new StreamReader(Request.InputStream);
            string text = reader.ReadToEnd();
            var unescapeText = Microsoft.JScript.GlobalObject.unescape(text);

            log("Get service Type", getRequestString("service"));
            log("Get InputStream Content", text);
            log("Get unescape InputStream Content", unescapeText);
            log("Get UrlParam", GetUrlParam(getRequstParam()));

            // log(getRequestString("service"));
            //验证网关
            if ("alipay.service.check".Equals(getRequestString("service")))
            {
                //Response.Output.WriteLine(GetUrlParam());
                log("check gateway", "getting call verifygw");
                verifygw();
            }
            else if ("alipay.mobile.public.message.notify".Equals(getRequestString("service")))
            {
                log("getting biz_content", "getting read xmlnode of biz_content xml");
                string eventType = getXmlNode(getRequestString("biz_content"), "EventType");
                string MsgType = getXmlNode(getRequestString("biz_content"), "MsgType");
                string FromUserId = getXmlNode(getRequestString("biz_content"), "FromUserId");
                string UserInfo = getXmlNode(getRequestString("biz_content"), "UserInfo");
                string ActionParam = getXmlNode(getRequestString("biz_content"), "ActionParam");
                string AgreementId = getXmlNode(getRequestString("biz_content"), "AgreementId");
                string AccountNo = getXmlNode(getRequestString("biz_content"), "AccountNo");
                string AppId = getXmlNode(getRequestString("biz_content"), "AppId");
                string CreateTime = getXmlNode(getRequestString("biz_content"), "CreateTime");

                log("getting biz_content", "read xmlnode of biz_content xml completed");
                var notifyText =
                 "eventType   :"+ eventType   +
                 ",FromUserId  :"+FromUserId +
                 ",UserInfo    :"+UserInfo   +
                 ",ActionParam :"+ActionParam+
                 ",AgreementId :"+AgreementId+
                 ",AccountNo   :"+AccountNo +
                 ",AppId       :"+AppId      +
                 ",CreateTime  :"+CreateTime +
                 ",MsgType     :"+MsgType;
                //log(string.Format("{0}:{1}", "biz_content",  getXmlNode(getRequestString("biz_content"),"XML")), "postContent.txt");
                log("geted biz_content xml data", notifyText);


                if ("follow".Equals(eventType))
                {
                    

                    //用户新关注后，可以给用户发送一条欢迎消息，或者引导消息
                    //如：
                    //string biz_content = "{\"msgType\":\"image-text\",\"createTime\":\"1407229992\",\"articles\":[{\"actionName\":\"立即查看\",\"desc\":\"描述\",\"imageUrl\":\"https://i.alipayobjects.com/e/201310/1H9ctsy9oN_src.jpg\",\"title\":\"标题\",\"url\":\"http://wap.taobao.com\",\"authType\":\"loginAuth\"},{\"actionName\":\"立即查看\",\"desc\":\"描述\",\"imageUrl\":\"https://i.alipayobjects.com/e/201310/1H9ctsy9oN_src.jpg\",\"title\":\"标题\",\"url\":\"http://wap.taobao.com\",\"authType\":\"loginAuth\"}],\"toUserId\":\"" + FromUserId + "\"}";
                    //Response.Output.WriteLine( MessageSendBiz.CustomSend(biz_content));
                }
                else if ("unfollow".Equals(eventType))
                {
                   
                }
                else if ("click".Equals(eventType))
                {
                   
                }
                else if ("enter".Equals(eventType))
                {
                    
                }
            }
        }

        string getUTF8TextFromGBK(string text)
        {
            byte[] buffer = Encoding.GetEncoding("GBK ").GetBytes(text);
            return Encoding.UTF8.GetString(buffer);
        }

        //public void do

        /// <summary>
        /// 转换支付宝的请求为字典数据
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, string> getAlipayRequstParams()
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            dict.Add("service", getRequestString("service"));
            dict.Add("sign_type", getRequestString("sign_type"));
            dict.Add("charset", getRequestString("charset"));
            dict.Add("biz_content", getRequestString("biz_content"));
            dict.Add("sign", getRequestString("sign"));
            return dict;
        }

        /// <summary>
        /// 验签支付宝请求
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public bool verifySignAlipayRequest(Dictionary<string, string> param)
        {
            try
            {
                bool result = AlipaySignature.RSACheckV2(param, Config.alipay_public_key, Config.charset);
                return result;

            }
            catch (Exception ex)
            {
                log("verifySignAlipayRequest", ex.Message);

                return false;
            }
        }

        /// <summary>
        /// 支付宝验证商户网关
        /// </summary>
        public void verifygw()
        {
            log("check gateway", "into call verifygw");

            //  Request.Params;
            Dictionary<string, string> dict = getAlipayRequstParams();
            //string biz_content = AlipaySignature.CheckSignAndDecrypt(dict, Config.alipay_public_key, Config.merchant_private_key, true, false);
            string biz_content = dict["biz_content"];
            log("geted biz_content", biz_content);

            if (!verifySignAlipayRequest(dict))
            {
                log("check gateway", "verifySignAlipayRequest is false");

                verifygwResponse(false, Config.getMerchantPublicKeyStr());
            }
            if ("verifygw".Equals(getXmlNode(biz_content, "EventType")))
            {
                log("check gateway", getXmlNode(biz_content, "EventType"));
 
                verifygwResponse(true, Config.getMerchantPublicKeyStr());
                
            }
        }

        /// <summary>
        /// 按key获取get和post请求
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string getRequestString(string key)
        {
            string value = null;
            if (Request.Form.Get(key) != null && Request.Form.Get(key).ToString() != "")
            {
                value = Request.Form.Get(key).ToString();
            }
            else if (Request.QueryString[key] != null && Request.QueryString[key].ToString() != "")
            {
                value = Request.QueryString[key].ToString();
            }

            return value;
        }

        /// <summary>/// 遍历Url中的参数列表/// </summary>
        /// <returns>如:(?userName=keleyi&userType=1)</returns>
        public string GetUrlParam(Dictionary<string, string> param)
        {
            string urlParam = "";
            if (param != null)
            {
                //urlParam = "?";

                foreach (string key in param.Keys)
                {
                    urlParam += key + "=" + param[key] + "&";
                }
                urlParam = urlParam.Substring(0, urlParam.LastIndexOf('&'));
            }
            return urlParam;
        }

        /// <summary>
        /// 获取xml中的事件类型
        /// </summary>
        /// <param name="xml"></param>
        /// <returns></returns>
        public string getXmlNode(string xml, string node)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(xml);
            //string EventType = xmlDoc.GetElementsByTagName("EventType").ToString();
            var xmlNode = xmlDoc.SelectSingleNode("//" + node);
            if (xmlNode == null || xmlNode.InnerText == null)
                return null;
            string EventType = xmlNode.InnerText.ToString();
            //Response.Output.WriteLine("EventType:" + EventType);
            return EventType;
        }

        /// <summary>
        /// 验证网关，签名内容并返回给支付宝xml
        /// </summary>
        /// <param name="_success"></param>
        /// <param name="merchantPubKey"></param>
        /// <returns></returns>
        public string verifygwResponse(bool _success, string merchantPubKey)
        {
            Response.ContentType = "text/xml";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GBK");
            Response.Clear();

            XmlDocument xmlDoc = new XmlDocument(); //创建实例
            XmlDeclaration xmldecl = xmlDoc.CreateXmlDeclaration("1.0", "GBK", null);
            xmlDoc.AppendChild(xmldecl);


            XmlElement xmlElem = xmlDoc.CreateElement("alipay"); //新建元素

            xmlDoc.AppendChild(xmlElem); //添加元素


            XmlNode alipay = xmlDoc.SelectSingleNode("alipay");
            XmlElement response = xmlDoc.CreateElement("response");
            XmlElement success = xmlDoc.CreateElement("success");
            if (_success)
            {
                success.InnerText = "true";//设置文本节点 
                response.AppendChild(success);//添加到<Node>节点中 
            }
            else
            {
                success.InnerText = "false";//设置文本节点 
                response.AppendChild(success);//添加到<Node>节点中 
                XmlElement err = xmlDoc.CreateElement("error_code");
                err.InnerText = "VERIFY_FAILED";
                response.AppendChild(err);
            }

            XmlElement biz_content = xmlDoc.CreateElement("biz_content");
            biz_content.InnerText = merchantPubKey;
            response.AppendChild(biz_content);

            alipay.AppendChild(response);

            string _sign = AlipaySignature.RSASign(response.InnerXml, Config.merchant_private_key, Config.charset);

            XmlElement sign = xmlDoc.CreateElement("sign");
            sign.InnerText = _sign;
            alipay.AppendChild(sign);
            XmlElement sign_type = xmlDoc.CreateElement("sign_type");
            sign_type.InnerText = "RSA";
            alipay.AppendChild(sign_type);

            Response.Output.Write(xmlDoc.InnerXml);
            log("response content after checked gateway", xmlDoc.InnerXml);
            Response.End();

            return null;
        }

        /// <summary>
        /// 获取所有请求参数，转换为字典
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, string> getRequstParam()
        {
            Dictionary<string, string> dict = new Dictionary<string, string>();
            if (Request.QueryString != null)
            {
                foreach (string key in Request.QueryString.AllKeys)
                {
                    //log(key + " -:- " + Request.QueryString[key]);
                    // dict.Add(key, Request.QueryString[key]);
                }
            }

            if (Request.Form != null)
            {
                for (int i = 0; i < Request.Params.Count; i++)
                {
                    //  log(Request.Params.Keys[i].ToString() + " -:- " + Request.Params[i].ToString());
                    dict.Add(Request.Params.Keys[i].ToString(), Request.Params[i].ToString());
                }
            }



            return dict;
        }

        public void verifygw_success_response()
        {
            Response.ContentType = "text/xml";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GBK");
            Response.Clear();
            string resp = AlipaySignature.encryptAndSign("<success>true</success><biz_content>" + Config.getMerchantPublicKeyStr() + "</biz_content>", Config.alipay_public_key, Config.merchant_private_key, "GBK", false, true);
            Response.Output.WriteLine(resp);
            Response.End();
        }

        /// <summary>
        /// 记录日志到文件
        /// </summary>
        /// <param name="log"></param>
        public void log(string type, string text)
        {
            var fileName = "dotnet_log.txt";
            string logfile = HttpRuntime.AppDomainAppPath.ToString() + "log/" + fileName;
            //FileStream fs = new FileStream(logfile, FileMode.Create);
            //StreamWriter sw = new StreamWriter(fs);
            StreamWriter sw = File.AppendText(logfile);
            sw.WriteLine(">>>>>>>>start " + type + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            sw.WriteLine(text);
            sw.WriteLine("---------------------------------------------------------------");
            sw.Close();
        }

    }
}