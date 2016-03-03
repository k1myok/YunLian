using CityService.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class PriceQueryService
{
    public static Dictionary<string, List<string>> AgricultureParticiples;

    [WebGet(ResponseFormat = WebMessageFormat.Json)]
    [OperationContract]
    public MultiPageResult<AgricultureDetailView> QueryAgriculturePrice(string pName, string mName, string pDate, int pageNum)
    {
        if (string.IsNullOrEmpty(pDate))
            return null;

        if (AgricultureParticiples == null || AgricultureParticiples.Count == 0)
        {
            AgricultureParticiples = new Dictionary<string, List<string>>();
            var context = new CityServiceModelContainer();
            var words = context.AgricultureParticiple.ToList();
            words.ForEach(p => {
                if (!AgricultureParticiples.ContainsKey(p.ProductName) && !string.IsNullOrEmpty(p.Participle))
                    AgricultureParticiples.Add(p.ProductName, p.Participle.Split('，').ToList());
            });
        }

        var searchText = AgricultureParticiples.Count > 0 ? string.Join(",", AgricultureParticiples.Where(p => p.Value.Any(pp => pName.Contains(pp))).Select(p => p.Key).ToArray()) : pName;
        var result = QueryAgriculturePrice(pName, searchText, mName, DateTime.Parse(pDate), pageNum);
        
        return result;
    }

    [WebGet]
    [OperationContract]
    public string[] GetAgricultureMarkets(double lon, double lat)
    {
        var context = new CityServiceModelContainer();
        if (lon <= 0 || lat <= 0)
            return context.AgricultureMarket.Select(p => p.Name).ToArray();

        return context.AgricultureMarket.ToList().OrderBy(p => Math.Pow(lon - p.X.Value, 2) + Math.Pow(lat - p.Y.Value, 2)).Select(p => p.Name).ToArray();
    }

    private MultiPageResult<AgricultureDetailView> QueryAgriculturePrice(string pName, string relatedPNames, string mName, DateTime pDate, int pageNum)
    {
        var context = new CityServiceModelContainer();
        var date = pDate.ToString("yyyy-MM-dd");
        var query = context.AgricultureDetailView.Where(p => p.MarketName.Contains(mName) && p.CreateDay == date && (p.ProductName.Contains(pName) || pName.Contains(p.ProductName) || relatedPNames.Contains(p.ProductName))).OrderBy(p => p.ID);
        var entityList = query.Skip((pageNum - 1) * 20).Take(20).ToList();
        var districtList = entityList.GroupBy(p => p.MarketName + p.ProductName);
        var result = new List<AgricultureDetailView>();
        foreach (IGrouping<string,AgricultureDetailView> item in districtList)
        {
            var list = item.ToList();
            list[0].Price = double.Parse(list.Average(p => p.Price).Value.ToString("#0.00"));
            result.Add(list[0]);
        }
        var test = result.OrderByDescending(p => p.ProductName.Intersect(pName).Count()).ToArray();
        var ids = query.Select(p => p.ID).ToList();
        var isCompleted = false;
        isCompleted = test.Length == 0 || entityList.Last().ID == ids.Last();
        return new MultiPageResult<AgricultureDetailView>() { TotalCount = ids.Count(), Result = test, IsCompleted = isCompleted };
    }
}
