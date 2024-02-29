<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="FertilizerManagementSystem.Dashbord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Product Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="100px" width="100px" src="Product/kkmLogo.jpg" />
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
                                <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" onchange="readURL(this);" />
                                <asp:RequiredFieldValidator ControlToValidate="FileUpload1"  ErrorMessage="Please Select Image" ID="RequiredFieldValidator14" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Product ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtProID" runat="server" placeholder="Product ID"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click"></asp:Button>
                                        <asp:RequiredFieldValidator ControlToValidate="txtProID"  ErrorMessage="Enter Product Id" ID="RequiredFieldValidator1" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Product Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtProName" runat="server" placeholder="Product Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtProName"  ErrorMessage="Enter Product Name" ID="RequiredFieldValidator2" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Category</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownCategory" runat="server">
                                        <asp:ListItem Text="Select" Value="Select" />
                                        <asp:ListItem Text="Pesticide" Value="Pesticide" />
                                        <asp:ListItem Text="Fertilizer" Value="Fertilizer" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="DropDownCategory"  ErrorMessage="Enter Category" ID="RequiredFieldValidator3" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>

                                </div>
                                <label>Arrival Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtArrivalDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtArrivalDate"  ErrorMessage="Enter Arrival Date" ID="RequiredFieldValidator4" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Supplier Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownSupplier" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="DropDownSupplier"  ErrorMessage="Enter Supplier Name" ID="RequiredFieldValidator5" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                </div>
                                <label>Manufacturing Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtMFGDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtMFGDate"  ErrorMessage="Enter MFG Date" ID="RequiredFieldValidator6" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                               
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Form</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownForm" runat="server">
                                        <asp:ListItem Text="Solid" Value="Solid" />
                                        <asp:ListItem Text="Liquid" Value="Liquid" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="DropDownForm"  ErrorMessage="Enter Product Form" ID="RequiredFieldValidator7" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                </div>
                                <label>Expiry Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtExpDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtExpDate"  ErrorMessage="Enter Exp Date" ID="RequiredFieldValidator8" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Weight</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtWeight" runat="server" placeholder="Weight"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtWeight"  ErrorMessage="Enter Product Weight" ID="RequiredFieldValidator9" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Sales Price(per unit)</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtSPrice" runat="server" placeholder="Seles Price"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtSPrice"  ErrorMessage="Enter Sales Price" ID="RequiredFieldValidator10" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Purchase Price(per unit)</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPPrice" runat="server" placeholder="Purchase Price"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtPPrice"  ErrorMessage="Enter Purchase Price" ID="RequiredFieldValidator11" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>New Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtNewStock" runat="server" TextMode="Number" placeholder="New Stock"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtNewStock"  ErrorMessage="Enter New Stock" ID="RequiredFieldValidator12" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                               
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Total Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtTotalStock" runat="server" placeholder="Total Stock" ReadOnly="True"></asp:TextBox>
                                    
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>Product Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtProductDescription" runat="server" placeholder="Product Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtProductDescription"  ErrorMessage="Enter Product Description" ID="RequiredFieldValidator13" runat="server" ValidationGroup="AddProductValidationGroup"> </asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAdd" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click" ValidationGroup="AddProductValidationGroup"/>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdate" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="AddProductValidationGroup"/>
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
                                    <h4>Product List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KamdhenooKisanMartConnectionString2 %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1">
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
                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("product_name") %>'>
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
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("total_stock") %>'></asp:Label>
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
                                                            <asp:Image ID="Image1" CssClass="img-fluid" runat="server" ImageUrl='<%# Eval("product_img_link") %>' />
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
