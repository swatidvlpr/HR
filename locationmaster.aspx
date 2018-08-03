<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="locationmaster.aspx.cs" Inherits="Hr_locationmaster" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="page-wrapper">
    <div class="main-page">
        <div id="form1" class="forms validation">
            <div class="form-grids row widget-shadow" data-example-id="basic-forms">
                <div class="form-title">
							<h4>Location Master :</h4>
						</div>
                 
                 <div class="form-body" id="form">
                     <div class="col-md-6 form-group">
                                       <label >Company name</label>
  
                                       <asp:DropDownList ID="DropDownList1" runat="server"  
        AutoPostBack="True" CssClass="form-control">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="select company name" ControlToValidate="DropDownList1" InitialValue="0"></asp:RequiredFieldValidator>
                     </div> 
                     
                     <div class="col-md-6 form-group">
                      <label >Loacation name </label>  
                         <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="Enter the location name"></asp:RequiredFieldValidator>
                     </div>
                    
                     <div class="col-md-6 form-group">
                         <label >Phone</label> 
                           <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TextBox7" ErrorMessage="Enter the phone no"></asp:RequiredFieldValidator>
                     </div>
                     <div class="col-md-6 form-group">
                         <label >Emailid</label> 
                         <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="TextBox8" ErrorMessage="emailid is required"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="TextBox8" ErrorMessage="Enter valid emailid" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                     </div>
                      <div class="col-md-6 form-group">
                          <label >Land no</label> 
                           <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="TextBox9" ErrorMessage="Enter land no "></asp:RequiredFieldValidator>
                      </div>
                     <div class="col-md-6 form-group">
                       <label >Date</label>   
                         <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
            <cc1:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="TextBox3">
            </cc1:CalendarExtender>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ErrorMessage="Enter date" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                     </div>
                      <div class="col-md-6 form-group">
                          <label >Address</label>  
                         <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Enter address"></asp:RequiredFieldValidator>
                     </div>
                     <div class="col-md-12 form-group">
                                   
                                 <asp:Button ID="Button1" runat="server" Text="submit" Class=" btn btn-warning " onclick="Button1_Click" />
                         &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" ValidationGroup="a" />
                         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
                    
                         <div class="col-md-12 grid-margin">
                 <div class="table-responsive" >
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"  >
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="location_id" onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
        ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="companyname" HeaderText="COMPANY NAME" />
            <asp:BoundField DataField="Location_name" HeaderText="LOCATION NAME" />
            <asp:BoundField DataField="Address" HeaderText="ADDRESS" />
            <asp:BoundField DataField="Phone" HeaderText="PHONE" />
            <asp:BoundField DataField="Emailid" HeaderText="EMAILID" />
            <asp:BoundField HeaderText="LAND NO" DataField="Land_no" />
            <asp:BoundField DataField="Date" HeaderText="DATE" />
            <%--<asp:CommandField SelectText="Edit" ShowSelectButton="True" />--%>
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



    
<br />
    
   
  


</asp:Content>

