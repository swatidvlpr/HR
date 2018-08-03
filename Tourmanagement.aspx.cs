using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Tourmanagement : System.Web.UI.Page
{
    
    global gl = new global();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //gl.ddl("tour_exp_master", "tourlocation", "expence_id", DropDownList1);
            gl.query("SELECT expence_id, tourlocation FROM  dbo.tour_exp_master union select 0,'select'");
            DropDownList1.DataSource = gl.ds;
            DropDownList1.DataTextField = "tourlocation";
            DropDownList1.DataValueField = "expence_id";
            DropDownList1.DataBind();
            gl.display("tour_mgmnt", GridView1);
            //display();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int status_hr = 0;
        int status_hod = 0;
        if (Button1.Text == "update")
        {
            string intime = TextBox4.Text +' '+ DropDownList2.SelectedItem.Text;
            string outtime = TextBox3.Text + ' ' + DropDownList3.SelectedItem.Text;
            string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();

            gl.update("tour_mgmnt", "Employeecode='" + TextBox1.Text + "',Name='" + TextBox2.Text + "',outtime='" + outtime + "',intime='" + intime + "',In_date='" + TextBox5.Text + "',tourlocation='" + DropDownList1.SelectedItem.Text + "',buget='" + TextBox6.Text + "',Out_Date='"+TextBox7.Text+"'", "tour_id", "'" + idd + "'");
            Label1.Text = "update successfully";

        }
        else
        {
            string intime = TextBox4.Text + ' ' + DropDownList2.SelectedItem.Text;
            string outtime = TextBox3.Text + ' ' + DropDownList3.SelectedItem.Text;
           
                                                                                                                                  //Employeecode,              Name,              outtime,         intime,          date,                     tourlocation,                   buget,            status_hr,           status_hod

            gl.insert1("tour_mgmnt", " Employeecode, Name, outtime, intime, In_date, tourlocation, buget, status_hr, status_hod,Out_Date", "'" + TextBox1.Text + "','" + TextBox2.Text + "','" + outtime + "','" + intime + "','" + TextBox5.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox6.Text + "','" + status_hr + "','" + status_hod + "','"+TextBox7.Text+"'");
            Label1.Text = "Submit successfully";
        }
        gl.display("tour_mgmnt", GridView1);
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        //DropDownList1.SelectedIndex = "";
        //DropDownList2.SelectedIndex = "";
        //DropDownList3.SelectedIndex = "";
        Button1.Text = "submit";
        //display();
            
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string idd = Convert.ToInt32(GridView1.SelectedValue).ToString();
            gl.read1("tour_mgmnt", "tour_id", "'" + idd + "'");
            string tourlocation = gl.ds.Tables[0].Rows[0]["tourlocation"].ToString();
            for (int i = 0; i < DropDownList1.Items.Count; i++)
            {
                if (DropDownList1.Items[i].Text == tourlocation)
                {
                    DropDownList1.Items[i].Selected = true;
                }
                else
                {
                    DropDownList1.Items[i].Selected = false;
                }

            }
            TextBox1.Text = gl.ds.Tables[0].Rows[0]["Employeecode"].ToString();
            TextBox2.Text = gl.ds.Tables[0].Rows[0]["Name"].ToString();
           //TextBox3.Text =

            string str = null;
            string[] strArr = null;
            //int count = 0;
            str = gl.ds.Tables[0].Rows[0]["outtime"].ToString();
            char[] splitchar = { ' ' };
            strArr = str.Split(splitchar);
            String s = strArr[0].ToString();
            String s1 = strArr[1].ToString();
            TextBox3.Text = s.ToString();
            //for (int i = 0; i < DropDownList2.Items.Count; i++)
            //{
            //    if (DropDownList2.Items[i].Text == s1)
            //    {
            //        DropDownList2.Items[i].Selected = true;
            //    }
            
            //}
            //string Leave_type = gl.ds.Tables[0].Rows[0]["Leave_type"].ToString();
            DropDownList2.ClearSelection();
            DropDownList2.Items.FindByText(s1).Selected = true;


            string str1 = null;
            string[] strArr1 = null;

            str1 = gl.ds.Tables[0].Rows[0]["intime"].ToString();
            char[] splitchar1 = { ' ' };
            strArr1 = str1.Split(splitchar1);
            String s2 = strArr1[0].ToString();
            String s3 = strArr1[1].ToString();

            TextBox4.Text = s2.ToString();
            DropDownList3.ClearSelection();
            DropDownList3.Items.FindByText(s3).Selected = true;
                //TextBox4.Text = gl.ds.Tables[0].Rows[0]["intime"].ToString();
            TextBox5.Text = gl.ds.Tables[0].Rows[0]["In_date"].ToString();
            TextBox7.Text = gl.ds.Tables[0].Rows[0]["Out_Date"].ToString();
            String bugett = gl.ds.Tables[0].Rows[0]["buget"].ToString();
            TextBox6.Text = Convert.ToDecimal(bugett).ToString("N"); ; 
            Button1.Text = "update";
        }
        catch { }
    
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id1 = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        gl.delete("tour_mgmnt", "tour_id", "'" + id1 + "'");
        gl.display("tour_mgmnt", GridView1);
        //display();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Tourmanagement.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        gl.query("select * from tour_exp_master where tourlocation='" + DropDownList1.SelectedItem.Text + "'");
        
          string buget=gl.ds.Tables[0].Rows[0]["buget"].ToString();
          TextBox6.Text = Convert.ToDecimal(buget).ToString("N");
    }
    //public void display()
    //{
    //    gl.query("SELECT dbo.tour_exp_master.expence_id, dbo.tour_exp_master.tourlocation, dbo.tour_mgmnt.tour_id FROM  dbo.tour_exp_master INNER JOIN dbo.tour_mgmnt ON dbo.tour_exp_master.tourlocation = dbo.tour_mgmnt.tourlocation");
    //    GridView1.DataSource = gl.ds;
    //    GridView1.DataBind();
    //}
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        gl.query("select * from Employee_Reg where EmployeeCode='" + TextBox1.Text + "'");
        TextBox2.Text = gl.ds.Tables[0].Rows[0]["Name"].ToString();
    }
}