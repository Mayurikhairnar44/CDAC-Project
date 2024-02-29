<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="FertilizerManagementSystem.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <img src="iImages/adminuser.png" width="150px" />
                            </center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Login</h3>
                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">

                            <label>Email ID</label>
                            <div class="form-group">
                                <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" placeholder="Enter Email Address"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="btnVerify" CssClass="btn btn-info" runat="server" Text="Verify Email" OnClick="btnVerify_Click" />

                            </div>

                            <label visible="false">Enter OTP</label>
                            <div class="form-group">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter a OTP"></asp:TextBox>
                            </div>

                            <label>Username</label>
                            <div class="form-group">
                                <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                            </div>
                            <label>Password</label>
                            <div class="form-group">
                                <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="btnLogin" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="btnLogin_Click" />

                            </div>

                        </div>
                    </div>


                </div>
            </div>

            <a href="home.aspx"><< Back to Home</a><br><br>
        </div>
    </div>
</div>
</asp:Content>
