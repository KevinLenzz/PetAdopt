<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PetAdopt.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-color:ivory;background-size:cover">
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" Height="400px" Width="600px" style="border-radius: 20px;position:absolute;top:50vh;left:50vw;transform: translate(-50%, -50%);" BorderColor="#990000" BorderWidth="10px" Direction="NotSet" BackImageUrl="~/Images/bg1.jpg">
                <asp:Label ID="UserCodeLabel" runat="server" Text="账号：" style="position:relative;left:10%;top:15%" Font-Bold="True" Font-Names="幼圆" Font-Size="Large" ForeColor="#FFFFCC"></asp:Label>
                <asp:TextBox ID="UserCodeTextBox" runat="server" Width="250px" style="position:relative;left:15%;top:15%" Height="20px" BorderStyle="Double" ValidationGroup="1" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserCodeTextBox" ErrorMessage="请输入账号" style="position:relative;left:20%;top:15%" ValidationGroup="1"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="PassWordLabel" runat="server" Text="密码：" style="position:relative;left:10%;top:40%" Font-Bold="True" Font-Names="幼圆" ForeColor="#FFFFCC" Font-Size="Large"></asp:Label>
                <asp:TextBox ID="PassWordTextBox" runat="server" Width="250px" style="position:relative;left:15%;top:40%" Height="20px" BorderStyle="Double" ValidationGroup="1" TextMode="Password" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWordTextBox" ErrorMessage="请输入密码" style="position:relative;left:20%;top:40%" ValidationGroup="1"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="LoginButton" runat="server" Text="登录" style="position:relative;left:20%;top:60%" BackColor="#FF9999" BorderColor="#FFCC99" BorderStyle="Outset" Font-Size="Large" OnClick="LoginButton_Click" ValidationGroup="1"/>
                <asp:Button ID="Button1" runat="server" Text="员工登录" style="position:relative;left:40%;top:60%" BackColor="#FF9999" BorderColor="#FFCC99" BorderStyle="Outset" Font-Size="Large" OnClick="EmpLogin_Click" ValidationGroup="1"/>
                <asp:LinkButton ID="ToRigisterButton" runat="server" style="position:relative;left:60%;top:60%" Font-Size="Large" ForeColor="White" OnClick="ToRigisterButton_Click">注册</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Overline="True" Font-Strikeout="False" Font-Underline="True" ForeColor="White" style="position:absolute;top:80%;left:44%;z-index:1" Font-Italic="True" Font-Size="Larger"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
