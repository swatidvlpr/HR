<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="VendorMaster.aspx.cs" Inherits="Hr_VendorMaster" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="page-wrapper">
<div class="main-page">
    <div id="form1" class="forms validation">
        <div class="form-grids row widget-shadow" data-example-id="basic-forms">
     <div class="form-title">
	<h4>Vendor Master</h4>
	</div>
<div class="form-body" id="form">
    <div class="col-md-6 form-group">
        <label >Vendor Name</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-md-6 form-group">
         <label >Address</label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-md-6 form-group">
 <label >Emailid</label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-md-6 form-group">
        <label >Mobile No.</label>
        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-md-6 form-group">
<label >Alternative Mobile No.</label>
         <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-md-6 form-group">
        <label >Date</label>
         <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                <cc1:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" 
                    PopupPosition="TopRight" TargetControlID="TextBox6">
                </cc1:CalendarExtender>
    </div>

    <div class="col-md-12 form-group">
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" Class=" btn btn-warning" />
        &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" ValidationGroup="a" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

    </div>
    <div class="col-md-12 grid-margin">
                 <div class="table-responsive" >
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0">
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="vendorid" onrowdeleting="GridView1_RowDeleting" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="vendername" HeaderText="VENDOR NAME" />
                        <asp:BoundField DataField="address" HeaderText="ADDRESS" />
                        <asp:BoundField DataField="emailid" HeaderText="EMAILID" />
                        <asp:BoundField DataField="mobileno" HeaderText="MOBILENO" />
                        <asp:BoundField DataField="alternativemobileno" HeaderText="ALT MOBILE NO" />
                        <asp:BoundField DataField="regdate" HeaderText="DATE" />
                        <asp:CommandField SelectText="EDIT" ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>             

</table>

                 </div>
                        

             </div>


</div>
        </div>

    </div>

</div>

     </div>

</asp:Content>

