
using System.Collections.Generic;
using System.Linq;

namespace LoginApp.Code
{
    public class User
    {
        private readonly int _id, _groupId;
        private readonly string _login, _fio;
        private readonly List<string> _permissions;

        public User(int id, int groupId, string login, string fio, List<string> permissions)
        {
            _id = id;
            _fio = fio;
            _groupId = groupId;
            _login = login;
            _permissions = permissions;
        }

        public bool CanView(string permission)
        {
            return _permissions.Contains(permission);
        }

        public int Id { get { return _id; } }
        public string Login { get { return _login; } }
    }
}