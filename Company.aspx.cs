using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Company : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            gl.insert1("Company_Master", "Companynm, Email, Address, Phoneno, Mobile", "'" + txtcompany.Text + "','" + txtEmail.Text + "','" + txtaddress.Text + "','" + txtPhone.Text + "','" + txtMobile.Text + "'");
            txtcompany.Text = "";
            txtEmail.Text = "";
            txtaddress.Text = "";
            txtPhone.Text = "";
            txtMobile.Text = "";
        }
        catch
        { 
        
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Company.aspx");
    }
}