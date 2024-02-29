<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FertilizerManagementSystem.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
                                    <img src="iImages/login.gif" width="200px" />
                                </center>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>लॉगिन</h3>
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
                                <label>वापरकर्तानाव</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control" placeholder="वापरकर्तानाव टाका"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="वापरकर्तानाव टाका" ControlToValidate="TxtUsername" ValidationGroup="LoginValidationGroup"> </asp:RequiredFieldValidator>
                                       
                                </div>
                                <label>पासवर्ड</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" placeholder="पासवर्ड टाका" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="पासवर्ड टाका" ControlToValidate="TxtPassword" ValidationGroup="LoginValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnLogin" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="लॉगिन करा" OnClick="btnLogin_Click" ValidationGroup="LoginValidationGroup"/>

                                </div>

                                
                                <div class="form-group">
                                    <a href="SignUp.aspx"><input id="btnSignup" type="button" class="btn btn-info btn-block btn-lg" value="साइन अप करा" onclick="btnSignup_Click"/></a>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

                <a href="home.aspx"><< मागे जा</a><br><br>
            </div>
        </div>
    </div>
</asp:Content>
