<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="UsersDetail.aspx.cs" Inherits="SupportSystem.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Users Detail</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
         <table class="table table-striped">
                <tr>
                    <th>Title</th>
                    <th>Detail</th>
                    <th>CategoryName</th>
                    <th>Date</th>
                </tr>
                <asp:Repeater ID="DetailRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# Eval("Title") %>

                            </td>
                            <td>
                                <%# Eval("Detail") %>

                            </td>
                            <td>
                                <%# Eval("CategoryName") %>

                            </td>
                            <td>
                                <%# Eval("Date") %>

                            </td>
                        </tr>

                    </ItemTemplate>
                </asp:Repeater>
            </table>
            </div>
    </div>
</asp:Content>
