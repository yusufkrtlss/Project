<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMail.aspx.cs" Inherits="SupportSystem.SendMail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://kit.fontawesome.com/b921c7b452.js" crossorigin="anonymous"></script>
    <link href="dist/css/adminlte.min.css" rel="stylesheet" />

    <title>New Support Request</title>
    <style>
        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
    </style>
</head>
<body class="text-center">
    <div id="uyaridiv" runat="server" visible="false" class="alert alert-primary" role="alert">

        <asp:Label ID="uyariLabel" runat="server" />
    </div>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <div class="nav-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img alt="Egebarkod Bilgisayar Ltd.Şti" src="https://www.egebarkod.com/images/thumbs/0001194_neroseçilen-01.jpeg" />
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="right-side">
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="Login.aspx">Login</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Send Mail -->
       <div class="form-signin">
        <div class="card card-danger">
            <div class="card-header">
                <h3 class="card-title">Write Your Message</h3>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">Subject</label>
                    <input type="text" class="form-control" runat="server" id="title" placeholder="Title" />
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Message</label>
                    <asp:TextBox class="form-control" TextMode="MultiLine" Rows="3" ID="detail" placeholder="Details" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Choose Category</label>
                    <asp:DropDownList ID="CategoryDrop" DataTextField="CategoryName" CssClass="form-control" DataValueField="ID" runat="server"></asp:DropDownList>

                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <asp:Button ID="Button1" OnClick="Button1_Click" class="btn btn-success btn-block" runat="server" Text="Send" />
            </div>
        </div>
        </div>
        <!-- Footer -->
        <footer class="text-center text-lg-start bg-light text-muted">
            <!-- Section: Social media -->
            <section
                class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
                <!-- Left -->
                <div class="me-5 d-none d-lg-block">
                    <span>Get connected with us on social networks:</span>
                </div>
                <!-- Left -->

                <!-- Right -->
                <div>
                    <a href="https://www.facebook.com/Egebarkod-102163452112763" class="me-4 text-reset">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="https://www.instagram.com/egebarkod/" class="me-4 text-reset">
                        <i class="fab fa-instagram"></i>
                    </a>

                </div>
                <!-- Right -->
            </section>
            <!-- Section: Social media -->

            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h6 class="text-uppercase fw-bold mb-4">EgeBarkod
                            </h6>
                            <p>
                                To be a company that adapts rapidly to technological
            developments in the sector, directs change, keeps user
            and employee satisfaction at the highest level, 
            and is preferred by all business partners.
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Customer Service
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Sales Agreement</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Membership Agreement</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Privacy and Security</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Protection of Personal Data</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Connections
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Sitemap Settings</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Contact
                            </h6>
                            <p><i class="fas fa-home me-3"></i>1594/1SK NO:44 Bayraklı - İzmir</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                ik@egebarkod.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i>+ 90 232 435 39 39</p>
                            <p><i class="fas fa-print me-3"></i>+ 90 232 435 54 54</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2022 Copyright: Egebarkod Bilgisayar Ltd.Şti. Tüm hakları Saklıdır.
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </form>

    <script src="dist/js/adminlte.min.js"></script>
</body>
</html>
