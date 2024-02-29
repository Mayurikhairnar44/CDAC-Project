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
    public partial class CustomerPayment : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
                Response.Redirect("Login.aspx");
            }
        }

        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from signup where username='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtFullName.Text = dt.Rows[0]["full_name"].ToString();
                txtDOB.Text = dt.Rows[0]["dob"].ToString();
                txtContact.Text = dt.Rows[0]["contact_no"].ToString();
                txtEmail.Text = dt.Rows[0]["email"].ToString();
                DropDownState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                txtCity.Text = dt.Rows[0]["city"].ToString();
                txtPincode.Text = dt.Rows[0]["pincode"].ToString();
                txtAddress.Text = dt.Rows[0]["full_address"].ToString();
                txtUsername.Text = dt.Rows[0]["username"].ToString();
                txtOldPassword.Text = dt.Rows[0]["password"].ToString();

                Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-info");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void updateUserPersonalDetails()
        {
            string password = "";
            if (txtNewPassword.Text.Trim() == "")
            {
                password = txtOldPassword.Text.Trim();
            }
            else
            {
                password = txtNewPassword.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update SignUp set full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status WHERE username='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtPincode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('आपले तपशील यशस्वीरित्या अद्यतनित केले');</script>");
                    getUserPersonalDetails();
                    //getUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('चुकीची नोंद');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("login.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }
    }
}