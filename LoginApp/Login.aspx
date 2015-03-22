<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginApp.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>Login</td>
                <td><asp:TextBox runat="server" ID="txtLogin"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><asp:TextBox runat="server" ID="txtPassword" ClientIDMode="Static" TextMode="Password"/></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_OnClick"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="False" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
