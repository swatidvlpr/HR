using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Overtime_setup : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
           //gl.display("Overtime_setup_rules", GridView1);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
          if (Button1.Text == "update")
            {
            string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();

            gl.update("Overtime_setup_rules", "Rule_title='" + TextBox1.Text + "',Rule_description='" + TextBox2.Text + "'", "Overtime_rule_id", "'" + idd + "'");
            Label1.Text = "update successfully";
;
            }
            else
            {
                gl.insert("Overtime_setup_rules", "'" + TextBox1.Text + "','"+TextBox2.Text+"'");
                Label1.Text = "Submit successfully";
            }
            gl.display("Overtime_setup_rules", GridView1);
            TextBox1.Text = "";
            TextBox2.Text = "";
            Button1.Text = "submit";
            
        
      
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
        gl.read1("Overtime_setup_rules", "Overtime_rule_id", "'" + idd + "'");
        TextBox1.Text = gl.ds.Tables[0].Rows[0]["Rule_title"].ToString();
        TextBox2.Text = gl.ds.Tables[0].Rows[0]["Rule_description"].ToString();
        Button1.Text = "update";
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id1 = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        gl.delete("Overtime_setup_rules", "Overtime_rule_id", "'" + id1 + "'");
        gl.display("Overtime_setup_rules", GridView1);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Overtime setup.aspx");
    }
}