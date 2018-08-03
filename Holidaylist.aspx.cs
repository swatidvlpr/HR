using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Holidaylist : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gl.display("holidaytlist", GridView1);
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
            string day1 = IndianTme.ToString("dddd");

           

        if (Button1.Text == "update")
        {
            int idd = Convert.ToInt32(GridView1.SelectedValue);
            if (GridView1.SelectedValue == null)
            {
                string id1 = Request.QueryString["id"].ToString();

                gl.update("holidaytlist", "Holidayname='" + TextBox1.Text + "',Day='" + TextBox2.Text + "',Date='" + time1 + "',month='" + mnth1 + "',year='" + year1 + "'", "Holiday_id", "'" + id1 + "'");
                Label1.Text = "Update successfully";
            }
            else
            {
                gl.update("holidaytlist", "Holidayname='" + TextBox1.Text + "',Day='" + TextBox2.Text + "',Date='" + time1 + "',month='" + mnth1 + "',year='" + year1 + "'", "Holiday_id", "'" + idd + "'");
                Label1.Text = "Update successfully";
            }

        }
        else
        {
            gl.insert1("holidaytlist", " Holidayname, Day, Date, month, year", "'" + TextBox1.Text + "','" + TextBox2.Text + "','" + time1 + "','" + mnth1 + "','" + year1 + "'");
            Label1.Text = "Submit successfully";
        }
        gl.display("holidaytlist", GridView1); 
        TextBox1.Text = "";
       // DropDownList1.SelectedIndex=0;
        TextBox3.Text = "";
        Button1.Text = "submit";
        
        }
        catch
        { }
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
            gl.read1("holidaytlist", "Holiday_id", "'" + idd + "'");
            TextBox1.Text = gl.ds.Tables[0].Rows[0]["Holidayname"].ToString();
            TextBox2.Text = gl.ds.Tables[0].Rows[0]["Day"].ToString();
            // TextBox3.Text = 
            string dt = gl.ds.Tables[0].Rows[0]["Date"].ToString();
            // DateTime oDate = DateTime.ParseExact(dt, "d", null);
            DateTime dt1 = DateTime.ParseExact(dt.ToString(), "dd/MM/yyyy", null);

            TextBox3.Text = Convert.ToDateTime(dt1).ToString("d");

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
            gl.delete("holidaytlist", "Holiday_id", "'" + id1 + "'");
            gl.display("holidaytlist", GridView1);
        }
        catch { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Holidaylist.aspx");
    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
        try
        {
            DateTime crnttime = Convert.ToDateTime(TextBox3.Text);
            TimeZoneInfo tzn = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime IndianTme = TimeZoneInfo.ConvertTime(crnttime, tzn);
            string time1 = IndianTme.ToString("dd/MM/yyyy");
            string mnth1 = IndianTme.ToString("MM");
            string year1 = IndianTme.ToString("yyyy");
            string day1 = IndianTme.ToString("dddd");
            TextBox2.Text = day1.ToString();
        }
        catch
        { 
        
        }
    }
}