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
    public partial class Report : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string query = "";
                string parameterName = "";
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();

                //if (DropDownList1.SelectedValue == "Sold Product")
                //{
                query = "select * from purchased_product where purchased_date=@code";
                parameterName = "code";
                da.SelectCommand = new SqlCommand(query, con);
                da.SelectCommand.Parameters.AddWithValue(parameterName, txtDate.Text);
                da.Fill(dt);
                Reportlist.DataSource = dt;
                Reportlist.DataBind(); 

                //}
                //else if (DropDownList1.SelectedValue == "Purchased Product")
                //{
                //    query = "select * from products where date=@code";
                //    parameterName = "code";
                //    da.SelectCommand = new SqlCommand(query, con);
                //    da.SelectCommand.Parameters.AddWithValue(parameterName, TextBox1.Text);
                //    da.Fill(dt);
                //    GridView1.DataSource = dt;
                //    GridView1.DataBind();
                //}
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                SqlConnection con = new SqlConnection(strcon);
                // Close the connection in a finally block to ensure it's always closed, even if an exception occurs.
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }
    }
}