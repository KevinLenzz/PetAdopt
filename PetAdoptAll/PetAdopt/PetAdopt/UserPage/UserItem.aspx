﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage/User.master" AutoEventWireup="true" CodeBehind="UserItem.aspx.cs" Inherits="PetAdopt.UserItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <table>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="itemCode" HeaderText="商品号" />
                        <asp:BoundField DataField="itemType" HeaderText="商品类型" />
                        <asp:BoundField DataField="itemName" HeaderText="商品名" />
                        <asp:BoundField DataField="price" HeaderText="价格" DataFormatString="{0:C}"/>
                        <asp:BoundField DataField="sales" HeaderText="销量" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button  runat="server" Text="查看评价" CommandName="ReviewCommand" OnClick="CheckReview" CommandArgument=<%# Eval("itemCode") %>/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:Panel runat="server" ID="Panel1" Height="500px" ScrollBars="Vertical" Visible="False" Width="200px">
                <asp:ListView ID="ListView1" runat="server">
                    <LayoutTemplate>
                        <div style="display: flex; flex-wrap: wrap;">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div style="margin: 10px;">
                        <asp:Label runat="server" Text=<%# Eval("userName") %>>
                        </asp:Label>
                        <br />
                        <asp:Label runat="server" Text=<%# "评分"+Eval("rate") %>>
                        </asp:Label>
                        <br />
                        <asp:Label runat="server" Text=<%# Eval("content")%>>
                        </asp:Label>
                        <br />
                        <asp:Label runat="server" Text=<%# Eval("pushTime")%>>
                        </asp:Label>
                        <br />
                            </div>
                    </ItemTemplate>
                </asp:ListView>
                </asp:Panel>
                <br />
                <asp:Panel runat="server" ID="Panel2" Height="400px" Visible="False" Width="200px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="0.5">0.5</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="1.5">1.5</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="2.5">2.5</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="3.5">3.5</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="4.5">4.5</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:TextBox runat="server" ID="SendBox" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <asp:Button runat="server" Text="发送" OnClick="Unnamed1_Click"/>
                    <asp:Button runat="server" Text="清空" OnClick="Unnamed2_Click"/>
               </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateDeleteButton="True" OnRowDeleting="GridView2_RowDeleting" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Code" HeaderText="商品号" />
            <asp:BoundField DataField="Name" HeaderText="商品名" />
            <asp:BoundField DataField="Amount" HeaderText="已选数量" />
            <asp:BoundField DataField="Price" HeaderText="单价" DataFormatString="{0:C}"/>
            <asp:BoundField DataField="Total" HeaderText="单项总价" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>
总价：¥<asp:Label ID="Label1" runat="server">0</asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="加入购物车" />
</asp:Content>