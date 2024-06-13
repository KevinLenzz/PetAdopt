<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PetAdopt.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 605px;
        }
        .auto-style2 {
            width: 166px;
        }
        .auto-style6 {
            width: 200px;
        }
    </style>
</head>
<body style="background-color:ivory;background-size:cover">
    <form id="form1" runat="server">
        <div>
            <div style="height:100px;width:100px;background-image:url('~/Images/bg1.jpg');background-repeat: repeat;">

</div>
            <asp:Panel ID="Panel1" runat="server" Height="600px" Width="600px" style="border-radius: 20px;position:absolute;top:50vh;left:50vw;transform: translate(-50%, -50%);" BorderColor="#990000" BorderWidth="10px" Direction="NotSet" BackImageUrl="~/Images/bg1.jpg">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="UserNameLabel" runat="server" Font-Bold="True" Font-Names="幼圆" Font-Size="Large" ForeColor="#FFFFCC" Text="用户名："></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="UserNameTextBox" runat="server" BorderStyle="Double" Height="20px" Width="200px" ValidationGroup="1" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="请输入用户名" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="UserNameTextBox" Display="Dynamic" ErrorMessage="应小于20字" ValidationExpression=".{0,20}" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="GradeLabel" runat="server" Font-Bold="True" Font-Names="幼圆" Font-Size="Large" ForeColor="#FFFFCC" Text="年级："></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:DropDownList ID="GradeDropDownList" runat="server" Width="200px" ValidationGroup="1">
                                <asp:ListItem Value="1">大一</asp:ListItem>
                                <asp:ListItem Value="2">大二</asp:ListItem>
                                <asp:ListItem Value="3">大三</asp:ListItem>
                                <asp:ListItem Value="4">大四</asp:ListItem>
                                <asp:ListItem Value="5">研究生</asp:ListItem>
                                <asp:ListItem Value="6">博士生</asp:ListItem>
                                <asp:ListItem Value="7">非学生</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="GradeDropDownList" ErrorMessage="请选择年级" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="GenderLabel" runat="server" Font-Bold="True" Font-Names="幼圆" Font-Size="Large" ForeColor="#FFFFCC" Text="性别："></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:RadioButtonList ID="GenderRadioList" runat="server" ForeColor="#FFFFCC" RepeatDirection="Horizontal" TextAlign="Left" Width="200px" ValidationGroup="1">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="GenderRadioList" ErrorMessage="请选择性别" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="TelephoneLabel" runat="server" Font-Bold="True" Font-Names="幼圆" Font-Size="Large" ForeColor="#FFFFCC" Text="联系电话："></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TelephoneTextBox" runat="server" BorderStyle="Double" Height="20px" Width="200px" ValidationGroup="1" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TelephoneTextBox" ErrorMessage="请输入联系电话" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TelephoneTextBox" Display="Dynamic" ErrorMessage="请输入正确的个人电话" ValidationExpression="^1[3456789]\d{9}$" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="PwdLabel" runat="server" Font-Bold="True" Font-Names="幼圆" Font-Size="Large" ForeColor="#FFFFCC" Text="密码："></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="PwdTextBox" runat="server" BorderStyle="Double" Height="20px" Width="200px" TextMode="Password" ValidationGroup="1" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="PwdTextBox" ErrorMessage="请输入密码" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="PwdTextBox" Display="Dynamic" ErrorMessage="1-20个数字或字母" ValidationExpression="[A-Za-z0-9]{0,20}" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="ReconfirmLabel" runat="server" Font-Bold="True" Font-Names="幼圆" Font-Size="Large" ForeColor="#FFFFCC" Text="确认密码："></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="ReconfirmTextBox" runat="server" BorderStyle="Double" Height="20px" Width="200px" TextMode="Password" ValidationGroup="1" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ReconfirmTextBox" ErrorMessage="请再次输入密码" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PwdTextBox" ControlToValidate="ReconfirmTextBox" Display="Dynamic" ErrorMessage="密码不一致" ValidationGroup="1"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" align="center">
                            <asp:Button ID="BackButton" runat="server" Text="返回" BackColor="#FF9999" BorderColor="#FFCC99" BorderStyle="Outset" Font-Size="Large" OnClick="BackButton_Click"/>
                        </td>
                        <td class="auto-style6" align="center">
                            <asp:Button ID="Button1" runat="server" Text="注册" BackColor="#FF9999" BorderColor="#FFCC99" BorderStyle="Outset" Font-Size="Large" OnClick="Button1_Click" ValidationGroup="1"/>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </asp:Panel>
        </div>
    </form>
</body>
</html>
