<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FertilizerSeggestion.aspx.cs" Inherits="FertilizerManagementSystem.FertiliserSeggetion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-7 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="iImages/Grapes2.jpg" width="200px" />
                                </center>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>CropNourish Navigator</h3>
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
                                    <label>दिवस : </label>

                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <%--<asp:ListItem>दिवस</asp:ListItem>--%>
                                        <asp:ListItem>छlटनीपुर्व १५ दिवस आधी</asp:ListItem>
                                        <asp:ListItem>1 लl दिवस</asp:ListItem>
                                        <asp:ListItem>1 लl दिवस(पाहिल्या वर्षीच्या प्लॉटला डबलपेस्ट )</asp:ListItem>
                                        <asp:ListItem>3 रl दिवस</asp:ListItem>
                                        <asp:ListItem>6 ते 7 वा</asp:ListItem>
                                        <asp:ListItem>7 ते 8 वा</asp:ListItem>
                                        <asp:ListItem>8 ते 9 वा</asp:ListItem>
                                        <asp:ListItem>शेंगदाणा 9/10/11 वा दिवस अवस्था</asp:ListItem>

                                    </asp:DropDownList>
                                </center>
                            </div>

                            <%--<label>उदेश किवा हेतू व काम : </label>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <%--<asp:ListItem>उदेश किवा हेतू व काम</asp:ListItem>
                                <asp:ListItem>पानगळ करणे</asp:ListItem>
                            </asp:DropDownList>
                            
                        </div>--%>
                        </div>
                        <br />
                        <div class="form-group">
                            <asp:Button ID="btnSearch" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" ForeColor="Black" GridLines="None" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="WorkNeed" HeaderText="उदेश किवा हेतू व काम" SortExpression="WorkNeed" />
                                <asp:BoundField DataField="Local" HeaderText="लोकॅलसाठी" SortExpression="Local" />
                                <asp:BoundField DataField="Export" HeaderText="एक्सपोर्टसाठी" SortExpression="Export" />
                            </Columns>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                    </div>
                </div>

                <a href="home.aspx"><< Back to Home</a><br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>
