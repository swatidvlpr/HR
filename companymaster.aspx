﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="companymaster.aspx.cs" Inherits="Hr_companymaster" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="page-wrapper">
			<div class="main-page">
                <div id="form1" class="forms validation">
                    <div class="form-grids row widget-shadow" data-example-id="basic-forms">
                         <div class="form-title">
							<h4>Company Master</h4>
						</div>
                        <div class="form-body" id="form">
                             <div class="col-md-12 form-group">
                                  <label >Company name</label>  
                                  <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                             ControlToValidate="TextBox1" ErrorMessage="company name is required" ValidationGroup="a"></asp:RequiredFieldValidator>
                             </div>
                            <div class="col-md-12 form-group">
    <label >Company Shortcut</label>
    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="TextBox2_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="UppercaseLetters" TargetControlID="TextBox2">
                                </cc1:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="enter company shortcut" ValidationGroup="a"></asp:RequiredFieldValidator>
</div>
                            <div class="col-md-12 form-group">
                                 <asp:Button ID="Button1" runat="server" Text="Submit" Class=" btn btn-warning " onclick="Button1_Click" 
        Height="40px" Width="109px" ValidationGroup="a" />
                                  &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" ValidationGroup="a" />
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
        DataKeyNames="company_id" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" Font-Size="10pt">
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
            <asp:BoundField DataField="companyname" HeaderText="COMPANY NAME" />
            <asp:BoundField DataField="companyshtct" HeaderText="COMPANY SHORTCUT" />
          <%--  <asp:CommandField SelectText="Edit" ShowSelectButton="True" HeaderText="Edit" HeaderStyle-HorizontalAlign="Right"/>
            <asp:CommandField ShowDeleteButton="True" HeaderText="Action" HeaderStyle-HorizontalAlign="Left"/>--%>
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
                   <div class="col-md-12 form-group">

                   </div>     

             </div>


                        </div>
                    </div>

                </div>
                </div>
         </div>



    

    

    
</asp:Content>

