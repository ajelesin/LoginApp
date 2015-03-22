using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Xml.Linq;

namespace LoginApp.Code
{
    public class Menu
    {
        private readonly SqlConnection _connection;
        private readonly string _menuPath;

        public Menu(SqlConnection connection, string menuPath)
        {
            _connection = connection;
            _menuPath = menuPath;
        }

        // выдает меню
        public List<MenuItem> GetMenu(int userId)
        {
            // считать все разрешенные действия из БД
            // считать все пункты меню
            // фильтровать только те, у которых access-rule содержится в списке разрешуннных действий из бд
            // вернуть их
            var command = string.Format(@"select Name from Permissions
                where PermissionId in (
		                select PermissionId from GroupsPermissions
		                  where GroupId = (
				                select GroupId from Users
				                where UserId = '{0}'))", userId);
            if (_connection.State == ConnectionState.Closed)
                _connection.Open();

            var cmd = new SqlCommand(command, _connection);
            var reader = cmd.ExecuteReader();
            var permissions = new List<string>();
            while (reader.Read())
            {
                permissions.Add(reader["Name"].ToString());
            }

            var xDoc = XDocument.Load(_menuPath);
            var qResult = from item in xDoc.Descendants("item")
                where permissions.Contains(item.Element("access-rule").Value)
                select new MenuItem {Page = item.Element("title").Value, Url = item.Element("url").Value};
            return qResult.ToList();
        }
    }

    public class MenuItem
    {
        public string Page { get; set; }
        public string Url { get; set; }
    }
}