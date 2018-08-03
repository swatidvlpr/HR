using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_locationmaster : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                //gl.ddl("companymaster", "companyname", "company_id", DropDownList1);
                gl.query("SELECT company_id, companyname FROM  dbo.companymaster union select 0,'select'");
                DropDownList1.DataSource = gl.ds;
                DropDownList1.DataTextField = "companyname";
                DropDownList1.DataValueField = "company_id";
                DropDownList1.DataBind();
                // gl.display("locationmaster", GridView1);
                display();
            }
        }
        catch
        { 
        
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try {
        DateTime crnttime = Convert.ToDateTime(TextBox3.Text);
        TimeZoneInfo tzn = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        DateTime IndianTme = TimeZoneInfo.ConvertTime(crnttime, tzn);
        string time1 = IndianTme.ToString("dd/MM/yyyy");
        string mnth1 = IndianTme.ToString("MM");
        string year1 = IndianTme.ToString("yyyy");
        if (Button1.Text == "update")
        {
            int idd = Convert.ToInt32(GridView1.SelectedValue);
            if (GridView1.SelectedValue == null)
            {
                string id1 = Request.QueryString["id"].ToString();

                gl.update("locationmaster", "Location_name='" + TextBox2.Text + "',address='" + TextBox1.Text + "',phone='" + TextBox7.Text + "',emailid='" + TextBox8.Text + "',Land_no='" + TextBox9.Text + "',Date'" + TextBox3.Text + "'", "location_id", "'" + id1 + "'");

            }
            else
            {
                gl.update("locationmaster", "Location_name='" + TextBox2.Text + "',address='" + TextBox1.Text + "',phone='" + TextBox7.Text + "',emailid='" + TextBox8.Text + "',Land_no='" + TextBox9.Text + "',Date'" + TextBox3.Text + "'", "location_id", "'" + idd + "'");
            }

        }
        else
        {
            gl.insert1("locationmaster", "Company_id, Location_name, Address, Phone, Emailid, Land_no, Date", "'" + DropDownList1.SelectedValue + "','" + TextBox2.Text + "','" + TextBox1.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + time1 + "'");
        }
        //gl.display("locationmaster", GridView1); 
        display();
        TextBox2.Text = "";
        TextBox1.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox3.Text = "";
        Button1.Text = "submit";
        Label1.Text = "Submit successfully";
        }
        catch
        { }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
            gl.read1("locationmaster", "location_id", "'" + idd + "'");
            string company_id = gl.ds.Tables[0].Rows[0]["company_id"].ToString();
            for (int i = 0; i < +DropDownList1.Items.Count - 1; i++)
            {
                if (DropDownList1.Items[i].Value == company_id)
                {
                    DropDownList1.Items[i].Selected = true;
                }
                else
                {
                    DropDownList1.Items[i].Selected = false;
                }
            }

            TextBox2.Text = gl.ds.Tables[0].Rows[0]["Location_name"].ToString();
            TextBox1.Text = gl.ds.Tables[0].Rows[0]["Address"].ToString();
            TextBox7.Text = gl.ds.Tables[0].Rows[0]["Phone"].ToString();
            TextBox8.Text = gl.ds.Tables[0].Rows[0]["Emailid"].ToString();
            TextBox9.Text = gl.ds.Tables[0].Rows[0]["Land_no"].ToString();
            TextBox3.Text = gl.ds.Tables[0].Rows[0]["Date"].ToString();
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
            gl.delete("locationmaster", "location_id", "'" + id1 + "'");
            gl.display("locationmaster", GridView1);
        }
        catch
        { 
        
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("locationmaster.aspx");
    }

    public void display()
    {
        try
        {
            gl.query("SELECT dbo.companymaster.companyname, dbo.companymaster.company_id, dbo.locationmaster.location_id, dbo.locationmaster.Location_name,dbo.locationmaster.Address, dbo.locationmaster.Phone, dbo.locationmaster.Emailid, dbo.locationmaster.Land_no, dbo.locationmaster.Date FROM dbo.companymaster INNER JOIN dbo.locationmaster ON dbo.companymaster.company_id = dbo.locationmaster.Company_id");
            GridView1.DataSource = gl.ds;
            GridView1.DataBind();
        }
        catch
        { }
    }
}