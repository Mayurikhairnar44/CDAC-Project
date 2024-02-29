using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FertilizerManagementSystem
{
    public partial class Dashbord : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;

        //static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillSupplierValue();
            }

            GridView1.DataBind();
            
          
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(checkIfProductExists())
            {
                Response.Write("<script>alert('Product Already Exists, try some other Product ID');</script>");
            }
            else
            {
                addNewProduct();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateProductByID();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            deleteProductByID();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getProductByID();
        }


        // user defined functions
        void fillSupplierValue()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT supplier_name from supplier;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownSupplier.DataSource = dt;
                DropDownSupplier.DataValueField = "supplier_name";
                DropDownSupplier.DataBind();

               

            }
            catch (Exception ex)
            {

            }
        }

        bool checkIfProductExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Products where product_id='" + txtProID.Text.Trim() + "' OR product_name='" + txtProName.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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

        void addNewProduct()
        {
            try
            {

                string filepath = "~/Product/kkmLogo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Product/" + filename));
                filepath = "~/Product/" + filename;

                

                

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Products(product_id,product_name,category,supplier_name,form,arrival_date,mfg_date,expiry_date,Weight,sales_price,purchase_price,new_stock,total_stock,product_description,product_img_link) values(@product_id,@product_name,@category,@supplier_name,@form,@arrival_date,@mfg_date,@expiry_date,@Weight,@sales_price,@purchase_price,@new_stock,@total_stock,@product_description,@product_img_link)", con);

                cmd.Parameters.AddWithValue("@product_id", txtProID.Text.Trim());
                cmd.Parameters.AddWithValue("@product_name", txtProName.Text.Trim());
                cmd.Parameters.AddWithValue("@category", DropDownCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@supplier_name", DropDownSupplier.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@form", DropDownForm.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@arrival_date", txtArrivalDate.Text.Trim());
                cmd.Parameters.AddWithValue("@mfg_date", txtMFGDate.Text.Trim());
                cmd.Parameters.AddWithValue("@expiry_date", txtExpDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Weight", txtWeight.Text.Trim());
                cmd.Parameters.AddWithValue("@sales_price", txtSPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@purchase_price", txtPPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@new_stock", txtNewStock.Text.Trim());
                cmd.Parameters.AddWithValue("@total_stock", txtNewStock.Text.Trim());
                // cmd.Parameters.AddWithValue("@sold_stock", txtSoldStock.Text.Trim());
                cmd.Parameters.AddWithValue("@product_description", txtProductDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@product_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getProductByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Products WHERE product_id='" + txtProID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtProName.Text = dt.Rows[0]["product_name"].ToString();

                    DropDownCategory.SelectedValue = dt.Rows[0]["category"].ToString().Trim();
                    DropDownSupplier.SelectedValue = dt.Rows[0]["supplier_name"].ToString().Trim();
                    DropDownForm.SelectedValue = dt.Rows[0]["form"].ToString().Trim();

                    txtArrivalDate.Text = dt.Rows[0]["arrival_date"].ToString().Trim();
                    txtMFGDate.Text = dt.Rows[0]["mfg_date"].ToString().Trim();
                    txtExpDate.Text = dt.Rows[0]["expiry_date"].ToString().Trim();

                    txtWeight.Text = dt.Rows[0]["Weight"].ToString();

                    txtSPrice.Text = dt.Rows[0]["sales_price"].ToString();
                    txtPPrice.Text = dt.Rows[0]["purchase_price"].ToString();

                    
                    txtNewStock.Text =""; 
                      
                    txtTotalStock.Text= dt.Rows[0]["total_stock"].ToString().Trim();

                    txtProductDescription.Text = dt.Rows[0]["product_description"].ToString().Trim();
                    
                    global_filepath = dt.Rows[0]["product_img_link"].ToString();
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid Product ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void deleteProductByID()
        {
            if (checkIfProductExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Products WHERE product_id='" + txtProID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Product Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void updateProductByID()
        {

            if (checkIfProductExists())
            {
                try
                {

                    int new_stock = Convert.ToInt32(txtNewStock.Text.Trim());
                    int Total_stock = Convert.ToInt32(txtTotalStock.Text.Trim());

                    
                        
                        Total_stock = Total_stock + new_stock;
                            txtTotalStock.Text = "" + Total_stock;
                        
                    

                    string filepath = "~/Product/kkmLogo.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    
                   
                    
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("Product/" + filename));
                        filepath = "~/Product/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    
                    SqlCommand cmd = new SqlCommand("UPDATE Products set product_id=@product_id,product_name=@product_name,category=@category,supplier_name=@supplier_name,form=@form,arrival_date=@arrival_date,mfg_date=@mfg_date,expiry_date=@expiry_date,Weight=@Weight,sales_price=@sales_price,purchase_price=@purchase_price,new_stock=@new_stock,total_stock=@total_stock,product_description=@product_description,product_img_link=product_img_link where product_id='"+ txtProID.Text.Trim() + "'",con);
                    cmd.Parameters.AddWithValue("@product_id", txtProID.Text.Trim());
                    cmd.Parameters.AddWithValue("@product_name", txtProName.Text.Trim());
                    cmd.Parameters.AddWithValue("@category", DropDownCategory.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@supplier_name", DropDownSupplier.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@form", DropDownForm.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@arrival_date", txtArrivalDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@mfg_date", txtMFGDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@expiry_date", txtExpDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@Weight", txtWeight.Text.Trim());
                    cmd.Parameters.AddWithValue("@sales_price", txtSPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@purchase_price", txtPPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@new_stock", txtNewStock.Text.Trim());
                    cmd.Parameters.AddWithValue("@total_stock", Total_stock);
                    
                    cmd.Parameters.AddWithValue("@product_description", txtProductDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@product_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Product Updated Successfully');</script>");

                    txtNewStock.Text = "";

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }
    }
}