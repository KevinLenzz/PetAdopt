<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePage/Employee.master" AutoEventWireup="true" CodeBehind="EmpInf.aspx.cs" Inherits="PetAdopt.EmployeePage.EmpInf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <table style="width: 100%">
    <tr>
        <td style="width: 494px">员工号：</td>
        <td>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 494px">员工名：</td>
        <td>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 494px">是否为管理员：</td>
        <td>
            <asp:Label ID="Label3" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
