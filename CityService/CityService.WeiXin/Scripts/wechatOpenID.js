//办事咨询中的获取用户的openID
function auth_code()
{
    code = decodeURI(getQueryStringByName("code"));
    if (code != "") {
        GetWechatOpenID(code);
    }
    else
    {
          location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe8dc58e12b05f6a7&redirect_uri=http%3a%2f%2fcs.weixin.china-ccw.com%2fCityService%2fweixin%2fPolice%2fhomepage.html&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
    }
}
//医院挂号中获取用户的OPENID
function auth_codehospital()
{
    code = decodeURI(getQueryStringByName("code"));
    if (code != "") {
        GetWechatOpenID(code);
    }
    else {
		var url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx33cfa168b97bde1b&redirect_uri=http://app.china-ccw.com:8011/CityService/Cityservice.weixin/Health/getHospitallist.html&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
		
        location.href =decodeURI(url);
    }
}
function GetWechatOpenID(code)
{
     
    var url = "../../CityService.Service/HospitalInfoService.svc/GetwechatOPenID";
    $.ajax(url, {
        type: "Get",
        data: {
            code: code,
           },
        dataType: "Json",
        success: function (result) {
            var temp = JSON.parse(result.d);
            document.cookie = "OpenID=" + temp.openid;
			    // getHospital();
        },
        error: function (msg) {
           return;
        },
    });
}