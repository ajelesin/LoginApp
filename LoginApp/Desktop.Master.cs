using System;
using System.Configuration;

namespace LoginApp
{
    public partial class Desktop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_OnClick(object sender, EventArgs e)
        {
            Session["__user"] = null;

            var loginUrl = ConfigurationManager.AppSettings["loginPage"];
            Response.Redirect(loginUrl);
        }
    }
}