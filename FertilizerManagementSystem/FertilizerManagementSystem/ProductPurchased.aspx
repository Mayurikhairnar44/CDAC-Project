<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductPurchased.aspx.cs" Inherits="FertilizerManagementSystem.ProductPurchased" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".productlst").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });


        //print bill
        function PrintBill() {
            var customerName = document.getElementById('<%=txtCustomerName.ClientID%>').value;
            console.log(customerName);
            var billTotal = document.getElementById('<%=billTotal.ClientID%>').innerText;
            var PGrid = document.getElementById('<%=billList.ClientID%>');
            PGrid.border = 0;
            var PWin = window.open('', 'PrintGrid', 'left=100,top=100,width=1024,height=768,toolbar=0,resizable=1');

            PWin.document.write('<h2>Farmer Name: ' + customerName + '</h2>');
            PWin.document.write(PGrid.outerHTML);
            PWin.document.write('<b>Total Bill: ' + billTotal + '<b>');
            PWin.document.close();
            PWin.focus();
            PWin.print();
            PWin.close();
        }


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
                                    <h3>Purchase Product</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="iImages/kkmLogo.jpg" width="150px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Customer Id</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCustomerId" runat="server" CssClass="form-control"
                                            placeholder="Customer ID"></asp:TextBox>
                                        <asp:Button ID="btnCustomerGo" runat="server" Text="Go" class="btn btn-info" OnClick="btnCustomerGo_Click" ValidationGroup="ProductPurchaseValidationGroup" />

                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtCustomerId" ErrorMessage="Enter Customer ID" ID="RequiredFieldValidator3" runat="server" ValidationGroup="ProductPurchaseValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Customer Name</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control"
                                            placeholder="Customer Name" ReadOnly="true"></asp:TextBox>

                                    </div>

                                </div>
                                <asp:RequiredFieldValidator ControlToValidate="txtCustomerName" ErrorMessage="Enter Customer Name" ID="RequiredFieldValidator1" runat="server" ValidationGroup="CustMangementValidationGroup"> </asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Product Name</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"
                                            placeholder="Product Name" ReadOnly="true"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtProductName" ErrorMessage="Select Product Name" ID="RequiredFieldValidator2" runat="server" ValidationGroup="CustMangementValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <%--  --%>
                            <div class="col-md-6">
                                <label>Price Of The Product</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control"
                                            placeholder="Price" ReadOnly="true"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtProductPrice" ErrorMessage="Select Product Name" ID="RequiredFieldValidator4" runat="server" ValidationGroup="CustMangementValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <label>Date</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"
                                            placeholder="Date" TextMode="Date"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtDate" ErrorMessage="Select Purchase Date" ID="RequiredFieldValidator5" runat="server" ValidationGroup="CustMangementValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Quantity</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtQty" runat="server" CssClass="form-control"
                                            placeholder="Product Quantity"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtQty" ErrorMessage="Enter Product Quantity" ID="RequiredFieldValidator6" runat="server" ValidationGroup="CustMangementValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Amount Paid</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtAmountPaid" runat="server" CssClass="form-control"
                                            placeholder="Amount Paid"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ControlToValidate="txtAmountPaid" ErrorMessage="Enter Amount Paid" ID="RequiredFieldValidator7" runat="server" ValidationGroup="CustMangementValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Remaining Amount</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtRemainingAmount" runat="server" CssClass="form-control"
                                            placeholder="Remaining Amount" ReadOnly="true"></asp:TextBox>
                                        <asp:Button ID="btnRemainingAmount" runat="server" Text="Check" class="btn btn-info" OnClick="btnRemainingAmount_Click" />

                                    </div>
                                </div>
                            </div>

                        </div>

                        <br />




                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">

                                        <asp:Button ID="btnAddToBill" runat="server" Text="Add To Bill" class="btn btn-success btn-block" Width="100%" OnClick="btnAddToBill_Click" ValidationGroup="CustMangementValidationGroup" />

                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>All Product List</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col ">
                                <asp:GridView class="table table-striped table-bordered productlst" ID="productList" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="productList_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                                        <asp:BoundField DataField="mfg_date" HeaderText="Mfg Date" SortExpression="mfg_date" />
                                        <asp:BoundField DataField="expiry_date" HeaderText="Expiry Date" SortExpression="expiry_date" />
                                        <asp:BoundField DataField="total_stock" HeaderText="stock" SortExpression="total_stock" />
                                        <asp:BoundField DataField="sales_price" HeaderText="Price" SortExpression="sales_price" />

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

    <hr />
    <%-- Bill --%>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">

                <br />
                <div class="row">
                    <div class="card mx-auto">
                        <div class="card-body">
                            <center>
                                <h3>Product Bill List</h3>
                            </center>

                            <div class="row">

                                <div class="col ">
                                    <asp:GridView class="table table-striped table-bordered" ID="billList" runat="server" AutoGenerateColumns="true">

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

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <hr />

                                    </center>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-8">
                                    Privious Remaining Ammount:
                                    <asp:Label runat="server" ID="priviousRemainingAmmount" CssClass="text-danger text-center"></asp:Label>
                                    <br />

                                </div>
                                <div class="col-4">
                                    Total:
                                    <asp:Label runat="server" ID="billTotal" CssClass="text-danger text-center"></asp:Label><br />

                                </div>
                            </div>
                            <br />


                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <center>
                                        <div class="form-group">
                                            <asp:Button ID="btnPrintBill" runat="server" Text="Print Bill" class="btn btn-success" Width="100%" OnClick="btnPrintBill_Click" OnClientClick="PrintBill()" />

                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>



</asp:Content>




