using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Holidaylistshow : System.Web.UI.Page
{
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 2016; i <= 2050; i++)
            {
                DropDownList2.Items.Add(i.ToString());


            }
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (DropDownList2.SelectedIndex == 0)
            {
                
            }
            else
            {
                if (DropDownList1.SelectedIndex == 0)
                {
                    gl.displaycond("holidaytlist", "year", "'" + DropDownList2.SelectedValue + "'", GridView1);
                }
                else
                {
                    gl.displaycond2("holidaytlist", "month", "'" + DropDownList1.SelectedValue + "'", "year", "'" + DropDownList2.SelectedValue + "'", GridView1);

                }

            }
        }
        catch
        { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Holidaylistshow.aspx");
    }
}