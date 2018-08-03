<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="OTrequisition.aspx.cs" Inherits="Hr_OTrequisition" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="page-wrapper">
<div class="main-page">
    <div id="form1" class="forms validation">
        <div class="form-grids row widget-shadow" data-example-id="basic-forms">
<div class="form-title">
	<h4>OT Requisition:</h4>
</div>

            <div class="form-body">
						

                <div class="form-horizontal">
                     <div class="form-group">
                         <label for="inputEmail3" class=" col-md-2 col-sm-2 control-label">Employee Code</label>
                         <div class="col-sm-9  col-md-9">
                                 <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" ontextchanged="TextBox1_TextChanged" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Enter employee code" ControlToValidate="TextBox1" ValidationGroup="a"></asp:RequiredFieldValidator>
                         </div>
                     </div>
                     <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Name</label>
                         <div class="col-sm-9">
                              <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>

                         </div>
                     </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">OT INTIME</label>
                        <div class="col-sm-7">
 <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control form-inline col-md-10">00:00</asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                             <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control col-md-2">
            <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem Value="1">AM</asp:ListItem>
            <asp:ListItem Value="2">PM</asp:ListItem>
        </asp:DropDownList>  
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">OT OUTTIME</label>
                        <div class="col-sm-7">
                             <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control form-inline">00:00</asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                              <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">select</asp:ListItem>
                                <asp:ListItem Value="01">AM</asp:ListItem>
                                <asp:ListItem Value="02">PM</asp:ListItem>
                                </asp:DropDownList>

                        </div>
                    </div>
                     <div class="form-group">
                         <label for="inputPassword3" class="col-sm-2 control-label">DESCRIPTION</label>
                         <div class="col-sm-9">
                              <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>

                         </div>
                     </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Date</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                            <cc1:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" Enabled="True" PopupPosition="TopRight" TargetControlID="TextBox6">
                            </cc1:CalendarExtender>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-12">
                            
                             <asp:Button ID="Button1" runat="server" Text="SUBMIT" onclick="Button1_Click" Class="btn btn-warning"/>
                              &nbsp;<asp:Button ID="Button2" runat="server" Text="RESET" Class=" btn btn-info " />

                             <div class="col-md-12 grid-margin">                            
                 <div class="table-responsive" >                 
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"  >
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="OT_requisition_id" onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" >
        <Columns>
            <asp:BoundField DataField="Employee_code" HeaderText="EMPLOYEE CODE" />
            <asp:BoundField DataField="OT_inttime" HeaderText="INTIME" />
            <asp:BoundField DataField="OT_outtime" HeaderText="OUTTIME" />
            <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" />
            <asp:CommandField SelectText="EDIT" ShowSelectButton="True" />
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
</div>
                            

                        </div>

                    </div>
                     <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-12">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>

                     </div>
                     </div>


                </div>
			
            </div>

</div>
        </div>
</div>

</div>
     

    
    
</asp:Content>

