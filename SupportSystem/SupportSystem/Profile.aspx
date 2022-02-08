<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SupportSystem.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Profile

    <div class="row">
        <div class="col-xl-12">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <!-- Form Row-->
                    <div class="row gx-3 mb-3">
                        <!-- Form Group (first name)-->
                        <div class="col-md-6">
                            <label class="small mb-1" for="inputFirstName">AD</label>
                            <input class="form-control" id="inputFirstName"  runat="server"  type="text" placeholder="Enter your first name"  >
                        </div>
                        <!-- Form Group (last name)-->
                        <div class="col-md-6">
                            <label class="small mb-1" for="inputLastName">SOYAD</label>
                            <input class="form-control" id="inputLastName"  runat="server"  type="text" placeholder="Enter your last name" >
                        </div>
                    </div>
                    <!-- Form Group (email address)-->
                    <div class="mb-3">
                        <label class="small mb-1" for="inputEmailAddress">Email</label>
                        <input class="form-control"  runat="server"  id="inputEmailAddress" type="email" placeholder="Enter your email address">
                    </div>
                   
                    <!-- Form Row-->
                    <div class="row gx-3 mb-3">
                        <!-- Form Group (phone number) güncel şifreyi iki kere gimresi lazım neden hatırlıyor olması lazım ki değiştirsin farketmez neyse  -->
                        <div class="col-md-12">
                            <label class="small mb-1" for="inputPhone"> Güncel ŞİFRE</label>
                            <input class="form-control" id="pass1"  runat="server" type="password">
                        </div>
                        <!-- Form Group (birthday)-->
                        <div class="col-md-12">
                            <label class="small mb-1" for="inputBirthday">Yeni Şifre</label>
                            <input class="form-control" id="pass2" runat="server" type="password"  >
                        </div>
                          <div class="col-md-12">
                            <label class="small mb-1" for="inputBirthday">Şifre Tekrar</label>
                            <input class="form-control" id="pass3" runat="server" type="password" name="birthday">
                        </div>
                    </div>
                    <button class="btn btn-primary" runat="server" onserverclick="Button1_Click" type="button">
                        <i class="fas fa-save"></i>
                        Save changes</button>
                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
