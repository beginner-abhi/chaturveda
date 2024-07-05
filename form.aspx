<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        .txtBox {
            font-family: Arial, Sans-Serif;
            border-collapse: collapse;
            border-width: 2px;
            border-color: gray;
            padding: 5px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .lable {
        padding-top:4px;
        margin:8px;
        }
        .button {
        width:70px;
        height:35px;
        }
    </style>
}
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="gallery-item">
      <img src="Header%20Brown%20Band.png"  alt="Image 1">
    </div> 
      <div>
          <asp:HiddenField ID="ID_det" runat="server" /> `
    <asp:Table ID="tblUserRegistration" runat="server" BorderColor="Black" BorderWidth="1" BorderStyle="Solid" HorizontalAlign="Center" CssClass="table table-striped table-hover">
        <asp:TableHeaderRow >
            <asp:TableHeaderCell ColumnSpan="2" cssClass="lable" >
                <asp:Label ID="tblHeader" runat="server" Text="भारतीय वैभवज्ञान परीक्षा २०२४" Font-Bold="true"  ></asp:Label>
                <hr />
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow >
            <asp:TableCell>
                <asp:Label ID="lblFirstName" runat="server" Text="आवेदक-नाम" Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="txtBox" BorderStyle="Groove"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ForeColor="Red"
                    ErrorMessage="नाम दर्ज करें." SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLastName" runat="server" Text="पितृ-नाम" Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="txtBox" BorderStyle="Groove"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red"
                    ErrorMessage="पितृ-नाम दर्ज करें " SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>               
            </asp:TableCell>
  </asp:TableRow>
       <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text="मातृ-नाम" Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txtBox" BorderStyle="Groove"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red"
                    ErrorMessage=" मातृ-नाम" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>               
            </asp:TableCell>
        </asp:TableRow>
      
  <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label2" runat="server" Text="विद्यालय-नाम" Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="txtBox" BorderStyle="Groove"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red"
                    ErrorMessage=" विद्यालय-नाम दर्ज करें" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>               
            </asp:TableCell>
        </asp:TableRow>
      <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label3" runat="server" Text=" कक्षा" Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DropDownList2" runat="server" BorderStyle="Groove">
                    <asp:ListItem Text="वर्ग/स्तर- (चयन करें)" Value="Select Gender" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="बालवर्ग  (कक्षा ३- ५ तक)" Value="kid"></asp:ListItem>
                    <asp:ListItem Text="कनिष्ठवर्ग (कक्षा ६-८ तक)" Value="young"></asp:ListItem>
                    <asp:ListItem Text="वरिष्ठवर्ग (कक्षा ९-१२ तक)" Value="old"></asp:ListItem>
                    <asp:ListItem Text="स्नातकवर्ग (बी.ए., एम.ए. शास्त्री-आचार्य, व अन्य)" Value="graduate"></asp:ListItem>
                 
                </asp:DropDownList>
               
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddress" runat="server" Text="पता" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="txtBox"  BorderStyle="Groove"></asp:TextBox>                
            </asp:TableCell>
        </asp:TableRow> 
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMobileNumber" runat="server" Text="मोबाइल नंबर" Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="txtBox" BorderStyle="Groove"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ControlToValidate="txtMobileNumber" Display="Dynamic" ForeColor="Red"
                    ErrorMessage="मोबाइल नंबर दर्ज करें" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text="ह्वाट्सेप नं." Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="txtBox" BorderStyle="Groove"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMobileNumber" Display="Dynamic" ForeColor="Red"
                    ErrorMessage="ह्वाट्सेप नं. दर्ज करें" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
              <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="ईमेल" Font-Bold="true"></asp:Label><span style="color:red">*</span>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="txtBox" BorderStyle="Groove"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMobileNumber" Display="Dynamic" ForeColor="Red"
                    ErrorMessage="ईमेल दर्ज करें" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
    

        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center" >
                <hr />
                
                  <a href="<%# "Download.aspx?id="+Eval("idDetails") %>">
                <asp:Button ID="btnSignUp" class="js-download" runat="server" Text="भेजें" Textcolor="white" Font-Bold="true" BorderStyle="Groove" BackColor="Green" ValidationGroup="Submit" OnClick="btnSubmit_Click" cssClass="button"/>&nbsp;&nbsp;
</a>
                <asp:Button ID="btnReset" runat="server" Text="रीसेट" Textcolor="white" Font-Bold="true"  BorderStyle="Groove" BackColor="Green" OnClick="btnReset_Click" cssClass="button"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
<br>
</asp:Content>

