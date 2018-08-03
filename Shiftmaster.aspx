<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="Shiftmaster.aspx.cs" Inherits="Hr_Shiftmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="page-wrapper">
			<div class="main-page">
                <div id="form1" class="forms validation">
                    <div class="form-grids row widget-shadow" data-example-id="basic-forms">
                         <div class="form-title">
							<h4>Shiftmaster entry</h4>
						</div>
                        <div class="form-body" id="form">
                             <div class="col-md-6 form-group">
                                  <label >Shift name</label>  
                                  <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="402px"></asp:TextBox>
                                                    <br />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                      ControlToValidate="TextBox1" ErrorMessage="Required shift name"></asp:RequiredFieldValidator>
                                                    </div>
                             
                             <div class="col-md-6 form-group">
                                  <label >Shift time</label>  
                                  <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="402px"></asp:TextBox>
                                                    <br />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                      ControlToValidate="TextBox2" ErrorMessage="Required shift time"></asp:RequiredFieldValidator>
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
        DataKeyNames="shiftid" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
                   <asp:BoundField DataField="shiftname" HeaderText="SHIFT NAME" />
              <asp:BoundField DataField="shifttime" HeaderText="SHIFT TIME" />
            <asp:CommandField SelectText="Edit" ShowSelectButton="True" HeaderText="Edit" HeaderStyle-HorizontalAlign="Right"/>
            <asp:CommandField ShowDeleteButton="True" HeaderText="Action" HeaderStyle-HorizontalAlign="Left"/>
            <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("shiftid","Emp Shiftdetail.aspx?id={0}")%>' Text="Detail"></asp:HyperLink>
            </ItemTemplate></asp:TemplateField>
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

