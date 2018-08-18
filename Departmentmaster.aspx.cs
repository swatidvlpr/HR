using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Hr_Departmentmaster : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                display();
            }
        }
        catch
        { 
        
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (Button1.Text == "Update")
            {
                string id1 = Convert.ToInt32(GridView1.SelectedValue).ToString();
                using (gl.cmd = new SqlCommand("update Departmentmaster set Departmentnm=@Departmentnm where Depart_id=@Depart_id", gl.con))
                {
                    gl.cmd.Parameters.AddWithValue("@Depart_id", id1);
                    gl.cmd.Parameters.AddWithValue("@Departmentnm", TextBox1.Text);
                    gl.con.Open();
                    gl.cmd.ExecuteNonQuery();
                    gl.con.Close();

                    Label1.Text = "Sucessfully updated";
                }

            }
            else
            {
                using (gl.cmd = new SqlCommand("insert into Departmentmaster values(@Departmentnm)", gl.con))
                {
                    gl.cmd.Parameters.AddWithValue("@Departmentnm", TextBox1.Text);
                    gl.con.Open();
                    gl.cmd.ExecuteNonQuery();
                    gl.con.Close();
                    TextBox1.Text = "";
                    Label1.Text = "Sucessfully submitted";
                }
            }
            display();
        }
        catch
        { 
        
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Departmentmaster.aspx");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int idd = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            gl.delete("Departmentmaster", "Depart_id", "'" + idd + "'");
            display();
        }
        catch
        { 
        
        }

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string id1 = Convert.ToInt32(GridView1.SelectedValue).ToString();
            gl.read1("Departmentmaster", "Depart_id", "'" + id1 + "'");
            TextBox1.Text = gl.ds.Tables[0].Rows[0]["Departmentnm"].ToString();
            Button1.Text = "Update";
        }
        catch
        { 
        
        }
    }

    public void display()
    {
        gl.display("Departmentmaster", GridView1);
    
    }
}