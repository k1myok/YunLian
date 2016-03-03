using CityService.Service.Controllers.Models.ProvidentFundModel;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

namespace CityService.Service.Controllers.Common
{
    class XmlHelper
    {       
        public static Hashtable SelectSingleRecord(string xml, string colsPath, string colsValuePath)
        {
            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.LoadXml(xml);
            if (xmlDoc.SelectSingleNode(colsPath) == null) return null;
            var nodeList1 = xmlDoc.SelectSingleNode(colsPath).ChildNodes;
            if (xmlDoc.SelectSingleNode(colsValuePath)== null) return null;
            var nodeList2 = xmlDoc.SelectSingleNode(colsValuePath).ChildNodes;
            Hashtable hash = new Hashtable();
            if (nodeList1.Count != nodeList2.Count)
            {
                return null;
            }
            else
            {
                for (int i = 0; i < nodeList1.Count; i++)
                {
                    var key = nodeList1[i].Name;
                    var value = !string.IsNullOrEmpty(nodeList2[i].InnerText) ? nodeList2[i].InnerText : "";
                    hash.Add(key, value);
                }
                return hash;
            }
        }
        public static List<Hashtable> SelectRecords(string xml, string colsPath, string rowsPaths, string pageInfoPath)
        {
            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.LoadXml(xml);
            if (xmlDoc.SelectSingleNode(colsPath) == null) return null;
            XmlNodeList xmlNodeList = xmlDoc.SelectNodes(rowsPaths);
            if (0 == xmlNodeList.Count) return null;
            if (xmlDoc.SelectSingleNode(colsPath) == null) return null;
            var nodeList1 = xmlDoc.SelectSingleNode(colsPath).ChildNodes;
            if (xmlDoc.SelectSingleNode(pageInfoPath) == null) return null;
            var nodeList2 = xmlDoc.SelectSingleNode(pageInfoPath).ChildNodes;
            List<Hashtable> hashList = new List<Hashtable>();
            for (int i = 0; i < xmlNodeList.Count; i++)
            {
                Hashtable hash = new Hashtable();
                var nodes2 = xmlNodeList[i].ChildNodes;
                if (nodes2.Count != nodeList1.Count)
                    continue;
                for (int j = 0; j < nodes2.Count; j++)
                {
                    var key = nodeList1[j].Name;
                    var value = !string.IsNullOrEmpty(nodes2[j].InnerText) ? nodes2[j].InnerText : "";
                    hash.Add(key, value);
                }
                for (int k = 0; k < nodeList2.Count; k++)
                {
                    var key = nodeList2[k].Name;
                    var value = !string.IsNullOrEmpty(nodeList2[k].InnerText) ? nodeList2[k].InnerText : "";
                    hash.Add(key, value);
                }
                hashList.Add(hash);
            }
            return hashList;
        }
    }
}
