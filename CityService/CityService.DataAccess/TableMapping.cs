using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CityService.DataAccess
{
    /// <summary>
    /// CreatedBy:Andy.Chien
    /// CreatedDate:2015/11/04
    /// Remork:映射表反序列化用的实体类
    /// </summary>
    public class TableMapping
    {   //大类
        public String TestType { get; set; }
        //分类
        public String Classification { get; set; }
        //年月
        public String Date { get; set; }
        //数据表名
        public String TableName { get; set; }
        public String RQ1BM { get; set; }
        //RQ2别名
        public String RQ2BM { get; set; }
        //RQ3别名
        public String RQ3BM { get; set; }
        //RQ4别名
        public String RQ4BM { get; set; }

    }
}
