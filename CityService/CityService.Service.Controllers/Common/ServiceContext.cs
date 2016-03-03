using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.ServiceModel;
using System.Threading.Tasks;
using System.Web;
public class ServiceContext
{
    private static ServiceContext instance;
    public static ServiceContext Default
    {
        get
        {
            if (instance == null)
                instance = new ServiceContext();
            return instance;
        }
    }
    public void WriteLog(string log, string kind, string fileName = "")
    {
        try
        {
            var path = ConfigurationManager.AppSettings["LogsPath"] + "\\" + kind;
            if (!System.IO.Directory.Exists(path))
                System.IO.Directory.CreateDirectory(path);
            
            var file = System.IO.Path.Combine(path, string.IsNullOrEmpty(fileName) ? (DateTime.Now.ToString("yyyy-MM-dd HH-mm") + ".txt") : fileName);
            System.IO.File.AppendAllText(file, log + Environment.NewLine);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }

}
