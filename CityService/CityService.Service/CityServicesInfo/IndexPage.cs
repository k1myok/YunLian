using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityService.Service.CityServicesInfo
{
    public class IndexPage
    {
        public string title { get; set; }
        public string foot  { get; set; }
        public string type  { get; set; }
        public List<Menu> menuList { get; set; }
    }
}