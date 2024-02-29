using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;


namespace FertilizerManagementSystem
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        DataTable dt = new DataTable();
        static int sentOTP = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {


            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from Admin where username='" + TxtUsername.Text.Trim() + "' AND password='" + TxtPassword.Text.Trim() + "' AND login_otp='" + TextBox1.Text + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Successful login');</script>");
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["full_name"] = dr.GetValue(2).ToString();

                        Session["role"] = "admin";
                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string selectUser = "select username from Admin where Email='" + TxtEmail.Text.Trim() + "'";
            SqlCommand cmd = new SqlCommand(selectUser, con);
            SqlDataReader read = cmd.ExecuteReader();
            if (read.Read())
            {
                con.Close();
                Random random = new Random();
                int myRandom = random.Next(10000000, 99999999);
                string loginOTP = myRandom.ToString();

                con.Open();
                string updateAcc = "update Admin set login_otp='" + loginOTP + "' where Email='" + TxtEmail.Text.Trim() + "'";
                SqlCommand cmdUpdate = new SqlCommand(updateAcc, con);
                cmdUpdate.ExecuteNonQuery();
                con.Close();

                MailMessage mail = new MailMessage();
                mail.To.Add(TxtEmail.Text.ToString());
                mail.From = new MailAddress("mayurikhairnar44@gmail.com");
                mail.Subject = "Kamdhenoo Kisan Mart - Verification Code";

                string emailBody = "";
                emailBody += "<h1>Hello User</h1>";
                emailBody += "<p>Login OTP : " + loginOTP + "</p>";
                emailBody += "Thank You(^_^)";

                mail.Body = emailBody;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new NetworkCredential("mayurikhairnar44@gmail.com", "wxud kyjl fxbd znmu");
                smtp.Send(mail);

                //TextBox1.Visible = true;
                Response.Write("<script>alert('Login OTP Sent Successfully');</script>");

            }
            else
            {
                Response.Write("<script>alert('Your Email is not registered(^_^)');</script>");
                con.Close();
            }
        }
    }
}