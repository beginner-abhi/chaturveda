<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        table {
            width:100%;
        }
        table tr td {
            background-color:beige;
            border: .5px solid #000000;
            padding: 20px;
            /*margin-left:10px;*/
        }
        h5 {
        margin-left:0%;
        }
   
        Button {
        width:30px;
        }
      
    </style>
  <script type="text/javascript">
      function PrintGridData() {
          var prtGrid = document.getElementById('<%=gvProduct.ClientID %>');
          prtGrid.border = 2;

    var prtwin = window.open('','PrintGridViewData', 'left=300,top=300,right=500,bottom=500,width=1000,height=500');
   prtwin.document.write( prtGrid.outerHTML); 
//Prtwin.document.write('<' + 'html' + '><head><link href="cssreference" rel="stylesheet" type="text/css" /><link href="gridviewcssrefrence" rel="stylesheet" type="text/css" /></head><' + 'body style="background:none !important"' + '>');
Prtwin.document.write('<' + '/body' + '><' + '/html' + '>');
prtwin.document.close();
    prtwin.focus();
    prtwin.print();
    prtwin.close();
 
}
  </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="middle-container page-inner">
    <div class="container">
        <div class="row">
        
            <div class="col-lg-12 col-md-12">
                <div class="content-area">
<%-- <div class="page-title">   
<h1><asp:Label ID="Notice_title" runat="server" Text=" "></asp:Label></h1>
      </div>--%>

                 

     
    <%--<asp:Button ID="printButton" runat="server" Text="Print" OnClientClick="javascript:window.print();" cssClass="Button"/>--%>
     <asp:Button ID="Button1"  style="margin-left: -0.3%;" runat="server" Text="Print" OnClientClick="PrintGridData();"
          Font-Bold="True" Font-Size="14pt" Width="150px" Height="40px" BackColor="#CC0000" ForeColor="White" />  
   <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False">

            <Columns>

                <asp:TemplateField>
                    
           
                      <ItemTemplate>
                   <table>


                       <tr style="margin-left:10px">
                           
                           <td style="width:50%"> <img src="public/fadb15ab-31eb-419f-abe8-3517c5ec5829.jfif " alt="Image 1" CssClass="img"></td>
                           <td> <h5>चातुर्वेद-संस्कृतप्रचार-संस्थानम्</h5></td>
                       </tr>
                       <tr> 
                           <td style="width:90px">Name :</td>
                           <td>                              
          <%# Eval("User_name") %>
                           </td>
                       </tr>
                        <tr> 
                           <td >Father Name:</td>
                         
                           <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("father_name")%>' ></asp:Label></td>
                       </tr>
                        <tr> 
                          
                           <td>Mother Name:</td>
                           <td><asp:Label ID="Label3" runat="server" Text='<%# Bind("mother_name") %>' ></asp:Label></td>
                       </tr>
                        <tr> 
                          
                           <td>School :</td>
                           <td><asp:Label ID="Label4" runat="server" Text='<%# Bind("school_name") %>' ></asp:Label></td>
                       </tr>
                        <tr> 
                           <td>Address :</td>
                              <td><asp:Label ID="Label5" runat="server" Text='<%# Bind("Addres") %>' ></asp:Label></td>
                       </tr>

                  <tr> 
                         
                           <td>Mobile_No :</td>

                           <td> <asp:Label ID="Label6" runat="server" Text='<%# Bind("Mobile") %>' ></asp:Label></td>
                       </tr>
                            <tr> 
                           
                           <td>Whatsapp_No:</td>
                           <td><asp:Label ID="Label7" runat="server" Text='<%# Bind("whatsapp") %>' ></asp:Label></td>
                       </tr>
                        <tr>
                        
                           <td>Email :</td>
                           <td><asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>' ></asp:Label></td>
                </tr>
                   </table>
                    
                    </ItemTemplate>
                    <HeaderStyle Font-Size="15pt" />
                </asp:TemplateField>
       

   
            </Columns>
        </asp:GridView>

         </div>
                 </div>
             </div>
         </div>
             </div>
    <br>
    <br>
</asp:Content>

