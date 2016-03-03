using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using Aop.Api.Response;

namespace Aop.Api.Request
{
    public class AlipayMobilePublicMultiMediaDownloadRequest : IAopRequest<AlipayMobilePublicMultiMediaDownloadResponse>
    {

        public string BizContent { get; set; }
        public Stream stream { set; get; }

        #region IAopRequest Members
        private string terminalType;
        private string terminalInfo;
        private string prodCode;

        public void SetTerminalType(string terminalType)
        {
            this.terminalType = terminalType;
        }

        public string GetTerminalType()
        {
            return this.terminalType;
        }

        public void SetTerminalInfo(string terminalInfo)
        {
            this.terminalInfo = terminalInfo;
        }

        public string GetTerminalInfo()
        {
            return this.terminalInfo;
        }

        public void SetProdCode(string prodCode)
        {
            this.prodCode = prodCode;
        }

        public string GetProdCode()
        {
            return this.prodCode;
        }

        public string GetApiName()
        {
            return "alipay.mobile.public.multimedia.download";
        }

        public IDictionary<string, string> GetParameters()
        {
            AopDictionary parameters = new AopDictionary();
            parameters.Add("biz_content", this.BizContent);
            return parameters;
        }

        #endregion
    }
}
