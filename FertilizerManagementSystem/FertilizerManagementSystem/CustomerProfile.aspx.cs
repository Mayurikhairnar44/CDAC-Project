using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace FertilizerManagementSystem
{
    public partial class CutomerProfile : System.Web.UI.Page
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
                    getPendingProducts();

                    

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
                Response.Redirect("Login.aspx");
            }
        }


        // user defined function

        void getPendingProducts()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select product_name as 'उत्पादनाचे नांव',product_price as 'उत्पादन किंमत',remaining_amount as 'उर्वरित रक्कम',payment_status as 'पैसे भरल्याची स्थिती' from purchased_product where customer_id='" + Session["username"].ToString() + "'AND payment_status='Pending'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                cmd = new SqlCommand("select sum(remaining_amount) from purchased_product where customer_id='" + Session["username"].ToString() + "'AND payment_status='pending'; ", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                LabelRemainingPayment.Text = dt.Rows[0][0].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            Response.Redirect("PayNow.aspx");
        }
    }
}