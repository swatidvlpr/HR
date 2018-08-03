using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Tourexpencemaster : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            gl.display("tour_exp_master", GridView1);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (Button1.Text == "update")
            {
                string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();

                gl.update("tour_exp_master", "tourlocation='" + TextBox1.Text + "',eligibility='" + TextBox2.Text + "',buget='" + TextBox3.Text + "',locationdetails='" + TextBox4.Text + "'", "expence_id", "'" + idd + "'");
                Label1.Text = "update successfully";

            }
            else
            {
                gl.insert("tour_exp_master", "'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "'");
                Label1.Text = "Submit successfully";
            }
            gl.display("tour_exp_master", GridView1);
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Button1.Text = "submit";
        }
        catch { }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
        gl.read1("tour_exp_master", "expence_id", "'" + idd + "'");
        TextBox1.Text = gl.ds.Tables[0].Rows[0]["tourlocation"].ToString();
        TextBox2.Text = gl.ds.Tables[0].Rows[0]["eligibility"].ToString();
        TextBox3.Text = gl.ds.Tables[0].Rows[0]["buget"].ToString();
        TextBox4.Text = gl.ds.Tables[0].Rows[0]["locationdetails"].ToString();
        Button1.Text = "update";
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id1 = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        gl.delete("tour_exp_master", "expence_id", "'" + id1 + "'");
        gl.display("tour_exp_master", GridView1);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Tourexpencemaster.aspx");
    }
}