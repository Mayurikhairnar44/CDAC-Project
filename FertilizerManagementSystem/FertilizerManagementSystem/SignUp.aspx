<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FertilizerManagementSystem.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="iImages/SignUp.gif" width="300px"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>नोंदणी</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>पूर्ण नाव</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="पूर्ण नाव"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="पूर्ण नाव टाका" ControlToValidate="txtFullName" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>जन्मतारीख</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDOB" runat="server" placeholder="जन्मतारीख" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="जन्मतारीख टाका" ControlToValidate="txtDOB" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>संपर्क क्रमांक</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtContact" runat="server" placeholder="संपर्क क्रमांक"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="संपर्क क्रमांक टाका" ControlToValidate="txtContact" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" runat="server" ErrorMessage="मोबाइल नंबर अवैध आहे" ControlToValidate="txtContact" ValidationExpression="^[789]\d{9}$" ValidationGroup="SignUpValidationGroup"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>ई - मेल आयडी</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="ई - मेल आयडी" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="ई - मेल आयडी टाका" ControlToValidate="txtEmail" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="अवैध ईमेल" ControlToValidate="txtEmail" ValidationGroup="SignUpValidationGroup" ValidationExpression="^([a-z0-9]([a-zA-Z0-9.]+)?[a-zA-Z0-9])@([a-zA-Z0-9]([a-zA-Z0-9\-]+)?[a-zA-Z0-9])\.([a-zA-Z]{2,})(\.[a-zA-Z]{2,})?$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>राज्य</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="drpState" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                        <asp:ListItem Text="Assam" Value="Assam" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Goa" Value="Goa" />
                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                        <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                        <asp:ListItem Text="Kerala" Value="Kerala" />
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                        <asp:ListItem Text="Manipur" Value="Manipur" />
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                        <asp:ListItem Text="Telangana" Value="Telangana" />
                                        <asp:ListItem Text="Tripura" Value="Tripura" />
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                        <asp:ListItem Text="West Bengal" Value="West Bengal" />

                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="राज्य टाका" ControlToValidate="drpState" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>शहर</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="शहर"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="शहर टाका" ControlToValidate="txtCity" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>पिन कोड</label>
                                <div class="form-group">

                                    <asp:TextBox class="form-control" ID="txtPincode" runat="server" placeholder="पिन कोड" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="पिन कोड टाका" ControlToValidate="txtPincode" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="अवैध पिन कोड" ControlToValidate="txtPincode" ValidationGroup="SignUpValidationGroup" ValidationExpression="^\d{6}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>संपूर्ण पत्ता</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" placeholder="संपूर्ण पत्ता" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="संपूर्ण पत्ता टाका" ControlToValidate="txtAddress" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>

                        <%-- css pill badge --%>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">लॉगिन क्रेडेन्शियल्स</span>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>वापरकर्तानाव</label>
                                <div class="form-group">

                                    <asp:TextBox class="form-control" ID="txtUsername" runat="server" placeholder="वापरकर्तानाव"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="वापरकर्तानाव टाका" ValidationGroup="SignUpValidationGroup" ControlToValidate="TxtUsername"> </asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>पासवर्ड</label>
                                <div class="form-group">

                                    <asp:TextBox class="form-control" ID="txtPassword" runat="server" placeholder="पासवर्ड" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="पासवर्ड टाका" ControlToValidate="TxtPassword" ValidationGroup="SignUpValidationGroup"> </asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="पासवर्ड किमान 8 वर्णांचा असावा, त्यात किमान एक अप्परकेस अक्षर, एक लोअरकेस अक्षर, एक अंक आणि एक विशेष वर्ण असावा." ControlToValidate="txtPassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$" ValidationGroup="SignUpValidationGroup"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="btnsignUp" runat="server" Text="साइन अप करा" OnClick="btnsignUp_Click1" ValidationGroup="SignUpValidationGroup" />
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="home.aspx"><< मागे जा</a><br>
                <br>
            </div>

        </div>
    </div>
</asp:Content>
