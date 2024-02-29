using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FertilizerManagementSystem
{
    public partial class viewStock : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //CheckStock(e);

            //if (Session["role"] != null && Session["role"].Equals("Admin"))
            //{
                try
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        
                        Label label1 = (Label)e.Row.FindControl("Label1");

                        if (label1 != null && !string.IsNullOrEmpty(label1.Text))
                        {
                            int stock = Convert.ToInt32(label1.Text);

                            if (stock == 0)
                            {
                                e.Row.BackColor = System.Drawing.Color.Red;
                            }
                            else if (stock < 10)
                            {
                                e.Row.BackColor = System.Drawing.Color.Gold;
                            }

                        }
                    }
                    //else
                    //{

                    //}
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

    
}