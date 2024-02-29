<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="FertilizerManagementSystem.ContactUs" %>

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
                                    <img src="iImages/Contact-Us-animation.gif" width="150px" />
                                </center>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Contact Us</h3>
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
                                <label>Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter A Name" ControlToValidate="TxtName"></asp:RequiredFieldValidator>
                                </div>
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter A Email" ControlToValidate="TxtEmail"></asp:RequiredFieldValidator>                                
                                </div>
                                <label>Subject</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtSubject" runat="server" CssClass="form-control" placeholder="Enter subject"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter A Subject" ControlToValidate="TxtSubject"></asp:RequiredFieldValidator>                                    
                                </div>
                                <label>Message</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter your message"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Give Some Message" ControlToValidate="TxtMessage"></asp:RequiredFieldValidator>                                                                        
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnSend" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="Send" OnClick="btnSend_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="home.aspx"><< Back to Home</a><br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>
