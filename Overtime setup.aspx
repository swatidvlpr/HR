<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="Overtime setup.aspx.cs" Inherits="Hr_Overtime_setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div id="page-wrapper">
			<div class="main-page">
                <div id="form1" class="forms validation">
                    <div class="form-grids row widget-shadow" data-example-id="basic-forms">
                         <div class="form-title">
							<h4>Overtime entry</h4>
						</div>
                        <div class="form-body" id="form">
                             <div class="col-md-6 form-group">
                                  <label >Rule title</label>  
                                  <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <br />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                      ControlToValidate="TextBox1" ErrorMessage="Required rule title"></asp:RequiredFieldValidator>
                                                    </div>
                             
                             <div class="col-md-6 form-group">
                                  <label >Rule description</label>  
                                  <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" 
                                      TextMode="MultiLine"></asp:TextBox>
                                                    <br />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                      ControlToValidate="TextBox2" ErrorMessage="Required rule description"></asp:RequiredFieldValidator>
                                                    </div>
                            
                           
                            <div class="col-md-12 form-group">
                                 <asp:Button ID="Button1" runat="server" Text="Submit" Class=" btn btn-warning " onclick="Button1_Click" 
        Height="40px" Width="109px" />
                                  &nbsp;
                                   &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" Height="40px" Width="109px" />
                                  <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>  
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
                             </div>
           <div class="col-md-12 grid-margin">
                 <div class="table-responsive" >
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"  >
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        onrowdeleting="GridView1_RowDeleting"  
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        DataKeyNames="Overtime_rule_id" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Rule_title" HeaderText="RULE TITLE" />
              <asp:BoundField DataField="Rule_description" HeaderText="RULE DESCRIPTION" />
            <asp:CommandField SelectText="Edit" ShowSelectButton="True" HeaderText="Edit" HeaderStyle-HorizontalAlign="Right"/>
            <asp:CommandField ShowDeleteButton="True" HeaderText="Action" HeaderStyle-HorizontalAlign="Left"/>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Right"  />
        
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
       
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

