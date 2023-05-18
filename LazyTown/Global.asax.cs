using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace LazyTown
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Session_Start(object sender, EventArgs e)
        {
            Session["id"] = "-1";
            Session["userFirstName"] = "guest";
            Session["userToDel"] = "";
            Session["admin"] = "false";
        }

        void Session_End(object sender, EventArgs e)
        {
            Session["id"] = "-1";
            Session["userFirstName"] = "guest";
            Session["userToDel"] = "";
            Session["admin"] = "false";
        }
    }
}