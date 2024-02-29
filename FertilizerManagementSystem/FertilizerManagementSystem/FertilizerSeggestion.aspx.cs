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
    public partial class FertiliserSeggetion : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string query = "SELECT WorkNeed,Local,Export FROM FertilizerSuggesion WHERE Id=@SelectedIndex";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@SelectedIndex", (DropDownList1.SelectedIndex + 1));

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                }
                else
                {
                    // Displaying a Marathi message for no records found
                    Response.Write("<script>alert('अवैध निवड');</script>");
                    //Response.Write("<script>alert('"+DropDownList1.SelectedIndex+"');</script>");
                }
            }
            catch (Exception ex)
            {
                // Displaying a Marathi error message in case of an exception
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        Image img = (Image)e.Row.Cells[4].Controls[0];
        //        byte[] bytes = (byte[])DataBinder.Eval(e.Row.DataItem, "image");
        //        string base64String = Convert.ToBase64String(bytes);
        //        img.ImageUrl = "data:image/png;base64," + base64String;
        //    }
        //}
    }
}