using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Security;
using Connection_Sanskrit;
using Interface_sanskrit;
using Sanskrit_files;


public partial class Default3 : System.Web.UI.Page
{
    dynamic vntIn = null;
    dynamic vntErrorInfo = null;
    dynamic vntToken = null;
    MySqlDataAdapter sda = null;
    DataTable abhishetrab = null;

    string connectionString = get_conncet.ConnectionStringBuilder();
    //BLL_UserRegistration objBLL_UserRegistration = new BLL_UserRegistration();
    // string connectionString = "Server=localhost, Database = formapply, UserId=root, Password= space@007";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Id"] != null)
            {
                int noticeID = Convert.ToInt32(Request.QueryString["ID"]);
            }
            //Response.ContentType = "application/octet-stream";
            //Response.AppendHeader("Content-Disposition", "attachment; filename=logfile.txt");
            //Response.TransmitFile(Server.MapPath("form.aspx"));
            //Response.End();
            ClearForm();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        savereg();
    }
    public void savereg()
    {
        try
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmdCheck = new MySqlCommand("privacy_mobile", sqlCon);
                sqlCmdCheck.CommandType = CommandType.StoredProcedure;
                sqlCmdCheck.Parameters.AddWithValue("mobile", txtMobileNumber.Text);
                sqlCmdCheck.Parameters.AddWithValue("mail", TextBox4.Text);
                sqlCmdCheck.Parameters.AddWithValue("Wp", TextBox3.Text);

                MySqlDataAdapter sda = new MySqlDataAdapter(sqlCmdCheck);
                DataTable dtCheck = new DataTable();
                sda.Fill(dtCheck);

                bool mobileExists = false;
                bool mailExists = false;
                bool WpExists = false;

                if (dtCheck != null && dtCheck.Rows.Count > 0)
                {
                    foreach (DataRow row in dtCheck.Rows)
                    {
                        if (row["Mobile"].ToString() == txtMobileNumber.Text)
                        {
                            mobileExists = true;
                        }
                        if (row["Email"].ToString() == TextBox4.Text)
                        {
                            mailExists = true;
                        }
                        if (row["whatsapp"].ToString() == TextBox3.Text)
                        {
                            WpExists = true;
                        }
                    }
                }

                if (mobileExists)
                {
                    lblMessage.Text = "Mobile number already exists!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else if (mailExists)
                {
                    lblMessage.Text = "Email already exists!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else if (WpExists)
                {
                    lblMessage.Text = "WhatsApp number already exists!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    MySqlCommand sqlCmd = new MySqlCommand("Competition", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("user", txtFirstName.Text);
                    sqlCmd.Parameters.AddWithValue("father", txtLastName.Text);
                    sqlCmd.Parameters.AddWithValue("mother", TextBox1.Text);
                    sqlCmd.Parameters.AddWithValue("school", TextBox2.Text);
                    sqlCmd.Parameters.AddWithValue("addres", txtAddress.Text);
                    sqlCmd.Parameters.AddWithValue("Mob", txtMobileNumber.Text);
                    sqlCmd.Parameters.AddWithValue("Wp", TextBox3.Text);
                    sqlCmd.Parameters.AddWithValue("mail", TextBox4.Text);

                    sqlCmd.ExecuteNonQuery();
                    int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                    ClearForm();
                    lblMessage.Text = "Data saved successfully";

                    Response.Redirect("Download.aspx?id=" + count);
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    //public void btnReprint_Click(object sender, EventArgs e)
    //{

    //    using (MySqlConnection sqlCo = new MySqlConnection(connectionString))
    //    {
    //        sqlCo.Open();
    //        MySqlCommand sqlCm = new MySqlCommand("RetrieveRegistration", sqlCo);
    //        sqlCm.CommandType = CommandType.StoredProcedure;
    //        // Add parameters

    //        sqlCm.Parameters.AddWithValue("mail",txtEmailOrMobile.Text);
    //        MySqlDataAdapter sda = new MySqlDataAdapter(sqlCm);
    //        DataTable abhishetrab = new DataTable();
    //        sda.Fill(abhishetrab);
    //        savereg();
    //        // Bind the retrieved data to GridView
    //        //gvProduct.DataSource = dt;
    //        //gvProduct.DataBind();
    //    }
    //}

    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        using (MySqlConnection sqlCo = new MySqlConnection(connectionString))
    //        {
    //            sqlCo.Open();
    //            MySqlCommand sqlCm = new MySqlCommand("privacy_mobile", sqlCo);
    //            sqlCm.CommandType = CommandType.StoredProcedure;
    //            // Add parameters
    //            sqlCm.Parameters.AddWithValue("mobile", txtMobileNumber.Text);
    //            sqlCm.Parameters.AddWithValue("mail", TextBox4.Text);
    //            sqlCm.Parameters.AddWithValue("Wp", TextBox3.Text);
    //            MySqlDataAdapter sda = new MySqlDataAdapter(sqlCm);
    //            DataTable abhishetrab = new DataTable();
    //            sda.Fill(abhishetrab);

    //            bool mobileExists = false;
    //            bool mailExists = false;
    //            bool WpExists = false;
    //            if (abhishetrab != null && abhishetrab.Rows.Count > 0)
    //            {
    //                foreach (DataRow row in abhishetrab.Rows)
    //                {
    //                    if (row["Mobile"].ToString() == txtMobileNumber.Text)
    //                    {
    //                        mobileExists = true;
    //                    }
    //                    if (row["Email"].ToString() == TextBox4.Text)
    //                    {
    //                        mailExists = true;
    //                    }
    //                    if (row["whatsapp"].ToString() == TextBox3.Text)
    //                    {
    //                        WpExists = true;
    //                    }
    //                }
    //            }

    //            if (mobileExists)
    //            {
    //                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mobile no. is exist!')", true);
    //            }
    //            else if (mailExists)
    //            {
    //                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('E-mail is exist!')", true);
    //            }
    //            else if (WpExists)
    //            {
    //                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('WhatsApp no. is exist!')", true);
    //            }
    //            else
    //            {
    //                savereg();
    //            }
    //        }
    //    }

    //    catch (Exception ex)
    //    {
    //        lblMessage.Text = ex.Message;
    //        lblMessage.ForeColor = System.Drawing.Color.Red;
    //    }
    //}

    //public void savereg()
    //{
    //    using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
    //    {
    //        sqlCon.Open();
    //        MySqlCommand sqlCmd = new MySqlCommand("Competition", sqlCon);
    //        sqlCmd.CommandType = CommandType.StoredProcedure;
    //        // sqlCmd.Parameters.AddWithValue("id",ID_det.Value);
    //        sqlCmd.Parameters.AddWithValue("user", txtFirstName.Text);
    //        sqlCmd.Parameters.AddWithValue("father", txtLastName.Text);
    //        sqlCmd.Parameters.AddWithValue("mother", TextBox1.Text);
    //        sqlCmd.Parameters.AddWithValue("school", TextBox2.Text);
    //        sqlCmd.Parameters.AddWithValue("addres", txtAddress.Text);
    //        sqlCmd.Parameters.AddWithValue("Mob", txtMobileNumber.Text);
    //        sqlCmd.Parameters.AddWithValue("Wp", TextBox3.Text);
    //        sqlCmd.Parameters.AddWithValue("mail", TextBox4.Text);
    //        sqlCmd.ExecuteNonQuery();
    //        int count;
    //        count = (int)sqlCmd.ExecuteScalar();
    //        ClearForm();
    //        lblMessage.Text = "Data saved successfully";

    //        Response.Redirect("Download.aspx?id=" + count + "");
    //    }
    //}

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    void ClearForm()
    {
        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        txtMobileNumber.Text = string.Empty;
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;
        TextBox4.Text = string.Empty;

        //ddlGender.SelectedIndex = -1;
        txtAddress.Text = string.Empty;

        //txtUserName.Text = string.Empty;
        //txtPassword.Text = string.Empty;
        //txtConfirmPassword.Text = string.Empty;
        lblMessage.Text = string.Empty;
    }

}

