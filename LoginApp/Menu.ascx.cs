using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using LoginApp.Code;

namespace LoginApp
{
    public partial class Menu : System.Web.UI.UserControl
    {
        private SqlConnection _connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            var connString = ConfigurationManager.ConnectionStrings["mainConnection"]
                .ConnectionString;
            _connection = new SqlConnection(connString);

            var user = Session["__user"] as User;
            if (user == null) return;


            var menuPath = Path.Combine(Server.MapPath("~/App_Data"), "Menu.xml");
            var menu = new Code.Menu(_connection, menuPath);
            var items = menu.GetMenu(user.Id);

            var urlMenus = new UrlMenus(items);
            MainMenu.Text = urlMenus.ToHtml();
        }

        protected void Page_UnLoad(object sender, EventArgs e)
        {
            _connection.Close();
        }
    }
}