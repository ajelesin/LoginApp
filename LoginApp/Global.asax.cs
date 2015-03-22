using System;
using System.Configuration;
using System.IO;
using System.Web;

namespace LoginApp
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        //Application_BeginRequest
        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            var sPagePath = HttpContext.Current.Request.Url.AbsolutePath;
            var oFileInfo = new FileInfo(sPagePath);
            var sPageName = oFileInfo.Name;

            var loginUrl = ConfigurationManager.AppSettings["loginPage"];
            var defaultUrl = ConfigurationManager.AppSettings["defaultPage"];
            var session = HttpContext.Current.Session;

            if ((session == null || session["__user"] == null)
                && sPageName != loginUrl)
            {
                HttpContext.Current.Response.Redirect(loginUrl, true);
            }

            if ((session != null && session["__user"] != null)
                && sPageName == loginUrl)
            {
                HttpContext.Current.Response.Redirect(defaultUrl, true);
            }
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}