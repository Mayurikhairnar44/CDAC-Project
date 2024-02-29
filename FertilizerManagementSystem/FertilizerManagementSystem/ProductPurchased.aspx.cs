using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace FertilizerManagementSystem
{
    public partial class ProductPurchased : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        Int64 grandTotal = 0;
        Int64 Amount;

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowProducts();
            if (!IsPostBack)
            {

                DataTable dt = new DataTable();

                DataColumn idColumn = new DataColumn("ID", typeof(int));
                idColumn.AutoIncrement = true;
                idColumn.AutoIncrementSeed = 1;
                idColumn.AutoIncrementStep = 1;
                dt.Columns.Add(idColumn);
                dt.Columns.Add(new DataColumn("Product Name"));
                dt.Columns.Add(new DataColumn("Product Price"));
                dt.Columns.Add(new DataColumn("Quantity"));
                dt.Columns.Add(new DataColumn("Date"));
                dt.Columns.Add(new DataColumn("Total"));

                ViewState["Bill"] = dt;

                this.BindGrid();
            }
        }

        private void ShowProducts()
        {
            string Query = "select * from Products where total_stock != 0";

            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(Query, strcon);
            sda.Fill(dt);
            productList.DataSource = dt;
            productList.DataBind();
        }
        protected void BindGrid()
        {
            billList.DataSource = ViewState["Bill"];
            billList.DataBind();
        }

        void getCustomerName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select full_name from SignUp WHERE username='" + txtCustomerId.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtCustomerName.Text = dt.Rows[0]["full_name"].ToString();
                    //txtRemainingAmount.Text = dt.Rows[0][9].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Customer ID');</script>");
                }

                //cmd = new SqlCommand("select sum(remaining_amount) from purchased_product WHERE customer_id='" + txtCustomerId.Text.Trim() + "'", con);
                //da = new SqlDataAdapter(cmd);
                //dt = new DataTable();
                //da.Fill(dt);
                //if(dt.Rows.Count >= 1)
                //{
                //    txtRemainingAmount.Text = dt.Rows[0][0].ToString();

                //}


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnRemainingAmount_Click(object sender, EventArgs e)

        {
            int amountPaid;
            int priceOfTheProduct = Convert.ToInt32(txtProductPrice.Text);
            int qty = Convert.ToInt32(txtQty.Text);
            int total = priceOfTheProduct * qty;

            if (txtAmountPaid.Text == "")
            {
                amountPaid = 0;
                txtRemainingAmount.Text = (total - amountPaid).ToString();
            }
            else
            {
                amountPaid = Convert.ToInt32(txtAmountPaid.Text);

                txtRemainingAmount.Text = (total - amountPaid).ToString();
            }




        }

        void clearForm()
        {
            txtCustomerId.Text = "";
            txtCustomerName.Text = "";
            txtProductName.Text = "";
            txtProductPrice.Text = "";
            txtDate.Text = "";
            txtQty.Text = "";
            txtAmountPaid.Text = "";
            txtRemainingAmount.Text = "";
        }

        protected void btnCustomerGo_Click(object sender, EventArgs e)
        {
            getCustomerName();

        }

        protected void productList_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtProductName.Text = productList.SelectedRow.Cells[1].Text;
            txtProductPrice.Text = productList.SelectedRow.Cells[7].Text;
        }

        private void purchaseProduct()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO purchased_product(customer_id,customer_name,product_name,product_price,amount_paid,purchased_date,payment_status,remaining_amount,quantity) values(@customer_id,@customer_name,@product_name,@product_price,@amount_paid,@purchased_date,@payment_status,@remaining_amount,@quantity)", con);

                cmd.Parameters.AddWithValue("@customer_id", txtCustomerId.Text.Trim());
                cmd.Parameters.AddWithValue("@customer_name", txtCustomerName.Text.Trim());
                cmd.Parameters.AddWithValue("@product_name", txtProductName.Text.Trim());
                cmd.Parameters.AddWithValue("@product_price", txtProductPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@amount_paid", txtAmountPaid.Text.Trim());
                cmd.Parameters.AddWithValue("@purchased_date", txtDate.Text.Trim());


                Int64 RemainingAmount = Convert.ToInt64(txtRemainingAmount.Text.Trim());

                if (RemainingAmount == 0)
                {
                    cmd.Parameters.AddWithValue("@payment_status", "done");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@payment_status", "pending");

                }


                if (txtRemainingAmount.Text == "")
                {
                    RemainingAmount = 0;
                    cmd.Parameters.AddWithValue("@remaining_amount", RemainingAmount);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@remaining_amount", RemainingAmount);
                }
                cmd.Parameters.AddWithValue("@quantity", txtQty.Text.Trim());

                Response.Write("<script>alert('Product Added To Bill!!!');</script>");
                cmd.ExecuteNonQuery();

                con.Close();

                //productList.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnAddToBill_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            Int64 TotalProductPrice;
            TotalProductPrice = Convert.ToInt64(txtProductPrice.Text.Trim()) * Convert.ToInt64(txtQty.Text.Trim());


            DataTable dt = (DataTable)ViewState["Bill"];
            int id = (int)dt.Rows.Count + 1;
            dt.Rows.Add(id,
                txtProductName.Text.Trim(),
                txtProductPrice.Text.Trim(),
                txtQty.Text.Trim(),
                txtDate.Text.Trim(),
                TotalProductPrice);
            ViewState["Bill"] = dt;
            this.BindGrid();

            //Updating stock
            con.Open();

            Int32 qty = Convert.ToInt32(txtQty.Text.Trim());
            SqlCommand cmd = new SqlCommand("update  products set total_stock = total_stock -'" + qty + "' WHERE product_name='" + txtProductName.Text.Trim() + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();
            ShowProducts();

            //grand total all products price
            grandTotal = 0;
            for (int i = 0; i < billList.Rows.Count; i++)
            {
                string Tot = billList.Rows[i].Cells[5].Text;
                grandTotal = grandTotal + Convert.ToInt64(Tot);
            }
            Amount = grandTotal;
            billTotal.Text = "Rs. " + grandTotal;

            //Previous Remaining Amount
            previousRemainingAmount();

            //Add To purchased_Product
            purchaseProduct();
            clearForm();
        }

        private void InsertBill()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO BillTable(bill_date,customer_name,amount) values(@bill_date,@customer_name,@amount)", con);

                cmd.Parameters.AddWithValue("@bill_date", txtDate.Text.Trim());
                cmd.Parameters.AddWithValue("@customer_name", txtCustomerName.Text.Trim());
                cmd.Parameters.AddWithValue("@amount", billTotal.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Write("<script>alert('Bill added successfully.');</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void previousRemainingAmount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select sum(remaining_amount) from purchased_product where customer_id='" + txtCustomerId.Text + "'AND payment_status='Pending';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dt = new DataTable();
                da.Fill(dt);

                priviousRemainingAmmount.Text = dt.Rows[0][0].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }


        protected void btnPrintBill_Click(object sender, EventArgs e)
        {
            InsertBill();

        }
    }
}