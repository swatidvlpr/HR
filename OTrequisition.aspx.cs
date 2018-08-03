using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_OTrequisition : System.Web.UI.Page
{
    global gl = new global();
    int status_hod = 0;
    int status_hr = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                gl.display("OT_requisitiontb", GridView1);
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
            DateTime crnttime = Convert.ToDateTime(TextBox6.Text);
            TimeZoneInfo tzn = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime IndianTme = TimeZoneInfo.ConvertTime(crnttime, tzn);
            string time1 = IndianTme.ToString("M/dd/yyyy");
            if (Button1.Text == "update")
            {
                string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
                gl.update("OT_requisitiontb", "OT_inttime='" + TextBox2.Text + "',OT_outtime='" + TextBox3.Text + "',Description='" + TextBox4.Text + "',date='" + time1 + "'", "OT_requisition_id", "'" + idd + "'");

            }
            else
            {


                int status_hr = 0;
                int status_hod = 0;
                string intime = TextBox2.Text + " " + DropDownList3.SelectedItem;
                string outtime = TextBox3.Text + " " + DropDownList2.SelectedItem;
                gl.insert1("OT_requisitiontb", "Employee_code,OT_inttime,OT_outtime,Description,Status_Hod,Status_Hr,date,name", "'" + TextBox1.Text + "','" + intime + "','" + outtime + "','" + TextBox4.Text + "','" + status_hod + "','" + status_hr + "','" + time1 + "','" + TextBox5.Text + "'");
            }
            gl.display("OT_requisitiontb", GridView1);
        }
        catch
        { 
        
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        try
        {
            gl.query("select * from Employee_Reg where EmployeeCode='" + TextBox1.Text + "'");
            TextBox5.Text = gl.ds.Tables[0].Rows[0]["Name"].ToString();
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
            gl.read1("OT_requisitiontb", "OT_requisition_id", "'" + idd + "'");
            TextBox1.Text = gl.ds.Tables[0].Rows[0]["Employee_code"].ToString();
            TextBox2.Text = gl.ds.Tables[0].Rows[0]["OT_inttime"].ToString();
            TextBox3.Text = gl.ds.Tables[0].Rows[0]["OT_outtime"].ToString();
            TextBox4.Text = gl.ds.Tables[0].Rows[0]["Description"].ToString();
            //TextBox6.Text = gl.ds.Tables[0].Rows[0]["date"].ToString();

            string dt = gl.ds.Tables[0].Rows[0]["date"].ToString();
            // DateTime oDate = DateTime.ParseExact(dt, "d", null);
            DateTime dt1 = DateTime.ParseExact(dt.ToString(), "dd/MM/yyyy", null);
            TextBox6.Text = Convert.ToDateTime(dt1).ToString("d");
            TextBox5.Text = gl.ds.Tables[0].Rows[0]["name"].ToString();

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
            int idd = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            gl.delete("OT_requisitiontb", "OT_requisition_id", "'" + idd + "'");
            gl.display("OT_requisitiontb", GridView1);
        }
        catch
        { 
        
        }

    }
}