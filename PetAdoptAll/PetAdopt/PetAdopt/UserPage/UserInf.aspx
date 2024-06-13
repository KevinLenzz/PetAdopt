<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage/User.master" AutoEventWireup="true" CodeBehind="UserInf.aspx.cs" Inherits="PetAdopt.UserInf" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <style type="text/css">
        .a{
             border:1px solid #800000;
        }
        .auto-style9 {
            border: 1px solid #800000;
            width: 81%;
            height: 400px;
        }
    </style>
    <table class="auto-style9" border="1">
        <tr>
            <td colspan="3" class="a">
                <asp:Label ID="Label6" runat="server" Text="个人信息维护"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 173px" class="a">
                <asp:Label ID="Label1" runat="server" Text="账号："></asp:Label>
            </td>
            <td style="width: 347px" class="a">
                <asp:Label ID="Label8" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 173px" class="a">
                <asp:Label ID="Label2" runat="server" Text="用户名："></asp:Label>
            </td>
            <td style="width: 347px" class="a">
                <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="400px"></asp:TextBox>
            </td>
            <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="请输入用户名" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="应小于20字" ValidationExpression=".{0,20}" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
        </tr>
        <tr>
            <td style="width: 173px" class="a">
                <asp:Label ID="Label3" runat="server" Text="年级："></asp:Label>
            </td>
            <td style="width: 347px" class="a">
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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 173px" class="a">
                <asp:Label ID="Label4" runat="server" Text="性别："></asp:Label>
            </td>
            <td style="width: 347px" class="a">
                            <asp:RadioButtonList ID="GenderRadioList" runat="server" ForeColor="Black" RepeatDirection="Horizontal" TextAlign="Left" Width="200px" ValidationGroup="1">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 173px" class="a">
                <asp:Label ID="Label5" runat="server" Text="联系电话："></asp:Label>
            </td>
            <td style="width: 347px" class="a">
                <asp:TextBox ID="TextBox5" runat="server" Height="30px" Width="400px"></asp:TextBox>
            </td>
            <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="请输入联系电话" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="请输入正确的个人电话" ValidationExpression="^1[3456789]\d{9}$" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
        </tr>
        <tr>
            <td style="width: 173px" class="a">
                <asp:Label ID="Label7" runat="server" Text="注册日期："></asp:Label>
            </td>
            <td style="width: 347px" class="a">
                <asp:Label ID="Label9" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 173px" class="a">
                <asp:Button ID="Button3" runat="server" Text="注销" OnClick="Button3_Click" />
                <br />
                <asp:Label ID="Label10" runat="server" Text="确定要注销吗？" Visible="False"></asp:Label>
                <br />
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="确定" Visible="False" />
                <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="取消" Visible="False" />
            </td>
            <td style="width: 347px" class="a">
                <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" />
                <asp:Button ID="Button4" runat="server" Text="确认" OnClick="Button4_Click" ValidationGroup="1" Visible="False" />
                <asp:Button ID="Button5" runat="server" Text="取消" OnClick="Button5_Click" Visible="False" />
            </td>
            <td class="a">
                <asp:Button ID="Button2" runat="server" Text="修改密码" OnClick="Button2_Click" />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="请输入旧密码："></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="TextBox8" runat="server" TextMode="Password" ValidationGroup="2" Width="400px"></asp:TextBox>

                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="请输入旧密码" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="1-20个数字或字母" ValidationExpression="[A-Za-z0-9]{0,20}" ValidationGroup="2"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="请再次输入旧密码："></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="TextBox9" runat="server" TextMode="Password" ValidationGroup="2" Width="400px"></asp:TextBox>

                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="请再次输入旧密码" ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox8" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="旧密码输入不一致" ValidationGroup="2"></asp:CompareValidator>

                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label11" runat="server" Text="请输入新密码："></asp:Label>

                </td>
                <td>

                    <asp:TextBox ID="TextBox6" runat="server" Width="400px" ValidationGroup="2" TextMode="Password"></asp:TextBox>

                </td>
                <td>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="请输入新密码" Display="Dynamic" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="1-20个数字或字母" ValidationExpression="[A-Za-z0-9]{0,20}" ValidationGroup="2"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label12" runat="server" Text="请再次输入新密码："></asp:Label>

                </td>
                <td>

                    <asp:TextBox ID="TextBox7" runat="server" Width="400px" ValidationGroup="2" TextMode="Password"></asp:TextBox>

                </td>
                <td>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="请再次输入新密码" Display="Dynamic" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="新密码输入不一致" ValidationGroup="2"></asp:CompareValidator>

                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>

                    <asp:Button ID="Button9" runat="server" Text="确定" OnClick="Button9_Click" ValidationGroup="2" />

                </td>
                <td>

                    <asp:Button ID="Button10" runat="server" Text="取消" OnClick="Button10_Click" />

                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

