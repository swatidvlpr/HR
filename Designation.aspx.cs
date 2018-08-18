using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Hr_Designation : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gl.ddl_select("Departmentmaster", "Depart_id,Departmentnm", "Departmentnm", "Depart_id", "0", "'Select'", DropDownList1);

            display();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (Button1.Text == "Update")
            {
                string id1 = Convert.ToInt32(GridView1.SelectedValue).ToString();
                using (gl.cmd = new SqlCommand("update Designation set Depart_id=@Depart_id,Designationnm=@Designationnm where Designation_id=@Designation_id", gl.con))
                {
                    gl.cmd.Parameters.AddWithValue("@Designation_id", id1);
                    gl.cmd.Parameters.AddWithValue("@Depart_id", DropDownList1.SelectedValue);
                    gl.cmd.Parameters.AddWithValue("@Designationnm", TextBox1.Text);                   
                    gl.con.Open();
                    gl.cmd.ExecuteNonQuery();
                    gl.con.Close();
                    display();
                    Label1.Text = "Sucessfully updated";
                }

            }
            else
            {
                using (gl.cmd = new SqlCommand("insert into Designation(Depart_id,Designationnm) values(@Depart_id,@Designationnm)", gl.con))
                {

                    gl.cmd.Parameters.AddWithValue("@Depart_id", DropDownList1.SelectedValue);
                    gl.cmd.Parameters.AddWithValue("@Designationnm", TextBox1.Text);                    
                    gl.con.Open();
                    gl.cmd.ExecuteNonQuery();
                    gl.con.Close();
                    display();
                    Label1.Text = "Sucessfully submitted";
                    Button1.Text = "Submit";
                }
            }

            DropDownList1.SelectedIndex = 0;           
            TextBox1.Text = "";          
        }
        catch
        { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Designation.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id1 = Convert.ToInt32(GridView1.SelectedValue).ToString();
        gl.read1("Designation", "Designation_id", "'" + id1 + "'");
        string Depart_id = gl.ds.Tables[0].Rows[0]["Depart_id"].ToString();
        for (int i = 0; i < DropDownList1.Items.Count; i++)
        {
            if (DropDownList1.Items[i].Value == Depart_id)
            {
                DropDownList1.Items[i].Selected = true;
            }
            else
            {
                DropDownList1.Items[i].Selected = false;
            }
        }
        TextBox1.Text = gl.ds.Tables[0].Rows[0]["Designationnm"].ToString();
        Button1.Text = "Update";
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int idd = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        gl.delete("Designation", "Designation_id", "'" + idd + "'");
        display();
    }
    public void display()
    {
        gl.query("SELECT dbo.Departmentmaster.Departmentnm, dbo.Designation.Designation_id, dbo.Designation.Designationnm FROM dbo.Departmentmaster INNER JOIN dbo.Designation ON dbo.Departmentmaster.Depart_id = dbo.Designation.Depart_id order by Designationnm ASC");
        GridView1.DataSource = gl.ds;
        GridView1.DataBind();
    }
}