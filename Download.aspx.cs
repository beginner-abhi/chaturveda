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
        DataTable dt = new DataTable();
        dt = vntIn[0];

        
        gvProduct.DataSource = dt;
        gvProduct.DataBind();
        if (dt != null && dt.Rows.Count > 0)
        {
            gvProduct.DataSource = dt;
            gvProduct.DataBind();

          // id.Text = dt.Rows[0]["idDetails"].ToString();
        }
    }
}





//protected void Page_Load(object sender, EventArgs e)
//{
//    Response.ContentType = "application/octet-stream";
//    Response.AppendHeader("Content-Disposition", "attachment; filename=logfile.txt");
//    Response.TransmitFile(Server.MapPath("~/wmtest.docx"));
//    Response.End();

//}



