using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CityService.Service.Controllers.Common
{
    class StringHelper
    {
        public static string ConvertToCustomDecimalDigits(string num,int decimalDigits) {
            if (num.Contains("."))
            {
                string strRightDot = num.Substring(num.IndexOf(".")+1,num.Length-num.IndexOf(".")-1);
                if (strRightDot.Length > decimalDigits) {
                    var thirdDigit = int.Parse(strRightDot.Substring(decimalDigits, 1));
                    var firstDigit = int.Parse(strRightDot.Substring(0,1));
                    var secondDigit = int.Parse(strRightDot.Substring(1,1));
                    if (thirdDigit > 5)
                    {
                        secondDigit++;
                        return num.Substring(0, num.IndexOf(".") + decimalDigits) + secondDigit.ToString();
                    }
                    else {
                        return num.Substring(0, num.IndexOf(".") + decimalDigits) + secondDigit.ToString();
                    }
                }
                else if (strRightDot.Length == decimalDigits)
                {
                    return num;
                }
                else {
                    return num + "0";
                }
            }
            else {
                return num + ".00";
            }
        }
    }
}
