<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePage/Employee.master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="PetAdopt.EmployeePage.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <table>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="employeeCode" HeaderText="员工号" />
                        <asp:BoundField DataField="eplyName" HeaderText="员工名" />
                        <asp:BoundField DataField="pwd" HeaderText="密码" />
                        <asp:BoundField DataField="isManager" HeaderText="是否为管理员" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button  runat="server" Text="查看轨迹" OnClick="CheckTrack" CommandArgument=<%# Eval("employeeCode").ToString() %>/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <h1>员工操作跟踪：</h1>
                <br />
                <asp:ListView ID="ListView1" runat="server">
                        <LayoutTemplate>
                            <div>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div style="margin: 10px;">
                                <asp:Label runat="server" Text=<%# Eval("track") %>>
                                </asp:Label>
                                <br />
                                <asp:Label runat="server" Text=<%# Eval("stepTime") %>>
                                </asp:Label>
                                <br />
                            </div>
                        </ItemTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>
</asp:Content>
