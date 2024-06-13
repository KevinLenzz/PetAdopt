<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage/User.master" AutoEventWireup="true" CodeBehind="UserPetInf.aspx.cs" Inherits="PetAdopt.UserPetInf" %>
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
                        <td>
                            <%# "&nbsp&nbsp&nbsp&nbsp"+(Convert.ToBoolean(Eval("isAdoptable")) ? "可领养" : "不可领养")%>
                        </td>
                        <td>
                            <asp:Button runat="server" Enabled=<%# Convert.ToBoolean(Eval("isAdoptable"))%> Text="领养" OnClick="Pet_Click" CommandArgument='<%# Eval("petCode").ToString()+"|"+Eval("petName").ToString() %>'/>
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
                </table>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
