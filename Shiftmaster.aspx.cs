using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Shiftmaster : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            gl.display("shiftmaster", GridView1);
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "update")
        {
            string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();

            gl.update("shiftmaster", "shiftname='" + TextBox1.Text + "',shifttime='" + TextBox2.Text + "'", "shiftid", "'" + idd + "'");
            Label1.Text = "update successfully";
     
        }
        else
        {
            gl.insert1("shiftmaster","shiftname, shifttime", "'" + TextBox1.Text + "','" + TextBox2.Text + "'");
           
        }
        gl.display("shiftmaster", GridView1);
        TextBox1.Text = "";
        TextBox2.Text = "";
        Button1.Text = "submit";
        Label1.Text = "Submit successfully";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
        gl.read1("shiftmaster", "shiftid", "'" + idd + "'");
        TextBox1.Text = gl.ds.Tables[0].Rows[0]["shiftname"].ToString();
        TextBox2.Text = gl.ds.Tables[0].Rows[0]["shifttime"].ToString();
        Button1.Text = "update";

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id1 = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        gl.delete("shiftmaster", "shiftid", "'" + id1 + "'");
        gl.display("shiftmaster", GridView1);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Shiftmaster.aspx");
    }
}