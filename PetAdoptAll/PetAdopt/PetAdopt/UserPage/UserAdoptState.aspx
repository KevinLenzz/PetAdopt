<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage/User.master" AutoEventWireup="true" CodeBehind="UserAdoptState.aspx.cs" Inherits="PetAdopt.UserPage.UserAdopt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="petName" HeaderText="动物名" />
            <asp:BoundField DataField="applyTime" HeaderText="申请时间" />
            <asp:BoundField DataField="adptState" HeaderText="是否通过" />
        </Columns>
    </asp:GridView>
</asp:Content>
