<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PayNow.aspx.cs" Inherits="FertilizerManagementSystem.PayNow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-md-10 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <img src="iImages/PayNow.gif" width="200px"/>
                            </center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Pay By Scanning QR Code or By Using Account Details</h3>
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
                            <center>
                            <h4>QR Code</h4>
                            </center>
                            <center>
                            <div class="form-group">
                                <img src="iImages/QRCode.jpeg" width="500px" height="500px"/>
                            </div>
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
                            <center>
                                <h4>Account Details</h4>
                            </center>
                            <center>
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text=""><b>Branch:</b> VADNER BHAIRAV(169)</asp:Label><br />
                                    <asp:Label ID="Label2" runat="server" Text=""><b>Account No:</b> 25032103855</asp:Label><br />
                                    <asp:Label ID="Label3" runat="server" Text=""><b>IFSC Code:</b> MAHB0000169</asp:Label><br />
                                    <asp:Label ID="Label4" runat="server" Text=""><b>Account Holder Name</b> Mayuri Khairnar</asp:Label><br />

                                </div>
                            </center>
                        </div>
                    </div>


                </div>
            </div>

            <a href="home.aspx"><< Back To Home</a><br><br>
        </div>
    </div>
</div>
</asp:Content>
