<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePage/Employee.master" AutoEventWireup="true" CodeBehind="EmpAdoptApply.aspx.cs" Inherits="PetAdopt.EmployeePage.EmpAdoptApply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="userCode" HeaderText="用户号" />
            <asp:BoundField DataField="petName" HeaderText="动物名" />
            <asp:BoundField DataField="applyTime" HeaderText="申请时间" />
            <asp:BoundField DataField="adptState" HeaderText="是否通过" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button  runat="server" Text="通过" CommandName="ReviewCommand" OnClick="Allow" CommandArgument=<%# Eval("userCode").ToString()+'|'+Eval("petCode").ToString() %>/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button  runat="server" Text="不通过" CommandName="ReviewCommand" OnClick="Refuse" CommandArgument=<%# Eval("userCode").ToString()+'|'+Eval("petCode").ToString() %>/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
