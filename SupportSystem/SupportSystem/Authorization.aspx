<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="SupportSystem.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-6">
            <label>Choose User</label>
            <asp:DropDownList DataTextField="Name Surname" CssClass="form-control" DataValueField="ID" ID="UserList" runat="server">
            </asp:DropDownList>
        </div>
        <div class="col-md-6">
            <label>Choose Category</label>
            <asp:DropDownList ID="CategoryDrop" DataTextField="CategoryName" CssClass="form-control" DataValueField="ID" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-12 my-4 ">
            <asp:Button CssClass="btn btn-success btn-md float-right" Text="Authorize" OnClick="AuthorizationButton_Click" ID="AuthorityButton" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <tr>
                    <td>Name</td>
                    <td>Surname</td>
                    <td>Email</td>
                    <td>Category</td>
                    <td>Role</td>
                    <td>Remove Authorization</td>
                </tr>
                <asp:Repeater ID="UserRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("Lastname") %></td>
                            <td><%# Eval("EMAIL") %></td>
                            <td><%# Eval("CategoryName") %></td>
                            <td><%# Eval("RoleName") %></td>
                            <td>
                                <asp:Button ID="Button1" CssClass="btn btn-success btn-md" OnClick="Button1_Click" runat="server" Text="Remove" /> </td>
                        </tr>

                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
