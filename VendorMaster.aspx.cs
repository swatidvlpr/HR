using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Hr_VendorMaster : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gl.display("vendormaster", GridView1);
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try { 
        
    
        if (Button1.Text == "update")
        {
            int idd = Convert.ToInt32(GridView1.SelectedValue);
            gl.update("vendormaster", "vendername='" + TextBox1.Text + "',address='" + TextBox2.Text + "',emailid='" + TextBox3.Text + "',mobileno='" + TextBox4.Text + "',alternativemobileno='" + TextBox5.Text + "',regdate='" + TextBox6.Text + "'", "vendorid", "'" + idd + "'");
        }
        else
        {
            gl.insert1("vendormaster", "vendername, address, emailid, mobileno, alternativemobileno", "'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "'");
        }
        gl.display("vendormaster", GridView1);
        TextBox1.Text = " ";
        TextBox2.Text = " ";
        TextBox3.Text = " ";
        TextBox4.Text = " ";
        TextBox5.Text = " ";
        TextBox6.Text = " ";
        }
        catch
        { }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(GridView1.SelectedValue);
        gl.read1("vendormaster", "vendorid", "'" + id + "'");
        TextBox1.Text = gl.ds.Tables[0].Rows[0]["vendername"].ToString();
        TextBox2.Text = gl.ds.Tables[0].Rows[0]["address"].ToString();
        TextBox3.Text = gl.ds.Tables[0].Rows[0]["emailid"].ToString();
        TextBox4.Text = gl.ds.Tables[0].Rows[0]["mobileno"].ToString();
        TextBox5.Text = gl.ds.Tables[0].Rows[0]["alternativemobileno"].ToString();
        TextBox6.Text = gl.ds.Tables[0].Rows[0]["regdate"].ToString();

        Button1.Text = "update";
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int idd = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        gl.delete("vendormaster", "vendorid", "'" + idd + "'");
        gl.display("vendormaster", GridView1);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("VendorMaster.aspx");
    }
}