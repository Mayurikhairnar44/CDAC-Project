<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SupplierManagement.aspx.cs" Inherits="FertilizerManagementSystem.SupplierManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('.table1').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Supplier Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="iImages/supplierImage.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Supplier ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtSupplierId" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="BtnGo" runat="server" Text="Go" OnClick="BtnGo_Click" />
                                    
                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtSupplierId"  ErrorMessage="Enter Supplier Id" ID="RequiredFieldValidator1" runat="server" ValidationGroup="SupplierValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Supplier Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtSupplierName" runat="server" placeholder="Supplier Name"></asp:TextBox>
                                    
                                </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtSupplierName"  ErrorMessage="Enter Supplier Name" ID="RequiredFieldValidator5" runat="server" ValidationGroup="SupplierValidationGroup"> </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Address</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control"
                                            placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                                        
                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="TxtAddress"  ErrorMessage="Enter Address" ID="RequiredFieldValidator2" runat="server" ValidationGroup="SupplierValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Mobile No</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TxtMobile" runat="server" CssClass="form-control"
                                        placeholder="Mobile No"></asp:TextBox>

                                </div>
                                    <asp:RequiredFieldValidator ControlToValidate="TxtMobile"  ErrorMessage="Enter Mobile No." ID="RequiredFieldValidator3" runat="server" ValidationGroup="SupplierValidationGroup"> </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="BtnAdd" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="BtnAdd_Click" ValidationGroup="SupplierValidationGroup"/>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="BtnUpdate" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="BtnUpdate_Click" ValidationGroup="SupplierValidationGroup"/>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="BtnDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="BtnDelete_Click" ValidationGroup="SupplierValidationGroup"/>
                            </div>
                        </div>
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
                                    <h4>Supplier List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KamdhenooKisanMartConnectionString2 %>" SelectCommand="SELECT * FROM [Supplier]"></asp:SqlDataSource>

                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GrdSupplier" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" GridLines="None" AutoGenerateColumns="False" DataKeyNames="supplier_id" ForeColor="#333333">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="supplier_id" HeaderText="Supplier ID" ReadOnly="True" SortExpression="supplier_id" />
                                        <asp:BoundField DataField="supplier_name" HeaderText="Supplier Name" SortExpression="supplier_name" />
                                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                                        <asp:BoundField DataField="mobile" HeaderText="Mobile Number" SortExpression="mobile" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
