using System.Web;
using System.Web.Optimization;

namespace CityService.Alipay.Mvc.ProvidentFund
{
    public class BundleConfig
    {
        // 有关 Bundling 的详细信息，请访问 http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));

            // 使用要用于开发和学习的 Modernizr 的开发版本。然后，当你做好
            // 生产准备时，请使用 http://modernizr.com 上的生成工具来仅选择所需的测试。
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));



            #region 钱晓峰添加
            /* 阿里通用JS组 */
            bundles.Add(new ScriptBundle("~/bundles/alljs").Include(
                        "~/Scripts/jquery-1.10.2.js",
                        "~/Scripts/extensions/base.js",
                        "~/Content/alipay/amui-demo_files/amui.js",
                        "~/Scripts/jquery.mobile-1.4.5.js",
                        "~/Scripts/user/alipay.openid.js",
                        "~/Scripts/user/jquery-verification-1.0.1.js",
                        "~/Scripts/user/jquery-guid.js"));

            /* 公积金试算JS */
            bundles.Add(new ScriptBundle("~/bundles/gjjjs").Include(
                        "~/Scripts/user/jquery-loanscalculate-1.0.1.js"));

            /* bootstrap JS andy.qian add */
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                        "~/Scripts/bootstrap/bootstrap.js"));

            /**-----------------------------------------------------------**/

            /*  阿里通用样式组 andy.qian add */
            bundles.Add(new StyleBundle("~/Content/allcss").Include(
                "~/Content/alipay/alipay.css",
                "~/Content/alipay/amui-demo_files/toast.css",
                "~/Content/alipay/button.css",
                "~/Content/alipay/amui-demo_files/dialog.css",
                "~/Content/alipay/amui-demo_files/button-group.css",
                "~/Content/jquery.mobile-1.4.5.css"
                ));

            /*  bootstrap 样式组 andy.qian add */
            bundles.Add(new StyleBundle("~/Content/bootstrap").Include(
                "~/Content/bootstrap/bootstrap.css"));

            /*  公积金试算样式 样式组 andy.qian add */
            bundles.Add(new StyleBundle("~/Content/ggjss").Include(
                "~/Content/user/jquery-loanscalculate-1.0.1.css"));

            #endregion
        }
    }
}