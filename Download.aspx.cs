using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.Security;
using Connection_Sanskrit;
using Interface_sanskrit;
using Sanskrit_files;

public partial class _Default : System.Web.UI.Page
{

    dynamic vntIn = null;
    dynamic vntErrorInfo = null;
    dynamic vntToken = null;
    MySqlDataAdapter sda = null;
    DataTable abhishetrab = null;
    string connectionString = get_conncet.ConnectionStringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["id"]))
        {
            int m = Int32.Parse(Request.QueryString["id"]);

        }
        //ClientScript.RegisterStartupScript(Page.GetType(), "vPrint", "window.print();", true);
        grid();
    }

    public void grid()
    {
        vntIn = new object[1];
        vntIn[0] = (Request.QueryString["id"]);


        IGet objIread = null;

        objIread = new View_Form();
        int _retVal = objIread.GetData(vntToken, ref vntIn, ref vntErrorInfo);
        DataTable abhishetrab = new DataTable();
        abhishetrab = vntIn[0];


        gvProduct.DataSource = abhishetrab;
        gvProduct.DataBind();
        if (abhishetrab != null && abhishetrab.Rows.Count > 0)
        {
            gvProduct.DataSource = abhishetrab;
            gvProduct.DataBind();

            // id.Text = dt.Rows[0]["idDetails"].ToString();
        }

    }


    public void btnReprint_Click(object sender, EventArgs e)
    {
        string mail = txtEmailOrMobile.Text.Trim();

        // Call the stored procedure
        DataTable abhishetrab = GetRegistrationDetailsByEmailOrMobile(mail);

        // Bind the retrieved data to GridView
        gvProduct.DataSource = abhishetrab;
        gvProduct.DataBind();
    }


private DataTable GetRegistrationDetailsByEmailOrMobile(string emailOrMobile)
{
    DataTable abhishetrab = new DataTable();

    using (MySqlConnection conn = new MySqlConnection(connectionString))
    {
        using (MySqlCommand cmd = new MySqlCommand("RetrieveRegistration", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;

            // Add parameter
            cmd.Parameters.AddWithValue("mail", emailOrMobile);

            // Open connection and execute command
            conn.Open();
            using (MySqlDataReader rdr = cmd.ExecuteReader())
            {
                abhishetrab.Load(rdr); // Load data into DataTable
            }
        }
    }

    return abhishetrab;
}
}









//<asp:TextBox ID="txtEmailOrMobile" runat="server" placeholder="Enter Email or Mobile Number"></asp:TextBox>
//<asp:Button ID="btnReprint" runat="server" Text="Reprint Registration" OnClick="btnReprint_Click" CssClass="btn btn-primary" />

//protected void btnReprint_Click(object sender, EventArgs e)
//{
//    string emailOrMobile = txtEmailOrMobile.Text.Trim();
//    // Call a method to fetch data based on email or mobile number
//    grid(emailOrMobile);
//}

//public void grid(string emailOrMobile)
//{
//    vntIn = new object[1];
//    vntIn[0] = emailOrMobile; // Pass email or mobile number to fetch data

//    IGet objIread = new View_Form();
//    int _retVal = objIread.GetData(vntToken, ref vntIn, ref vntErrorInfo);
//    DataTable dt = vntIn[0];

//    gvProduct.DataSource = dt;
//    gvProduct.DataBind();
//}

//function PrintPanel() {
//    var panel = document.getElementById("<%=pnlContents.ClientID %>");
//    var printWindow = window.open('', '', 'height=400,width=800');
//    printWindow.document.write('<html><head><title>DIV Contents</title> <style> table tr td {border: 1px solid #000000;}</style>');
//    printWindow.document.write('</head><body >');
//    printWindow.document.write(panel.innerHTML);
//    printWindow.document.write('</body></html>');
//    printWindow.document.close();
//    setTimeout(function () {
//        printWindow.print();
//    }, 500);
//    return false;
//}

//2nd
//public void grid(string emailOrMobile)
//{
//    vntIn = new object[1];
//    vntIn[0] = emailOrMobile;

//    IGet objIread = new View_Form();
//    int _retVal = objIread.GetData(vntToken, ref vntIn, ref vntErrorInfo);
//    DataTable dt = vntIn[0];

//    gvProduct.DataSource = dt;
//    gvProduct.DataBind();
//}

//protected void btnReprint_Click(object sender, EventArgs e)
//{
//    string emailOrMobile = txtEmailOrMobile.Text.Trim();
//    grid(emailOrMobile); // Call grid method to fetch data
//}



