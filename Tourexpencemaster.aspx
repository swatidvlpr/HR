<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="Tourexpencemaster.aspx.cs" Inherits="Hr_Tourexpencemaster" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="page-wrapper">
             <div class="main-page">
                       <div id="form1" class="forms validation">
                         <div class="form-grids row widget-shadow" data-example-id="basic-forms">
                           <div class="form-title">
                               <h4>Tourexpence entry</h4>
                           </div>
                              <div class="form-body" id="form">
                                <div class="col-md-6 form-group">
                                        <label >Tour Location</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="402px"
                                            TextMode="SingleLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Enter tour location" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                </div>

                                 <div class="col-md-6 form-group">
                                        <label >Eligibility</label>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="402px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ErrorMessage="Enter eligibility" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 form-group">
                                        <label >Budget</label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Width="402px">00.00</asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ErrorMessage="Enter your buget" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                </div>
                                     <div class="col-md-6 form-group">
                                        <label >Location details</label>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Width="402px"
                                             TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                             ErrorMessage="Enter location details" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                                </div>
                                
                            <div class="col-md-12 form-group">
                                 <asp:Button ID="Button1" runat="server" Text="Submit" Class=" btn btn-warning " onclick="Button1_Click" />
                                  &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" />
                                           <br />
                                 <asp:Label ID="Label1" runat="server"></asp:Label>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>  
                              </div>

 <div class="col-md-12 grid-margin">
                 <div class="table-responsive" >
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"  >
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="expence_id" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
                   <asp:BoundField DataField="tourlocation" HeaderText="TOUR LOCATION" />
              <asp:BoundField DataField="eligibility" HeaderText="ELIGIBILITY" />
                <asp:BoundField DataField="buget" HeaderText="BUDGET" DataFormatString="{0:n}" />
                 <asp:BoundField DataField="locationdetails" HeaderText="LOCATION DETAILS" />
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
</asp:Content>

