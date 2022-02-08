<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Mails.aspx.cs" Inherits="SupportSystem.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        Mails Page
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <tr>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Date</th>
                    <th>Read Status</th>
                    <th>Details</th>
                </tr>
                <asp:Repeater ID="MailRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Title") %></td>
                            <td><%# Eval("CategoryName") %></td>
                            <td><%# Eval("Date") %></td>
                            <td><%# Eval("ReadStatus") %></td>
                            <td> <a class="btn btn-dark" href="AdminDetails.aspx"<%# Eval("ID") %>">
                                Details
                                 </a></td>
                        </tr>

                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
