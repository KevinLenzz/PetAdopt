﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage/User.master" AutoEventWireup="true" CodeBehind="UserOrder.aspx.cs" Inherits="PetAdopt.UserOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
                            订单号：
                        </td>
                        <td>
                            <%# Eval("orderCode") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            收货地址：
                        </td>
                        <td>
                            <%# Eval("targetAddress") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            订单情况：
                        </td>
                        <td>
                            <%# Eval("orderState") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            下单时间：
                        </td>
                        <td>
                            <%# Eval("orderTime") %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button runat="server" Text="点击查看订单详情" OnClick="ButtonClick" CommandArgument=<%# Eval("orderCode").ToString()+"|"+Container.DataItemIndex.ToString() %>/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="panelGridView" runat="server"></asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
