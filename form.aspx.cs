﻿using System;
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
        try
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("Competition", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                // sqlCmd.Parameters.AddWithValue("id",ID_det.Value);
                sqlCmd.Parameters.AddWithValue("user", txtFirstName.Text);
                sqlCmd.Parameters.AddWithValue("father", txtLastName.Text);
                sqlCmd.Parameters.AddWithValue("mother", TextBox1.Text);
                sqlCmd.Parameters.AddWithValue("school", TextBox2.Text);
                sqlCmd.Parameters.AddWithValue("addres", txtAddress.Text);
                sqlCmd.Parameters.AddWithValue("Mob", txtMobileNumber.Text);
                sqlCmd.Parameters.AddWithValue("Wp", TextBox3.Text);
                sqlCmd.Parameters.AddWithValue("mail", TextBox4.Text);
               int count;
                count=(int)sqlCmd.ExecuteScalar();
                

                ClearForm();
                lblMessage.Text = "Data saved successfully";

                Response.Redirect("Download.aspx?id="+count+"");

            }

        }

        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

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
