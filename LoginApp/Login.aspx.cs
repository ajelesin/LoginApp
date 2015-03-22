using System;
using System.Configuration;
using System.Data.SqlClient;
using LoginApp.Code;

namespace LoginApp
{
    public partial class Login : System.Web.UI.Page
    {
        private SqlConnection _connection;

        public string TextLogin
        {
            get { return txtLogin.Text; }
            set { txtLogin.Text = value; }
        }
        public string TextPassword
        {
            get { return txtPassword.Text; }
            set { txtPassword.Text = value; }
        }
        public string TextError
        {
            set
            {
                lblError.Text = value;
                lblError.Visible = !string.IsNullOrEmpty(value);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            TextError = string.Empty;

            var connString = ConfigurationManager.ConnectionStrings["mainConnection"]
                .ConnectionString;
            _connection = new SqlConnection(connString);
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextLogin)
                || string.IsNullOrEmpty(TextPassword))
            {
                TextError = "Не заданы логин или пароль!";
                return;
            }

            var userGate = new UserGateway(_connection);
            var user = userGate.Auth(TextLogin, TextPassword);
            if (user == null)
            {
                TextError = "Пользователь не зарегистрирован!";
            }
            else
            {
                Session["__user"] = user;
                RedirectToDefaultPage();
            }
        }

        private void RedirectToDefaultPage()
        {
            var defaultUrl = ConfigurationManager.AppSettings["defaultPage"];
            Response.Redirect(defaultUrl, true);
        }

        protected void Page_UnLoad(object sender, EventArgs e)
        {
            _connection.Close();
        }
    }
}