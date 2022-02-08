<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="SupportSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="form-group mb-2">
                    <label class="text-dark">Category Name</label>
                    <input type="text" runat="server" class="form-control" id="categoryname">
                </div>
                <asp:Button ID="CategoryAddButton" OnClick="CategoryAddButton_Click" class="btn btn-primary mb-2" runat="server" Text="Add" />
            </div>

            <div class="col-md-12">
                <label class="text-dark">Categories</label>
                <table class="table table-striped">
                    <thead>
                        <tr>
                             <th>Name </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="CategoryRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("CategoryName") %></td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
