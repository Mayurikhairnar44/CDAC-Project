<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewStock.aspx.cs" Inherits="FertilizerManagementSystem.viewStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <center>
                    <h3>Product Inventory List</h3>
                </center>
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card">
    <div class="card-body">
       
        <div class="row">
            <div class="col">
                <hr>
            </div>
        </div>
        <div class="row">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KamdhenooKisanMartConnectionString2 %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
            <div class="col">
                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="product_id" HeaderText="Id" ReadOnly="True" SortExpression="product_id">
                            <ControlStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" />
                        </asp:BoundField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-10">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("product_name") %>'>
                                                    </asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    Category-
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("category") %>'></asp:Label>
                                                    | Supplier Name-
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("supplier_name") %>'></asp:Label>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    Mfg Date-
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("mfg_date") %>'></asp:Label>
                                                    | Exp Date-
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("expiry_date") %>'></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    Weight-
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Weight") %>'></asp:Label>
                                                    | Sales Price(per unit)-
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("sales_price") %>'></asp:Label>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    Total Stock-
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("total_stock") %>'></asp:Label>
                                                    | Form-
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("form") %>'></asp:Label>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    Description-
                                                     <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="true" Font-Size="Smaller" Text='<%# Eval("product_description") %>'></asp:Label>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-lg-2">
                                            <asp:Image ID="Image1" CssClass="img-fluid" Width="200px"  Height="200px" runat="server" ImageUrl='<%# Eval("product_img_link") %>' />
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
            <center>
                <a href="home.aspx"><< Back to Home</a><span class="clearfix"></span>
                <br />
                <center>
        </div>
    </div>
</asp:Content>
