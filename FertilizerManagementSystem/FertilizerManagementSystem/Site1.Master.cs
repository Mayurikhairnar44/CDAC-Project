using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FertilizerManagementSystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] != null && Session["role"].Equals(""))
                {
                    linkBtnLogin.Visible = true;//User Login
                    linkBtnSignUp.Visible = true;//Sign Up

                    linkBtnLogOut.Visible = false;
                    linkBtnHelloUser.Visible = false;



                    LinkBtnAdminLogin.Visible = true;

                    
                    LinkBtnProductInventory.Visible = false;
                    LinkBtnSupplierManagement.Visible = false;
                    LinkBtnProductPurchased.Visible = false;
                    LinkBtnMemberManagement.Visible = false;
                    LinkBtnReport.Visible = false;
                }
                else if (Session["role"] != null && Session["role"].Equals("user"))
                {

                    linkBtnLogin.Visible = false;//User Liogin
                    linkBtnSignUp.Visible = false;//Sign Up
                    linkBtnGrapeInfo.Visible = true;//fertilizer Suggestion


                    linkBtnLogOut.Visible = true;
                    linkBtnHelloUser.Visible = true;
                    linkBtnHelloUser.Text= Session["full_name"].ToString()+ "'s प्रोफाइल";



                    LinkBtnAdminLogin.Visible = true;


                    LinkBtnProductInventory.Visible = false;
                    LinkBtnSupplierManagement.Visible = false;
                    LinkBtnProductPurchased.Visible = false;
                    LinkBtnMemberManagement.Visible = false;
                    LinkBtnReport.Visible = false;
                }
                else if (Session["role"] != null && Session["role"].Equals("admin"))
                {

                    linkBtnLogin.Visible = false;//User Login
                    linkBtnSignUp.Visible = false;//Sign Up

                    linkBtnLogOut.Visible = true;
                    linkBtnHelloUser.Visible = true;
                    linkBtnHelloUser.Text = "Hello Admin";



                    LinkBtnAdminLogin.Visible = false;


                    LinkBtnProductInventory.Visible = true;
                    LinkBtnSupplierManagement.Visible = true;
                    LinkBtnProductPurchased.Visible = true;
                    LinkBtnMemberManagement.Visible = true;
                    LinkBtnReport.Visible = true;
                    linkBtnGrapeInfo.Visible = true;
                    LinkBtnAdminCotactUs.Visible = true;
                    LinkBtnFeedback.Visible = true;
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        protected void LinkBtnProductInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        
        protected void linkBtnLogin_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("Login.aspx");
            

        }
        protected void linkBtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void linkBtnViewStock_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewStock.aspx");
        }

        protected void LinkBtnSupplierManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupplierManagement.aspx");
        }

        

        protected void LinkBtnCustomerManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerManagement.aspx");
        }

        protected void LinkBtnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void LinkBtnProductPurchased_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductPurchased.aspx");
        }

        protected void linkBtnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("home.aspx");

            linkBtnLogin.Visible = true;//User Login
            linkBtnSignUp.Visible = true;//Sign Up

            linkBtnLogOut.Visible = false;
            linkBtnHelloUser.Visible = false;



            LinkBtnAdminLogin.Visible = true;


            LinkBtnProductInventory.Visible = false;
            LinkBtnSupplierManagement.Visible = false;
            LinkBtnProductPurchased.Visible = false;
            LinkBtnMemberManagement.Visible = false;
            LinkBtnReport.Visible = false;
            LinkBtnAdminCotactUs.Visible = false;
            linkBtnGrapeInfo.Visible = false;

        }

        protected void linkBtnHelloUser_Click(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].Equals("user"))
                Response.Redirect("CustomerProfile.aspx");

            else
                Response.Redirect("home.aspx");
        }

        protected void LinkBtnReport_Click(object sender, EventArgs e)
        {
        
                Response.Redirect("Report.aspx");

        }

        protected void btnContactUS_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactUs.aspx");

        }

        protected void linkBtnGrapeInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("FertilizerSeggestion.aspx");

        }

        protected void LinkBtnAdminCotactUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminContactUs.aspx");

        }

        protected void btnAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");

        }

        protected void LinkBtnFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Review.aspx");
        }
    }
}