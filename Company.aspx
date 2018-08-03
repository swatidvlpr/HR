<%@ Page Title="" Language="C#" MasterPageFile="~/Hr/hr.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="Hr_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery("#Content2").validationEngine();
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="form1" class="forms validation">    
    <div id="page-wrapper">
			<div class="main-page">
				<div class="forms" data-example-id="form-validation-states">
                    <div class="form-grids row widget-shadow" data-example-id="basic-forms">
						<div class="form-title">
							<h4>Company Form :</h4>
						</div>

                        <div class="form-body">
							<div>
                                <div class="form-group"><label for="exampleInputEmail1">Company name</label>
                              
                                <asp:TextBox ID="txtcompany" runat="server" Class="form-control" placeholder="Company Name" data-error="Please enter company name" required="true"></asp:TextBox>
							     
                                 </div>
                                <div class="form-group  has-feedback"> <label for="exampleInputEmail1">Email address</label> 
                                   
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"   required="true" data-error="Bruh, that email address is invalid" ></asp:TextBox>
                                    <%--<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<span class="help-block with-errors">Please enter a valid email address</span>--%>
                                </div> 
                                 <div class="form-group"> <label for="exampleInputPassword1">Address</label>
                                    
                                     <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine"  required="true"></asp:TextBox>

                                 </div> 
                                <div class="form-group"> <label for="exampleInputPassword1">Phone no</label>
                                    
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone no"  required="true" ></asp:TextBox>
                                </div> 
                                 <div class="form-group"> <label for="exampleInputPassword1">Mobile no</label>
                                 
                                     <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Mobile no"  required="true" ></asp:TextBox>

                                 </div> 
                                <%--<button type="submit" class="btn btn-warning">Submit</button>--%>
                                <asp:Button ID="submit" runat="server" Class=" btn btn-warning " Text="Submit" OnClick="submit_Click" />

                                &nbsp;<asp:Button ID="Button1" runat="server" Class=" btn btn-info " Text="Reset" OnClick="Button1_Click" ValidationGroup="a" />
							</div> 
						</div>
                        </div>

				</div>
             </div>   </div>
        </div>
     

</asp:Content>

