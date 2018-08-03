<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="Holidaylist.aspx.cs" Inherits="Hr_Holidaylist" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div id="page-wrapper">
<div class="main-page">
    <div id="form1" class="forms validation">
        <div class="form-grids row widget-shadow" data-example-id="basic-forms">
            <div class="form-title">
							<h4>Holiday List:</h4>
						</div>
             <div class="form-body" id="form">
                  <div class="col-md-6 form-group">
 <label >Holiday name</label>
                      <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="holiday name is required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                  </div>
                  <div class="col-md-6 form-group">
                     <label >Date</label> 
                     <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
    
                     <cc1:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True" PopupPosition="TopRight" TargetControlID="TextBox3">
                     </cc1:CalendarExtender>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  
        ErrorMessage="date is required" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                 </div>
                 <div class="col-md-6 form-group">
                    <label >Day</label>                      
                     
                     <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>

   
                 </div>
                
                 <div class="col-md-6 form-group">                     
                   
                 </div>
                 <div class="col-md-12 form-group">
                     <asp:Button ID="Button1" runat="server" Text="submit" onclick="Button1_Click" Class=" btn btn-warning " />
                       &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" ValidationGroup="a" />
                     <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                 </div>
                 <div class="col-md-12 grid-margin">
                 <div class="table-responsive" >
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"  >
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Holiday_id" onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
        ForeColor="#333333" GridLines="None" Width="653px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Holidayname" HeaderText="HOLIDAYNAME" />
            <asp:BoundField DataField="Day" HeaderText="DAY" />
            <asp:BoundField DataField="Date" HeaderText="DATE" />
            <%--<asp:CommandField SelectText="Edit" ShowSelectButton="True" />--%>
            <asp:CommandField ShowSelectButton="true" SelectText="Edit" />
            <asp:CommandField ShowDeleteButton="True" />
            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
       
    </asp:GridView>
   

</table>

                 </div>
                   <div class="col-md-12 form-group">

                   </div>     

             </div>

             </div>

        </div>


    </div>

</div>

    </div>



<div></div>
  
     


   
</asp:Content>

