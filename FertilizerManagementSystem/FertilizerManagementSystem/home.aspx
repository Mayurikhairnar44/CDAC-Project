<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="FertilizerManagementSystem.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="iImages/KKMShop1.jpg" class="img-fluid bg-transparent" />
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <center>
                        <!--Stock Management-->
                        <img src="iImages/Stock%20Management.jpg" width="160px" />
                        <h4>Stock Management</h4>
                        <p class="text-lg-start">
                            Store supplier details
                     Discount management
                     View transaction history
                     Autofill your purchase orders
                     Quick Identification of the requirement

                        </p>
                    </center>
                </div>

                <div class="col-md-3">
                    <center>

                        <!--Centralized Store Management-->
                        <img src="iImages/stock-manage.jpg" width="200px" />
                        <h4>Centralized Store Management</h4>
                        <p class="text-lg-start">
                            Streamlined Inventory Control(efficiently organizes stock),
                            Supplier Collaboration Made Easy,manage supplier relationships,
                             Gain insights into inventory trends and supplier performance.

                        </p>
                    </center>
                </div>

                <div class="col-md-3">
                    <center>
                        <!--Purchase Management & Supplier Management-->
                        <img src="iImages/Purchase.jpg" width="175px" />
                        <h4>Purchase Management & Supplier Management</h4>
                        <p class="text-lg-start">
                            purchasing processes by managing supplier details,
                            negotiating discounts, and automating purchase orders,
                            ensuring timely procurement of goods,Cost-effective Operations
                        </p>
                    </center>
                </div>
                <div class="col-md-3">
                    <center>
                      
                        <!--Crop-Specific Fertilizer Recommendations-->
                        <img src="iImages/hand-giving-fertilizer-to-young-plant-vector-28006727.jpg" width="115px" />
                        <h4>Crop-Specific Fertilizer Recommendations</h4>
                        <p class="text-lg-start">
                            Receive precise fertilizer suggestions customized to different crops,
                 maximizing yield potential while minimizing wastage,
                 enhancing plant health, resilience, and overall productivity,Increased Agricultural Efficiency.
            
                        </p>
                    </center>
                </div>


            </div>

        </div>
    </section>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <div class="center-container">
                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/slider.xml" />
                    <asp:Timer ID="Timer1" runat="server" Interval="2500"></asp:Timer>
                </div>
            </center>
        </ContentTemplate>

    </asp:UpdatePanel>
    <section>
    </section>
    <br />
</asp:Content>
