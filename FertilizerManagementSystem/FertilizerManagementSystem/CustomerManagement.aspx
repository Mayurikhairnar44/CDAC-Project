<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerManagement.aspx.cs" Inherits="FertilizerManagementSystem.StockManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Customer Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="iImages/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Customer ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtCustomerID" runat="server" placeholder="Customer ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="linkBtnGO" runat="server" OnClick="linkBtnGO_Click" ValidationGroup="CustMangementValidationGroup"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:RequiredFieldValidator ControlToValidate="txtCustomerID" ErrorMessage="Enter Customer ID" ID="RequiredFieldValidator3" runat="server" ValidationGroup="CustMangementValidationGroup"> </asp:RequiredFieldValidator>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="txtAccountStatus" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="linkBtnActive" runat="server" OnClick="linkBtnActive_Click" ValidationGroup="CustMangementValidationGroup"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="linkBtnPending" runat="server" OnClick="linkBtnPending_Click" ValidationGroup="CustMangementValidationGroup"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="linkBtnDeactive" runat="server" OnClick="linkBtnDeactive_Click" ValidationGroup="CustMangementValidationGroup"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtDob" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtContact" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Customer Payment Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">

                            <%--<div class="col-md-4">
                                <label>Payment Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPaymentDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>--%>

                            <div class="col-md-6">
                                <label>Paid Amount</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPaidAmount" runat="server" placeholder="Paid Amount"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Remaining Amount</label>
                                <div class="form-group">
                                    <div class="input-group">
                                         <asp:TextBox CssClass="form-control" ID="txtRemaining" runat="server" placeholder="Remaining Amount" ReadOnly="True"></asp:TextBox>
                                        
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Full Postal Address</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8 mx-auto">
                            <asp:Button ID="BtnUpdateUser" class="btn btn-lg btn-block btn-success" runat="server" Text="Update" OnClick="btnUpdateAccountStatus_Click" ValidationGroup="CustMangementValidationGroup" />
                        </div>
                        <br />
                        <br>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-8 mx-auto">
                            <asp:Button ID="BtnDeleteUser" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="BtnDeleteUser_Click" ValidationGroup="CustMangementValidationGroup" />
                        </div>
                        <br />
                        <br>
                    </div>
                </div>
                <a href="home.aspx"><< Back to Home</a><br>
                <br>
            </div>



            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Customer List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:KamdhenooKisanMartConnectionString2 %>' SelectCommand="SELECT * FROM [SignUp]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="username">
                                    <Columns>
                                        <asp:BoundField DataField="username" HeaderText="Id" ReadOnly="True" SortExpression="username">
                                            <ControlStyle Font-Bold="True" />
                                            <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("full_name") %>'>
                                                                    </asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Date Of Birth-
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("dob") %>'></asp:Label>
                                                                    | Contact No-
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("contact_no") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Email-
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("email") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    State-
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("state") %>'></asp:Label>
                                                                    | City-
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("city") %>'></asp:Label>
                                                                    | Pin Code-
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("pincode") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Full Address-
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("full_address") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Account Status-
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="true" Font-Size="Smaller" Text='<%# Eval("account_status") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
