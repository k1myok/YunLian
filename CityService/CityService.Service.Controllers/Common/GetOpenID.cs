
using Senparc.Weixin.MP.AdvancedAPIs.OAuth;
using Senparc.Weixin.MP.CommonAPIs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aop.Api;
using Aop.Api.Request;
using Aop.Api.Response;

    public class GetOpenID
    {
        /// <summary>
        /// 获取验证地址
        /// </summary>
        /// <param name="appId"></param>
        /// <param name="redirectUrl"></param>
        /// <param name="state"></param>
        /// <param name="scope"></param>
        /// <param name="responseType"></param>
        /// <returns></returns>
        public static string GetAuthorizeUrl(string appId, string uri)
        {
            var url =
                string.Format("https://open.weixin.qq.com/connect/oauth2/authorize?appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_base",
                                appId,uri);

            return url;
        }

        /// <summary>
        /// 获取AccessToken
        /// </summary>
        /// <param name="appId"></param>
        /// <param name="secret"></param>
        /// <param name="code">code作为换取access_token的票据，每次用户授权带上的code将不一样，code只能使用一次，5分钟未被使用自动过期。</param>
        /// <param name="grantType"></param>
        /// <returns></returns>
        public static OAuthAccessTokenResult GetAccessToken(string appId, string secret, string code, string grantType = "authorization_code")
        {
            try
            {
                ServiceContext.Default.WriteLog("start GetAccessToken", "Public");

                var url =
                    string.Format("https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type={3}",
                                    appId, secret, code, grantType);
                ServiceContext.Default.WriteLog("start GetAccessToken url:" + url, "Public");
                var result = CommonJsonSend.Send<OAuthAccessTokenResult>(null, url, null, Senparc.Weixin.CommonJsonSendType.GET, 30000);
                ServiceContext.Default.WriteLog("end GetAccessToken", "Public");
                return result;
            }
            catch (Exception ex)
            {
                ServiceContext.Default.WriteLog("getting GetAccessToken exception:" + ex.Message, "Public");
                return null;
            }
        }

        public static OAuthAccessTokenResult GetAccessToken1(string appId, string secret, string code, string grantType = "authorization_code")
        {
            try
            {
                ServiceContext.Default.WriteLog("start GetAccessToken", "Public");

                var url =
                    string.Format("https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type={3}",
                                    appId, secret, code, grantType);
                var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
                var json = Jayrock.Json.Conversion.JsonConvert.Import(typeof(OAuthAccessTokenResult), result) as OAuthAccessTokenResult;
                return json;
            }
            catch (Exception ex)
            {
                ServiceContext.Default.WriteLog("getting GetAccessToken exception:" + ex.Message, "Public");
                return null;
            }
        }

        /// <summary>
        /// 获取支付宝用户的OPenID
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public static string GetAlipayOpenID(string code)
        {
            var appid = "2015060100099966";
            var url = "https://openapi.alipay.com/gateway.do";
            //TODO:测试用E:\AlipayProvideFund
            var privateKeyPem = @"C:\Projects\PreProjects\Release\AlipayProvidentFund\rsa_private_key.pem";
            //var privateKeyPem = @"E:\AlipayProvideFund\rsa_private_key.pem";
            IAopClient client = new DefaultAopClient(url, appid, privateKeyPem);
            AlipaySystemOauthTokenRequest req = new AlipaySystemOauthTokenRequest();
            req.Code = code;
            req.GrantType = "authorization_code";
            AlipaySystemOauthTokenResponse res = client.Execute(req);
            return res.AlipayUserId;
        }
        public static string UrlEncode(string str)
        {
            StringBuilder sb = new StringBuilder();
            byte[] byStr = System.Text.Encoding.UTF8.GetBytes(str); //默认是System.Text.Encoding.Default.GetBytes(str)
            for (int i = 0; i < byStr.Length; i++)
            {
                sb.Append(@"%" + Convert.ToString(byStr[i], 16));
            }

            return (sb.ToString());
        }

 
        /// <summary>
        /// 
        /// </summary>
        /// <param name="appId"></param>
        /// <param name="uri"></param>
        /// <returns></returns>
        public static string GetAlipayAuthorizeUrl(string uri)
        {
            var appId = "2015060100099966";
            var ur = UrlEncode(uri);
            var url = string.Format("https://openauth.alipay.com/oauth2/publicAppAuthorize.htm?app_id={0}&auth_skip=false&scope=auth_base&redirect_uri={1}",appId, ur);
            return url;
        }
    }
