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
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                if (FarmerStatus()== "deactive")

                {
                    Response.Write("<script>alert('तुमचे खाते सक्रिय नाही. नवीन खाते तयार करा');</script>");
                }
                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("select * from SignUp where username='" + TxtUsername.Text.Trim() + "' AND password='" + TxtPassword.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Response.Write("<script>alert('लॉगिन यशस्वी');</script>");
                            Session["username"] = dr.GetValue(8).ToString();
                            Session["full_name"] = dr.GetValue(0).ToString();
                            Session["role"] = "user";
                            Session["status"] = dr.GetValue(10).ToString();
                        }
                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('अवैध क्रेडेन्शियल');</script>");
                    }
                }

               

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }


        private string FarmerStatus()
        {
            string userAccountStatus = "status";
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select account_status from SignUp where username='" + TxtUsername.Text + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dt = new DataTable();
                da.Fill(dt);

                userAccountStatus = dt.Rows[0][0].ToString();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            return userAccountStatus;
        }
    }
}