using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Resources; //import following Namespace first  
using System.Globalization; //import following Namespace first  
using System.Threading; //import following Namespace first  
using System.Reflection; //

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = Application["TotalOnlineUsers"].ToString(); 
    }

    //protected void ddLang_SelectedIndexChanged(object sender, EventArgs e) //this event for showing selected language.  
    //{
    //    Session["Lang"] = ddLang.SelectedValue;
    //    //LoadString();
    //}  
}
