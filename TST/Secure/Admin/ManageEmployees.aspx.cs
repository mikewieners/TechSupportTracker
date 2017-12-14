using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TSTModel;


public partial class Admin_ManageEmployees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cbInactiveEEs_CheckedChanged(object sender, EventArgs e)
    {
        if (cbInactiveEEs.Checked)
        {
            gvEmployees.DataSourceID = dsInactiveEmployees.ID;
        }
        else
        {
            gvEmployees.DataSourceID = dsActiveEmployees.ID;
        }
    }
    protected void gvDepartments_SelectedIndexChanged(object sender, EventArgs e)
    {
        //switch to the details view
        mvEmployees.SetActiveView(vwDetailsview);
        //dv is in readonly
        dvSelectedEmployee.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void btnAddEmployee_Click(object sender, EventArgs e)
    {
        //change to the details view
        mvEmployees.SetActiveView(vwDetailsview);
        //dv is in insert mode
        dvSelectedEmployee.ChangeMode(DetailsViewMode.Insert);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        //disable viewstate to rectify 'unable to load viewstate' error when clicking back from edit mode then reentering from GV
        dvSelectedEmployee.EnableViewState = false;
        //change to the gridview
        mvEmployees.SetActiveView(vwGridview);
    }
    protected void Button2_PreRender(object sender, EventArgs e)
    {
        ((Button)sender).Text = cbInactiveEEs.Checked ? "Make Active" : "Make Inactive";
        ((Button)sender).OnClientClick = cbInactiveEEs.Checked ? "return confirm('Click OK to confirm Employee is now Active.')" :
            "return confirm('Click OK to confirm Employee is now inactive.')";
    }

    protected void dsSelectedEmployee_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //bind data and return to the gridview
        mvEmployees.SetActiveView(vwGridview);
        dvSelectedEmployee.ChangeMode(DetailsViewMode.ReadOnly);
        gvEmployees.DataBind();
    }
    protected void dsSelectedEmployee_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        //bind data and return to the gridview
        mvEmployees.SetActiveView(vwDetailsview);
        dvSelectedEmployee.ChangeMode(DetailsViewMode.ReadOnly);
        gvEmployees.DataBind();
    }
    protected void dsSelectedEmployee_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //to add employee image: locate the control and assign it to a new variable
        FileUpload eeImageUpload = (FileUpload)dvSelectedEmployee.FindControl("FileUpload1");
        //...then see if there is anything there
        if (eeImageUpload.HasFile)
        {
            //if there is, get the name of the file then grab the extension
            string img = eeImageUpload.FileName;
            string ext = img.Substring(img.LastIndexOf("."));

            //create a new, unique filename with a guid and add ack the ext
            string imgNewname = Guid.NewGuid().ToString();
            imgNewname += ext;

            //save the file to the webserver and the url path to the database
            eeImageUpload.SaveAs(Server.MapPath("~/EmployeeImages/" + imgNewname));
            e.Command.Parameters["@EmployeeImage"].Value = imgNewname;
        }
        //if there wasn't anything there, we'll use the default
        else
        {
            e.Command.Parameters["@EmployeeImage"].Value = "~/EmployeeImages/NoImage.jpg";
        }
    }
    protected void dsSelectedEmployee_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        //to update existing employee image:
        //locate the control and assign it to a new variable
        FileUpload eeImageUpload = (FileUpload)dvSelectedEmployee.FindControl("FileUpload1");
        //...then see if there is anything there
        if (eeImageUpload.HasFile)
        {
            //if there is, get the name of the file then grab the extension
            string img = eeImageUpload.FileName;
            string ext = img.Substring(img.LastIndexOf("."));

            //create a new, unique filename with a guid and add ack the ext
            string imgNewname = Guid.NewGuid().ToString();
            imgNewname += ext;

            //save the file to the webserver and the url path to the database
            eeImageUpload.SaveAs(Server.MapPath("~/EmployeeImages/" + imgNewname));
            e.Command.Parameters["@EmployeeImage"].Value = imgNewname;
        }
        //if there wasn't anything there, we'll use the current image
        else
        {
            TSTEntities ctx = new TSTEntities();

            string img = (from i in ctx.TSTEmployees
                          where i.EmployeeID == (int)gvEmployees.SelectedValue
                          select i.EmployeeImage).Single();

            e.Command.Parameters["@EmployeeImage"].Value = img;
        }

    }

}