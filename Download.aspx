<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        table {
            width: 100%;
        }

            table tr td {
                background-color: beige;
                border: .1px solid #000000;
                padding: 7px;
                /*margin-left:10px;*/
            }

        h5 {
            margin-left: 0%;
        }

        Button {
            width: 30px;
        }

        gridview {
            width: 100%;
            height: 100%;
        }

        img {
            -webkit-print-color-adjust: exact;
        }
    </style>
   

<%--    <script type="text/javascript">
        function getPrint(printArea) {
            var pp = window.open()
            pp.document.writeln('<HTML><HEAD><title>Registration Slip</title>   </HEAD><body>');
            pp.document.writeln(document.getElementById(printArea).innerHTML);
            pp.document.writeln('</body></HTML>');
            pp.print();
        }
    </script>--%>

    <script type = "text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title> <style> table tr td {border: 1px solid #000000;}</style>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="middle-container page-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
               
                             <asp:TextBox ID="txtEmailOrMobile" runat="server" placeholder="Enter Resistered Email"></asp:TextBox>
           <a href="<%# "Download.aspx?id="+Eval("idDetails") %>">
          <asp:Button ID="btnReprint" runat="server" Text="Reprint Registration" OnClick="btnReprint_Click" CssClass="btn btn-primary" />
</a>
                                           <%--  <a onclick="getPrint(&#39;PrintForm&#39;); return false;" id="ctl00_ContentPlaceHolder1_lnkPrint" class="btn btn-success pull-right" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$lnkPrint&#39;,&#39;&#39;)"><i class="fa fa-print"></i>&nbsp;Print Receipt</a>--%>
                    <br>
                         <asp:Button ID="btnPrint" runat="server" Text="Print Receipt" OnClientClick = "return PrintPanel()"  class="btn btn-success pull-right"/>
                        
                     <asp:Panel id="pnlContents" runat = "server">
                        <asp:GridView ID="gvProduct" runat="server" ShowHeader="false" AutoGenerateColumns="False" Width="700px"  CssClass="gridview">

                            <Columns>

                                <asp:TemplateField>


                                    <ItemTemplate>
                                        <div id="PrintForm">
                                            <table style="width:700px";>


                                                <tr style="margin-left: 10px">


                                                    <td style="width: 20%">
                                                        <img src="public/fadb15ab-31eb-419f-abe8-3517c5ec5829.png" alt="Image 1" style="width:100px;" class="img"></td>
                                                    <td>
                                                        <h5 style="margin-bottom:10px">चातुर्वेद-संस्कृतप्रचार-संस्थानम्</h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Enrollment Id:</td>
                                                    <td><%# Eval("idDetails") %> </td>
                                                </tr>
                                                <tr>
                                                    <td>Name :</td>
                                                    <td>
                                                        <%# Eval("User_name") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Father Name:</td>

                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("father_name")%>'></asp:Label></td>
                                                </tr>
                                                <tr>

                                                    <td>Mother Name:</td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("mother_name") %>'></asp:Label></td>
                                                </tr>
                                                <tr>

                                                    <td>School :</td>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("school_name") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Address :</td>
                                                    <td>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Addres") %>'></asp:Label></td>
                                                </tr>

                                                <tr>

                                                    <td>Mobile_No :</td>

                                                    <td>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label></td>
                                                </tr>
                                                <tr>

                                                    <td>Whatsapp_No:</td>
                                                    <td>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("whatsapp") %>'></asp:Label></td>
                                                </tr>
                                                <tr>

                                                    <td>Email :</td>
                                                    <td>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="15pt" />
                                </asp:TemplateField>



                            </Columns>
                        </asp:GridView>
                             </asp:Panel>
                   
                </div>
            </div>
        </div>
    </div>

    <br>
    <br>
</asp:Content>

