using System.Collections.Generic;
using System.Text;

namespace LoginApp.Code
{
    /// <summary>
    /// Отображает меню в разметку HTML
    /// </summary>
    public class UrlMenus
    {
        private readonly List<MenuItem> _menuList;

        public UrlMenus(List<MenuItem> menuList)
        {
            _menuList = menuList;
        }

        public string ToHtml()
        {
            var sb = new StringBuilder();
            foreach (var menuItem in _menuList)
            {
                sb.Append(string.Format("<a href='{0}'>{1}</a><br/>", menuItem.Url, menuItem.Page));
            }
            return sb.ToString();
        }
    }
}