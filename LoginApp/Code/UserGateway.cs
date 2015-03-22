using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace LoginApp.Code
{
    public class UserGateway
    {
        private readonly SqlConnection _connection;

        public UserGateway(SqlConnection connection)
        {
            _connection = connection;
        }

        public User Auth(string login, string password)
        {
            string fio;
            List<string> permissions;
            int id, groupId;

            var existUser = FillUser(login, password, out fio, out id, out groupId);
            if (!existUser) return null;

            FillPermissions(groupId, out permissions);

            return new User(id, groupId, login, fio, permissions);
        }

        private bool FillUser(string login, string password,
            out string fio, out int id, out int groupId)
        {
            var statement = string.Format(
                "select UserId, Login, Fio, GroupId" +
                " from Users" +
                " where login = '{0}' and Password = '{1}'",
                login, Md5(password));
            if (_connection.State == ConnectionState.Closed)
                _connection.Open();

            var cmd = new SqlCommand(statement, _connection);
            var reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                fio = reader["Fio"].ToString();
                id = Convert.ToInt32(reader["GroupId"]);
                groupId = Convert.ToInt32(reader["GroupId"]);
                reader.Close();
                return true;
            }

            reader.Close();
            id = 0;
            groupId = 0;
            fio = null;
            return false;
        }

        private void FillPermissions(int groupId, out List<string> permissions)
        {
            var statement = string.Format(
                "select p.Name" +
                " from GroupsPermissions gp" +
                " inner join Permissions p on gp.PermissionId = p.PermissionId" +
                " where GroupId = {0}",
                groupId);

            permissions = new List<string>();

            if (_connection.State == ConnectionState.Closed)
                _connection.Open();

            var cmd = new SqlCommand(statement, _connection);
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                permissions.Add(reader["Name"].ToString());
            }
            reader.Close();
        }

        private static string Md5(string input)
        {
            var encodedPassword = new UTF8Encoding().GetBytes(input);
            var hash = ((HashAlgorithm)CryptoConfig.CreateFromName("MD5"))
                .ComputeHash(encodedPassword);
            var encoded = BitConverter.ToString(hash)
               .Replace("-", string.Empty)
               .ToLower();
            return encoded;
        }
    }
}