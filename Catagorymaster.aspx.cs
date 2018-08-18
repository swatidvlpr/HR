using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Hr_Catagorymaster : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gl.ddl_select("companymaster", "company_id,companyname", "companyname", "company_id","0","'Select'",DropDownList1);

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
            using (gl.cmd = new SqlCommand("update Categorymaster set Companyid=@Companyid,Categorynm=@Categorynm,Categoryshtct=@Categoryshtct,location_id=@location_id where Category_id=@Category_id", gl.con))
            {
                gl.cmd.Parameters.AddWithValue("@Category_id", id1);
                gl.cmd.Parameters.AddWithValue("@Companyid", DropDownList1.SelectedValue);
                gl.cmd.Parameters.AddWithValue("@location_id", DropDownList2.SelectedValue);
                gl.cmd.Parameters.AddWithValue("@Categorynm", TextBox1.Text);
                gl.cmd.Parameters.AddWithValue("@Categoryshtct", TextBox2.Text);
                gl.con.Open();
                gl.cmd.ExecuteNonQuery();
                gl.con.Close();
                display();
                Label1.Text = "Sucessfully updated";
            }

        }
        else
        {
            using (gl.cmd = new SqlCommand("insert into Categorymaster(Companyid,Categorynm,Categoryshtct,location_id) values(@Companyid,@Categorynm,@Categoryshtct,@location_id)", gl.con))
        {
         
            gl.cmd.Parameters.AddWithValue("@Companyid", DropDownList1.SelectedValue);           
            gl.cmd.Parameters.AddWithValue("@Categorynm", TextBox1.Text);
            gl.cmd.Parameters.AddWithValue("@Categoryshtct", TextBox2.Text);
            gl.cmd.Parameters.AddWithValue("@location_id", DropDownList2.SelectedValue);
            gl.con.Open();
            gl.cmd.ExecuteNonQuery();
            gl.con.Close();
            display();
            Label1.Text = "Sucessfully submitted";
        }
        }

        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        TextBox1.Text = "";
        TextBox2.Text = "";
        }
        catch
        { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Catagorymaster.aspx");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int idd = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        gl.delete("Categorymaster", "Category_id", "'"+idd+"'");
        display();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id1 = Convert.ToInt32(GridView1.SelectedValue).ToString();
        gl.query("SELECT     dbo.companymaster.company_id, dbo.companymaster.companyname, dbo.Categorymaster.Category_id, dbo.Categorymaster.Categorynm,dbo.locationmaster.location_id, dbo.locationmaster.Location_name, dbo.Categorymaster.Categoryshtct FROM  dbo.companymaster INNER JOIN dbo.locationmaster ON dbo.companymaster.company_id = dbo.locationmaster.Company_id INNER JOIN dbo.Categorymaster ON dbo.locationmaster.location_id = dbo.Categorymaster.location_id  where Category_id='" + id1 + "'");
        string companyid = gl.ds.Tables[0].Rows[0]["company_id"].ToString();
        string location_id = gl.ds.Tables[0].Rows[0]["location_id"].ToString();
        TextBox1.Text = gl.ds.Tables[0].Rows[0]["Categorynm"].ToString();
        TextBox2.Text = gl.ds.Tables[0].Rows[0]["Categoryshtct"].ToString();
        DataSet ds=new DataSet();
        ds.Clear();
        SqlDataAdapter da = new SqlDataAdapter("select * from companymaster", gl.con);
        da.Fill(ds);
        DropDownList1.DataSource = ds;
        DropDownList1.DataTextField = "companyname";
        DropDownList1.DataValueField = "company_id";
        DropDownList1.DataBind();
        for (int i = 0; i < DropDownList1.Items.Count; i++)
        {
            if (DropDownList1.Items[i].Value == companyid)
            {
                DropDownList1.Items[i].Selected = true;
                gl.ddlcond("locationmaster", "Location_name", "location_id", "Company_id", "'" + companyid + "'", DropDownList2);
            
            }
        
        }

        for (int i = 0; i < DropDownList2.Items.Count; i++)
        {
            if (DropDownList2.Items[i].Value == location_id)
            {
                DropDownList2.Items[i].Selected = true;
            }
        }
       
        
        Button1.Text = "Update";
        
    }

    public void display()
    {
        gl.query("SELECT     dbo.companymaster.company_id, dbo.companymaster.companyname, dbo.Categorymaster.Category_id, dbo.Categorymaster.Categorynm,dbo.locationmaster.location_id, dbo.locationmaster.Location_name, dbo.Categorymaster.Categoryshtct FROM  dbo.companymaster INNER JOIN dbo.locationmaster ON dbo.companymaster.company_id = dbo.locationmaster.Company_id INNER JOIN dbo.Categorymaster ON dbo.locationmaster.location_id = dbo.Categorymaster.location_id order by companyname ASC");
        GridView1.DataSource = gl.ds;
        GridView1.DataBind();
    
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            gl.ddlcond("locationmaster", "Location_name", "location_id", "Company_id", "'" + DropDownList1.SelectedValue + "'", DropDownList2);
            DropDownList2.SelectedIndex = 0;
        }
        catch
        {
        }
    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("-Select-", "-Select-")); 
    }
}