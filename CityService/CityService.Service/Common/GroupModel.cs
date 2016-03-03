using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// GroupModel 的摘要说明
/// </summary>
public class GroupModel
{
	public GroupModel()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    [System.Web.Services.WebMethod]
    public static string ShowValue(string entityList)
    {
        //todo
        return entityList;
    }
}