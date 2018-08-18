using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_companymaster : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                //gl.display("companymaster", GridView1);
                display();
            }
        }
        catch
        { 
        
        }
    }
    public void display()
    {
        gl.query("Select * from companymaster order by companyname ASC");
        GridView1.DataSource = gl.ds;
        GridView1.DataBind();
    
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try { 
        
       
        if (Button1.Text == "update")
        {
            int idd = Convert.ToInt32(GridView1.SelectedValue);
            if (GridView1.SelectedValue == null)
            {
                string id1 = Request.QueryString["id"].ToString();

                gl.update("companymaster", "companyname='" + TextBox1.Text + "',companyshtct='" + TextBox2.Text + "'", "company_id", "'" + id1 + "'");
                Label1.Text = "Updated successfully";
              
            }
            else
            {
                gl.update("companymaster", "companyname='" + TextBox1.Text + "',companyshtct='" + TextBox2.Text + "'", "company_id", "'" + idd + "'");
                Label1.Text = "Sucessfully updated";
            }
            TextBox1.Text = "";
            TextBox2.Text = "";

        }
        else
        {
            gl.insert("companymaster", "'" + TextBox1.Text + "','" + TextBox2.Text + "'");
            Label1.Text = "Submit successfully";
        }
        //gl.display("companymaster", GridView1);
        display();
        TextBox1.Text = "";
        TextBox2.Text = "";
        Button1.Text = "submit";
        
        }
        catch
        {

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
     {
        try
         {            
            string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
             gl.read1("companymaster", "company_id", "'" + idd + "'");
             TextBox1.Text = gl.ds.Tables[0].Rows[0]["companyname"].ToString();
             TextBox2.Text = gl.ds.Tables[0].Rows[0]["companyshtct"].ToString();
             Button1.Text = "update";
         }
         catch
         { 
         
         }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id1 = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            gl.delete("companymaster", "company_id", "'" + id1 + "'");
           // gl.display("companymaster", GridView1);
            display();
        }
        catch
        { 
        
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("companymaster.aspx");
    }
}