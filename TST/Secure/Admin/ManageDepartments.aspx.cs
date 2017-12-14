using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageDepartments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvDepartments_SelectedIndexChanged(object sender, EventArgs e)
    {
        //switch view to details view
        mvDepartments.SetActiveView(vwDetails);
        //dv is in readonly
        dvSelectedDepartment.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void btnAddDepartment_Click(object sender, EventArgs e)
    {
        //switch view to details view
        mvDepartments.SetActiveView(vwDetails);
        //change details view mode to insert
        dvSelectedDepartment.ChangeMode(DetailsViewMode.Insert);
    }
    protected void dsSelectedDepartment_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //switch view to gridview
        mvDepartments.SetActiveView(vwGridview);
        //databind
        gvDepartments.DataBind();
        //return details view to readonly
        dvSelectedDepartment.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void dsSelectedDepartment_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        //switch view to gridview
        mvDepartments.SetActiveView(vwGridview);
        //databind
        gvDepartments.DataBind();
        //return details view to readonly
        dvSelectedDepartment.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        //switch view to gridview
        mvDepartments.SetActiveView(vwGridview);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //cancel insert/update from the detailsview
        //switch the view back to gridview
        mvDepartments.SetActiveView(vwGridview);
    }

}