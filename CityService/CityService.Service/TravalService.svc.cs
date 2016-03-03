using CityService.DataAccess;
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
public class TravalService
{
	// 要使用 HTTP GET，请添加 [WebGet] 特性。(默认 ResponseFormat 为 WebMessageFormat.Json)
	// 要创建返回 XML 的操作，
	//     请添加 [WebGet(ResponseFormat=WebMessageFormat.Xml)]，
	//     并在操作正文中包括以下行:
	//         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
	[OperationContract]
    [WebGet(ResponseFormat = WebMessageFormat.Json)]
    public TravalSpotView[] GetTravalSpots()
	{
        var context = new CityServiceModelContainer();
        var result = context.TravalSpotView.ToArray();
        return result;
	}

	[OperationContract]
    [WebGet(ResponseFormat = WebMessageFormat.Json)]
    public TravalSpotView[] GetSpotsOfPlace(string placeName)
	{
        var context = new CityServiceModelContainer();
        var result = context.TravalSpotView.Where(p => p.PlaceName == placeName).ToArray();
        return result;
	}

    [OperationContract]
    [WebGet(ResponseFormat = WebMessageFormat.Json)]
    public TravalSpotDetailView GetTravalSpotDetail(int id)
    {
        var context = new CityServiceModelContainer();
        return context.TravalSpotDetailView.FirstOrDefault(p => p.ID == id);
    }

    [OperationContract]
    [WebGet(ResponseFormat = WebMessageFormat.Json)]
    public TravalPlaceView[] GetTravalPlaces()
    {
        var result = new List<TravalPlaceView>();
        var context = new CityServiceModelContainer();
        foreach (var item in context.TravalPlaceView.ToList())
        {
            if(result.Exists(p => p.Name == item.Name))
                continue;
            result.Add(item);
        }
        return result.ToArray();
    }

    [OperationContract]
    [WebGet(ResponseFormat = WebMessageFormat.Json)]
    public TravalPlaceDetail GetTravalPlaceDetail(int id)
    {
        var context = new CityServiceModelContainer();

        var result = context.TravalPlaceDetail.FirstOrDefault(p => p.ID == id);
        return result;
    }
}

public class TravalPlaceViewEqualityComparer : IEqualityComparer<TravalPlaceView>
{

    public bool Equals(TravalPlaceView x, TravalPlaceView y)
    {
        return x.Name == y.Name;
    }

    public int GetHashCode(TravalPlaceView obj)
    {
        return obj.GetHashCode();
    }
}
