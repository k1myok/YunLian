using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using CityService.Service.Controllers;

namespace CityService.UnitTestProject
{
    [TestClass]
    public class UnitTestGetProvidentFundWebService
    {
        [TestMethod]
        public void TestGetProvidentFund()
        {
            var client = new DataTransformServiceReference.DataTransformServiceClient();
            var result = client.GetProvidentFund("320525197708285912", "0713999155", "GJ07L");
        }
        [TestMethod]
        public void TestFindLoan()
        {
            var client = new ProvidentFundController();
            var result = client.FindLoan("320922198504131417", "0", string.Empty, string.Empty);
            Assert.IsNotNull(result);
        }
    }
}
