<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="Tourmanagement.aspx.cs" Inherits="Hr_Tourmanagement" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
<div class="main-page">
    <div id="Div2" class="forms validation">
        <div class="form-grids row widget-shadow" data-example-id="basic-forms">
<div class="form-title">
	<h4>Tourmanagement entry</h4>
</div>

            <div class="form-body">
						

                <div class="form-horizontal">
                     <div class="form-group">
                         <label for="inputEmail3" class=" col-md-2 col-sm-2 control-label">Employee Code</label>
                         <div class="col-sm-9  col-md-9">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Enter employee code" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                         </div>
                     </div>
                     <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Name</label>
                         <div class="col-sm-9">
                             <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ErrorMessage="Enter the name" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>

                         </div>
                     </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Out time</label>
                        <div class="col-sm-7">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" >00:00</asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="TextBox3_FilteredTextBoxExtender" 
                                            runat="server" Enabled="True" FilterType="Numbers,Custom" 
                                            TargetControlID="TextBox3" ValidChars=":,">
                                        </cc1:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ErrorMessage="Enter outtime" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-2">
                             <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control col-md-2">
            <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem Value="1">AM</asp:ListItem>
            <asp:ListItem Value="2">PM</asp:ListItem>
        </asp:DropDownList>  
                             
                        </div>

                    </div>

                     <div class="form-group">
                         <label for="inputPassword3" class="col-sm-2 control-label">Out Date</label>
                         <div class="col-sm-9">
                              <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" ></asp:TextBox>
                                     
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                            Enabled="True" TargetControlID="TextBox7" 
                                            PopupPosition="TopRight">
                                        </cc1:CalendarExtender>
                                     
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ErrorMessage="Enter the out date" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>

                         </div>
                     </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">In time</label>
                        <div class="col-sm-7">
                              <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control">00:00</asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="TextBox4_FilteredTextBoxExtender" 
                                            runat="server" Enabled="True" FilterType="Numbers,Custom" 
                                            TargetControlID="TextBox4" ValidChars=":,">
                                        </cc1:FilteredTextBoxExtender>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ErrorMessage="Enter intime" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-2">
                              <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">select</asp:ListItem>
                                <asp:ListItem Value="01">AM</asp:ListItem>
                                <asp:ListItem Value="02">PM</asp:ListItem>
                                </asp:DropDownList>
                          

                        </div>
                    </div>
                     <div class="form-group">
                         <label for="inputPassword3" class="col-sm-2 control-label">In Date</label>
                         <div class="col-sm-9">
                              <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ></asp:TextBox>
                                     
                                        <cc1:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="TextBox5" 
                                            PopupPosition="TopRight">
                                        </cc1:CalendarExtender>
                                     
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ErrorMessage="Enter the date" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>

                         </div>
                     </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Tour location</label>
                        <div class="col-sm-9">
                             <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                                             AutoPostBack="True" 
                                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                     </asp:DropDownList>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ErrorMessage="Enter tour location" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                        </div>

                    </div>

                     <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Budget</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ErrorMessage="Enter your buget" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                        </div>

                    </div>

                     

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-12">
                            
                             <asp:Button ID="Button1" runat="server" Text="Submit" Class=" btn btn-warning " onclick="Button1_Click" />
                                 &nbsp;<asp:Button ID="Button2" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button2_Click" />

                             
                            <asp:Label ID="Label1" runat="server"></asp:Label> 
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager> 


                        </div>

                        <div class="col-md-12 grid-margin">
                 <div class="table-responsive" >
<table id="example" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0"  >
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="tour_id" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged"> 
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
                   <asp:BoundField DataField="Employeecode" HeaderText="EMPLOYEE CODE" />
              <asp:BoundField DataField="Name" HeaderText="NAME" />
                <asp:BoundField DataField="outtime" HeaderText="OUTTIME" />
                <asp:BoundField DataField="intime" HeaderText="INTIME" />
                <asp:BoundField DataField="In_date" HeaderText="IN DATE" />
                <asp:BoundField DataField="tourlocation" HeaderText="LOCATION" />
                <asp:BoundField DataField="buget" HeaderText="BUDGET" DataFormatString="{0:n}"/>
                <asp:BoundField DataField="Out_Date" HeaderText="OUT DATE" DataFormatString="{0:dd/MM/yyyy}"/>
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
                     <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-12">
                            
                     </div>
                     </div>


                </div>
			
            </div>

</div>
        </div>
</div>

</div>

 
           
</asp:Content>

