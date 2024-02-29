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
    public partial class StockManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView1.DataBind();
        }


        //user defined
        

        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from SignUp where username='" + txtCustomerID.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtFullName.Text = dr.GetValue(0).ToString();
                        txtDob.Text = dr.GetValue(1).ToString();
                        txtContact.Text = dr.GetValue(2).ToString();
                        txtEmail.Text = dr.GetValue(3).ToString();
                        //txtState.Text = dr.GetValue(4).ToString();
                        //txtCity.Text = dr.GetValue(5).ToString();
                        //txtPinCode.Text = dr.GetValue(6).ToString();
                        txtAddress.Text = dr.GetValue(7).ToString();
                        txtAccountStatus.Text = dr.GetValue(10).ToString();
                    }

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


        void deleteCustomerByID()
        {
            
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from SignUp WHERE username='" + txtCustomerID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Customer Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

        }

        void updateCustomerStatusById(string status)
        {

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("update SignUp set account_status='" + status + "' where username='" + txtCustomerID.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();

                   

                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Customer Status Updated');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            

        }

        void clearForm()
        {
            txtCustomerID.Text = "";
            txtFullName.Text = "";
            txtContact.Text = "";
            txtDob.Text = "";
            txtEmail.Text = "";
            //txtState.Text = "";
            //txtPinCode.Text = "";
            txtAddress.Text = "";
            //txtCity.Text = "";
            
        }

        protected void linkBtnGO_Click(object sender, EventArgs e)
        {
            getMemberByID();
            txtRemaining.Text = previousRemainingAmount();
        }

        protected void linkBtnActive_Click(object sender, EventArgs e)
        {
            updateCustomerStatusById("active");
        }

        protected void linkBtnPending_Click(object sender, EventArgs e)
        {
            updateCustomerStatusById("pending");
        }

        protected void linkBtnDeactive_Click(object sender, EventArgs e)
        {
            updateCustomerStatusById("deactive");
        }

        protected void BtnDeleteUser_Click(object sender, EventArgs e)
        {
            deleteCustomerByID();
        }


        //Account Status
        protected void btnUpdateAccountStatus_Click(object sender, EventArgs e)
        {

            //Response.Write("Heloo11");

            try
            {
                //Response.Write("Heloo1");

                string query;
                string previousRemainingTotalAmount = previousRemainingAmount();

                try
                {
                    Int64 previousTotalAmount = Convert.ToInt64(previousRemainingTotalAmount);
                    Int64 paidAmount = Convert.ToInt64(txtPaidAmount.Text);

                    // Calculate new remaining amount
                    if (paidAmount == previousTotalAmount)
                    {
                        query = "UPDATE purchased_product SET remaining_amount = @NewRemainingAmount,payment_status=@payment_status WHERE customer_id = @CustomerID and payment_status='pending'";

                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();

                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.Parameters.AddWithValue("@CustomerID", txtCustomerID.Text.Trim());
                                cmd.Parameters.AddWithValue("@NewRemainingAmount", 0);
                                cmd.Parameters.AddWithValue("@payment_status", "done");


                                cmd.ExecuteNonQuery();

                                Response.Write("<script>alert('Customer Payment Status Updated');</script>");
                            }
                            con.Close();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Pay Whole Amount');</script>");

                    }
                }
                catch (Exception ex)
                {
                    // Handle any exceptions
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }


                //Response.Write("hii");

                //if (paidAmount== privioustotalAmount)
                //{
                //    Response.Write("1");

                //    // Ensure the remaining amount doesn't go below zero
                //    if (newRemainingAmount < 0)
                //    {
                //        newRemainingAmount = 0;
                //    }
                //    query = "UPDATE purchased_product SET payment_status = @PaymentStatus,remaining_ammount =@paidAmount WHERE customer_id = @CustomerID";
                //    cmd = new SqlCommand(query, con);
                //    Response.Write("me");

                //    cmd.Parameters.AddWithValue("@PaymentStatus", DropDownPaymentStatus.Text);
                //    cmd.Parameters.AddWithValue("@CustomerID", txtCustomerID.Text.Trim());
                //    cmd.Parameters.AddWithValue("@paidAmount", newRemainingAmount);
                //    Response.Write("me");

                //    int rowsAffected = cmd.ExecuteNonQuery();

                //    if (rowsAffected > 0)
                //    {
                //        // Update successful
                //        Response.Write("<script>alert('Customer Payment Status Updated');</script>");
                //    }
                //    else
                //    {
                //        // No rows affected, update may not have occurred
                //        Response.Write("<script>alert('No rows affected');</script>");
                //    }

                //   // Response.Write("<script>alert('Customer Payment Status Updated');</script>");
                //}
                //else
                //{
                //    Response.Write("2");

                //    query = "UPDATE purchased_product SET payment_status = @PaymentStatus, remaining_ammount=0 WHERE customer_id = @CustomerID and purchased_date = @purchaseDate and payment_status='pending'";
                //    cmd = new SqlCommand(query, con);
                //    cmd.Parameters.AddWithValue("@PaymentStatus", DropDownPaymentStatus.Text);
                //    cmd.Parameters.AddWithValue("@CustomerID", txtCustomerID.Text.Trim());
                //    cmd.Parameters.AddWithValue("@purchaseDate", txtPaymentDate.Text.Trim());
                //    //cmd.Parameters.AddWithValue("@amountpaid", paidAmount);
                //    cmd.ExecuteNonQuery();
                //    Response.Write("<script>alert('Customer Payment Status Updated');</script>");

                //}


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }


        private string previousRemainingAmount()
        {
            string priviousRemainingAmmount = "0";
            try
            {
               
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select sum(remaining_amount) from purchased_product where customer_id='" + txtCustomerID.Text + "'AND payment_status='pending'; ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dt = new DataTable();
                da.Fill(dt);

                 priviousRemainingAmmount = dt.Rows[0][0].ToString();

               

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            return priviousRemainingAmmount;
        }
    }
}