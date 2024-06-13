<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAdopt.aspx.cs" Inherits="PetAdopt.UserPage.UserAdopt1" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="请确认：您要领养的动物是："></asp:Label>
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认领养" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="取消" />
        </div>
    </form>
</body>
</html>
