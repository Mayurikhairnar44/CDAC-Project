<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="FertilizerManagementSystem.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        //print Report
        function PrintReport() {
            var ReportDate = document.getElementById('<%=txtDate.ClientID%>').value;

            var PGrid = document.getElementById('<%=Reportlist.ClientID%>');
            PGrid.border = 0;
            var PWin = window.open('', 'PrintGrid', 'left=100,top=100,width=1024,height=768,toolbar=0,resizable=1');



            PWin.document.write('<h2>Report Date: ' + ReportDate + '</h2>');
            PWin.document.write(PGrid.outerHTML);

            PWin.document.close();
            PWin.focus();
            PWin.print();
            PWin.close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="iImages/Report.jpeg" width="150px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Sold Product Report</h3>
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

                        <br />
                        <center>
                            <div class="row">
                                <div class="col-md-4">


                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"
                                        placeholder="Select Date" TextMode="Date"></asp:TextBox>

                                </div>
                                <center>

                                    <div class="col-md-6">
                                        <asp:Button ID="Button1" runat="server" Text="Generate Report" class="btn btn-dark" OnClick="Button1_Click" />
                                    </div>

                                </center>
                                <%--<div class="col-md-6">

                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Sold Product</asp:ListItem>
                                    <asp:ListItem>Purchased Product</asp:ListItem>
                                </asp:DropDownList>

                            </div>--%>
                            </div>
                        </center>
                        <br />
                        <center>
                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView ID="Reportlist" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="customer_name" HeaderText="Customer Name" SortExpression="customer_name" />
                                            <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                                            <asp:BoundField DataField="product_price" HeaderText="Product Price" SortExpression="product_price" />
                                            <asp:BoundField DataField="purchased_date" HeaderText="Purchased Date" SortExpression="purchased_date" />
                                            <asp:BoundField DataField="payment_status" HeaderText="Payment Status" SortExpression="payment_status" />

                                            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />

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
                        </center>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <center>

                            <div class="col-md-6">
                                <asp:Button ID="Button2" runat="server" Text="Print Report" class="btn btn-dark" OnClientClick="PrintReport()" />
                            </div>

                        </center>
                    </div>
                </div>

                <a href="home.aspx"><< Back to Home</a>
            </div>
        </div>
    </div>
</asp:Content>
