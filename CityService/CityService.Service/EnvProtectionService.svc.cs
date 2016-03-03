using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class EnvProtectionService
{
    [WebGet]
    [OperationContract]
    public string GetLatestHourAQI(string portId)
    {
        if (string.IsNullOrEmpty(portId))
            return null;
        var url = "http://222.92.77.250/HuiMaiWS/PublishWS.asmx/GetLatestHourAQI?portId=" + portId;
        var result = HttpHelper.GetHtmlEx(url, Encoding.UTF8);
        return result;

    }
}
