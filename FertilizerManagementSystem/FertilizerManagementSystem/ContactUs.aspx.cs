using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FertilizerManagementSystem
{
    public partial class ContactUs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = TxtName.Text;
            string email = TxtEmail.Text;
            string subject = TxtSubject.Text;
            string message = TxtMessage.Text;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO ContactMessages(Name,Email,Subject,Message,SubmittedAt) values(@name,@email,@subject,@msg,@SubmittedAt)", con);
                cmd.Parameters.AddWithValue("@name", TxtName.Text);
                cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                cmd.Parameters.AddWithValue("@subject", TxtSubject.Text);
                cmd.Parameters.AddWithValue("@msg", TxtMessage.Text);
                cmd.Parameters.AddWithValue("@SubmittedAt",DateTime.Now);
                //Response.Write("<script>alert('hii');</script>");
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your message has been sent successfully. Thank you for contacting us!');</script>");
                //Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}