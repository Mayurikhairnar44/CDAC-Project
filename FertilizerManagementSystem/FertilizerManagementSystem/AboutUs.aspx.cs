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
    public partial class AboutUs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Feedback(Message,Name,Email) values(@msg,@name,@email)", con);
                cmd.Parameters.AddWithValue("@msg", TxtMsg.Text);
                cmd.Parameters.AddWithValue("@name", TxtName.Text);
                cmd.Parameters.AddWithValue("@email", TextEmail.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Feedback sent! Thank you for sharing your thoughts with us!');</script>");
                //Response.Redirect("Login.aspx");
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            TxtMsg.Text = "";
            TxtName.Text = "";
            TextEmail.Text = "";
        }
    }
}