using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MultiPageResult 的摘要说明
/// </summary>
public class MultiPageResult<T>
{
	public int TotalCount { get; set; }

    public  T[] Result { get; set; }

    public bool IsCompleted { get; set; }
}