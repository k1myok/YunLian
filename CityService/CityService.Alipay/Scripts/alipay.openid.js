function auth_code(url)
{
	var code = decodeURI(getQueryStringByName("auth_code"));
	if (code != "")
	{
	   GetOpenID(code);
	}
	else
	{

		location.href = "https://openauth.alipay.com/oauth2/publicAppAuthorize.htm?app_id=2015060100099966&auth_skip=false&scope=auth_base&redirect_uri=http%3A%2F%2Flocalhost/%2FCityService%2FCityService.Alipay%2FPolice%2F" + url;
	}
}

function GetOpenID(code) {
	var code = decodeURI(getQueryStringByName("auth_code"));
	var url = "../../CityService.Service/HospitalInfoService.svc/GetOpenID";
	$.ajax(url, {
		type: "GET",
		data: {
			code: code,
		},
		dataType: "Json",
		success: function (result) {
			var openID = result.d;
			document.cookie = "openID=" + openID;
		},
		error: function () {
			return;
		},
	});
}
function auth_codeHospitail(url) {
    var code = decodeURI(getQueryStringByName("auth_code"));
    if (code != "")
    {
        GetOpenID(code);
    }
    else
    {
        location.href = "https://openauth.alipay.com/oauth2/publicAppAuthorize.htm?app_id=2015060100099966&auth_skip=false&scope=auth_base&redirect_uri=http%3A%2F%2Flocalhost/%2FCityService%2FCityService.Alipay%2FHealth%2F" + url;
    }
}