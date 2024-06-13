<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePage/Employee.master" AutoEventWireup="true" CodeBehind="EmpPet.aspx.cs" Inherits="PetAdopt.EmployeePage.EmpPet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <table style="width: 100%">
        <tr>
            <td>动物名：</td>
            <td style="width: 346px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="请输入动物名" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>品种：</td>
            <td style="width: 346px">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="请输入品种" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>活动区域：</td>
            <td style="width: 346px">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="请输入活动区域" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>简介</td>
            <td style="width: 346px">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="请输入简介" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>是否可领养</td>
            <td style="width: 346px">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="0">不可领养</asp:ListItem>
                    <asp:ListItem Value="1">可领养</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" ErrorMessage="请选择是否可领养" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>是否已绝育</td>
            <td style="width: 346px">
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="1">已绝育</asp:ListItem>
                    <asp:ListItem Value="0">未绝育</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList2" ErrorMessage="请选择是否已绝育" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="width: 346px">
                <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" ValidationGroup="1" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <h1>已经有状态的动物：</h1>
    <asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate>
            <div style="display: flex; flex-wrap: wrap;">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />  
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div style="margin: 10px;">
                <table>
                    <tr>
                        <td>
                            动物号：
                        </td>
                        <td>
                            <%# Eval("petCode") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            动物名：
                        </td>
                        <td>
                            <%# Eval("petName") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            品种：
                        </td>
                        <td>
                            <%# Eval("breed") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            活动区域：
                        </td>
                        <td>
                            <%# Eval("activeArea") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            简介：
                        </td>
                        <td>
                            <%# Eval("profile") %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%# "&nbsp&nbsp&nbsp&nbsp"+(Convert.ToBoolean(Eval("isAdoptable")) ? "可领养" : "不可领养")%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%# "&nbsp&nbsp&nbsp&nbsp"+(Convert.ToBoolean(Eval("isNeutered")) ? "已绝育" : "未绝育")%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            当前状态：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp近照：
                        </td>
                        <td>
                            <asp:Image runat="server" ImageUrl=<%# "~/PetImage/"+Eval("imageURL")%> Height="200px" Width="200px">
                            </asp:Image>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp地点定位：
                        </td>
                        <td>
                            <%# Eval("position") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp领养者：
                        </td>
                        <td>
                            <%# Eval("usName") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp更新时间：
                        </td>
                        <td>
                            <%# Eval("updateTime") %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button runat="server" Text="删除" OnClick="DeleteOnClick" CommandArgument=<%# Eval("petCode")%>/>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <h1>还未设置状态的动物：</h1>
    <asp:ListView ID="ListView2" runat="server">
    <LayoutTemplate>
        <div style="display: flex; flex-wrap: wrap;">
            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />  
        </div>
    </LayoutTemplate>
    <ItemTemplate>
        <div style="margin: 10px;">
            <table>
                <tr>
                    <td>
                        动物号：
                    </td>
                    <td>
                        <%# Eval("petCode") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        动物名：
                    </td>
                    <td>
                        <%# Eval("petName") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        品种：
                    </td>
                    <td>
                        <%# Eval("breed") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        活动区域：
                    </td>
                    <td>
                        <%# Eval("activeArea") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        简介：
                    </td>
                    <td>
                        <%# Eval("profile") %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <%# "&nbsp&nbsp&nbsp&nbsp"+(Convert.ToBoolean(Eval("isAdoptable")) ? "可领养" : "不可领养")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <%# "&nbsp&nbsp&nbsp&nbsp"+(Convert.ToBoolean(Eval("isNeutered")) ? "已绝育" : "未绝育")%>
                    </td>
                </tr>
            </table>
        </div>
    </ItemTemplate>
</asp:ListView>
</asp:Content>
