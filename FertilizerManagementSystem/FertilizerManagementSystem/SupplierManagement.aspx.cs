using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace FertilizerManagementSystem
{
    public partial class SupplierManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GrdSupplier.DataBind();
        }

        void getSupplierByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from supplier where supplier_id='" + txtSupplierId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtSupplierName.Text = dt.Rows[0][1].ToString();
                    TxtAddress.Text = dt.Rows[0][2].ToString();
                    TxtMobile.Text = dt.Rows[0][3].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Supplier ID');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void deleteSupplier()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from supplier WHERE supplier_id='" + txtSupplierId.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Supplier Deleted Successfully');</script>");
                clearForm();
                GrdSupplier.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateSupplier()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE Supplier SET supplier_name=@supplier_name, address=@address, mobile=@mobile_no WHERE supplier_id='" + txtSupplierId.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@supplier_name", txtSupplierName.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TxtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@mobile_no", TxtMobile.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Supplier Details Updated Successfully');</script>");
                clearForm();
                GrdSupplier.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewSupplier()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO supplier(supplier_id,supplier_name,address,mobile) values(@supplier_id,@supplier_name,@address,@mobile_no)", con);

                cmd.Parameters.AddWithValue("@supplier_id", txtSupplierId.Text.Trim());
                cmd.Parameters.AddWithValue("@supplier_name", txtSupplierName.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TxtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@mobile_no", TxtMobile.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Supplier added Successfully');</script>");
                clearForm();
                GrdSupplier.DataBind();//to get data
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfSupplierExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from supplier where supplier_id='" + txtSupplierId.Text.Trim() + "';", con);
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

        void clearForm()
        {
            txtSupplierId.Text = "";
            txtSupplierName.Text = "";
            TxtAddress.Text = "";
            TxtMobile.Text = "";
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfSupplierExists())
            {
                Response.Write("<script>alert('Supplier with this ID already Exist. You cannot add another Supplier with the same Supplier ID');</script>");
                clearForm();
            }
            else
            {
                addNewSupplier();
                clearForm();

            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (checkIfSupplierExists())
            {
                updateSupplier();
                clearForm();

            }
            else
            {
                Response.Write("<script>alert('Supplier does not exist');</script>");
                clearForm();
            }
            

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            if (checkIfSupplierExists() == true)
            {
                deleteSupplier();
                clearForm();

            }
            else
            {
                Response.Write("<script>alert('Supplier does not exist');</script>");
                clearForm();
            }
        }

        protected void BtnGo_Click(object sender, EventArgs e)
        {
            getSupplierByID();
        }
    }
}