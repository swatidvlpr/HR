<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="Designation.aspx.cs" Inherits="Hr_Designation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
<div class="main-page">
<div id="form1" class="forms validation">
<div class="form-grids row widget-shadow" data-example-id="basic-forms">
    <div class="form-title">
	<h4>Designation Master</h4>
	</div>
    <div class="form-body" id="form">
<div class="col-md-6 form-group">
    <label >Department Name</label>
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" ValidationGroup="a"></asp:DropDownList>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
      ControlToValidate="TextBox1" ErrorMessage="Enter department name" ValidationGroup="a"></asp:RequiredFieldValidator>
</div>
<div class="col-md-6 form-group">
    <label >Designation Name</label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ValidationGroup="a"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Enter designation name" ValidationGroup="a"></asp:RequiredFieldValidator>
</div>        
        <div class="col-md-12 form-group">
            <asp:Button ID="Button1" runat="server" Text="Submit" Class=" btn btn-warning " OnClick="Button1_Click" ValidationGroup="a" />
              &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-md-12 grid-margin">
                 <div class="table-responsive" >
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0">
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Designation_id" Width="100%" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                         <asp:TemplateField ControlStyle-CssClass="" HeaderText="SN">
                            <ItemTemplate>
                          
                                <%#GridView1.Rows.Count + 1%>
                               
                            </ItemTemplate>
                            <ControlStyle />
                            <FooterStyle />
                            <HeaderStyle CssClass="" ForeColor="White" 
                                HorizontalAlign="Left" />
                            <ItemStyle CssClass="" HorizontalAlign="Left" />
                        </asp:TemplateField> 
                        <asp:BoundField DataField="Departmentnm" HeaderText="Department name" />
                        <asp:BoundField DataField="Designationnm" HeaderText="Designation name" />
                        
                       <%-- <asp:CommandField SelectText="EDIT" ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />--%>
                          <asp:TemplateField  HeaderText="Edit">
                        <ItemTemplate>
                        
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/DSR/icon/edit.png" CommandName="Select"  />
                        
                        </ItemTemplate>
                        
                        </asp:TemplateField>
            <asp:TemplateField  HeaderText="Delete">
                        <ItemTemplate>
                        
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/DSR/icon/No.png"   CommandName="Delete" OnClientClick="return confirm('Do u delete Record?')" />
                        </ItemTemplate>
                        </asp:TemplateField> 
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

