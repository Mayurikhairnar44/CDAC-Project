<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="FertilizerManagementSystem.CutomerProfile" %>

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
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="iImages/kkmLogo.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>तुमची उरलेली पेमेंट उत्पादने</h4>
                                    <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="तुमची माहिती"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <center>
                                    <label>उर्वरित एकूण पेमेंट : </label>

                                    <asp:Label ID="LabelRemainingPayment" runat="server" Text="1000000"></asp:Label>
                                    &nbsp
                                    &nbsp
                                    <asp:Button CssClass="btn btn-warning" ID="btnPay" runat="server" Text="रक्कम भरा" OnClick="btnPay_Click" />
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound">

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
                <div class="row">
                    <div class="col-md-8">
                        <a href="home.aspx"><< मागे जा</a>
                    </div>
                    <div class="float-right col-md-4">
                        <a href="EditCustomerInfo.aspx">                                       प्रोफाईल संपादित करा >></a>
                    </div>
                </div>
                <br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>





