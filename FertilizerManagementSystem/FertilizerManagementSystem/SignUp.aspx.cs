using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FertilizerManagementSystem
{
    public partial class SignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // sign up button click event
        protected void btnsignUp_Click1(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {

                Response.Write("<script>alert('या वापरकर्तानावासह वापरकर्ता आधीपासूनच अस्तित्वात आहे, इतर वापरकर्तानाव वापरून पहा');</script>");
            }
            else
            {
                signUpNewMember();
                
            }
        }

        //User defined Methods

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from SignUp where username='" + txtUsername.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)//if found
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void signUpNewMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO SignUp(full_name,dob,contact_no,email," +
                    "state,city,pincode,full_address,username,password,account_status) " +
                    "values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@username,@password,@account_status)", con);
                cmd.Parameters.AddWithValue("@full_name", txtFullName.Text);
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
                cmd.Parameters.AddWithValue("@contact_no", txtContact.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@state", drpState.Text);
                cmd.Parameters.AddWithValue("@city", txtCity.Text);
                cmd.Parameters.AddWithValue("@pincode", txtPincode.Text);
                cmd.Parameters.AddWithValue("@full_address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('साइन अप यशस्वी. लॉगिन वर जा');</script>");
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}