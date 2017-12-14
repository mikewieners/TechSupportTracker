using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TSTModel;

public partial class Requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cbClosedTickets_CheckedChanged(object sender, EventArgs e)
    {
        if (cbClosedTickets.Checked)
        {
            gvTickets.DataSourceID = dsClosedTickets.ID;
        }
        else
        {
            gvTickets.DataSourceID = dsOpenTickets.ID;
        }
    }
    protected void Button2_PreRender(object sender, EventArgs e)
    {
        ((Button)sender).Text = cbClosedTickets.Checked ? "Reopen Ticket" : "Close Ticket";
        ((Button)sender).OnClientClick = cbClosedTickets.Checked ? "return confirm('Click OK to confirm this issue has been reopened.')" :
            "return confirm('Click OK to confirm this issue has been closed.')";
    }
    protected void btnNewRequest_Click(object sender, EventArgs e)
    {
        //change to detailsview in insert mode
        mvRequests.SetActiveView(vwTicketDetails);
        dvTicketDetails.ChangeMode(DetailsViewMode.Insert);
    }
    protected void dsSelectedTicket_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //return to gridview
        mvRequests.SetActiveView(vwGridviewRequests);
        //change detailsview to readonly and databind the gridview
        dvTicketDetails.ChangeMode(DetailsViewMode.ReadOnly);
        gvTickets.DataBind();
    }
    protected void dsSelectedTicket_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        //return to the gridview
        mvRequests.SetActiveView(vwGridviewRequests);
        //change detailsview to readonly and databind the gridview
        dvTicketDetails.ChangeMode(DetailsViewMode.ReadOnly);
        gvTickets.DataBind();
    }
    protected void gvTickets_DataBound(object sender, EventArgs e)
    {
        if (!User.IsInRole("technician"))
        {
            gvTickets.Columns[gvTickets.Columns.Count - 1].Visible = false;
        }
    }

    //hand-coded method to hide controls from unauthenticated users
    protected void HideControlFromAnonymous_PreRender(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            ((Control)sender).Visible = false;
        }
    }
    //method hides the edit button from users, only allowing techs and admins to edit
    protected void dvTicketDetails_DataBound(object sender, EventArgs e)
    {
        if (dvTicketDetails.CurrentMode == DetailsViewMode.Insert)
        {
            dvTicketDetails.Rows[1].Visible = false;
            dvTicketDetails.Rows[2].Visible = false;
            dvTicketDetails.Rows[3].Visible = false;
            dvTicketDetails.Rows[5].Visible = false;
            dvTicketDetails.Rows[6].Visible = false;
            dvTicketDetails.Rows[7].Visible = false;
            dvTicketDetails.Rows[8].Visible = false;
            dvTicketDetails.Rows[9].Visible = false;
        }
        else
        {
            if (!User.IsInRole("technician") && dvTicketDetails.Rows.Count > 0 && dvTicketDetails.CurrentMode == DetailsViewMode.ReadOnly)
            {
                dvTicketDetails.Rows[dvTicketDetails.Rows.Count - 1].Visible = false;
            }
        }
    }
    //for form view or templated gridview, hide controls from non-admin users
    protected void AdminControl_PreRender(object sender, EventArgs e)
    {
        if (!User.IsInRole("admin"))
        {
            ((Control)sender).Visible = false;
        }
    }
    protected void dsSelectedTicket_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        //if the status was closed when editing began
        TSTEntities ctx = new TSTEntities();

        int status = (from i in ctx.TSTRequests
                      where i.RequestID == (int)gvTickets.SelectedValue
                      select i.RequestStatusID).Single();

        DropDownList newStatus = (DropDownList)dvTicketDetails.FindControl("DropDownList1");
        if (newStatus.SelectedIndex < 3)
        {
            e.Command.Parameters["@ClosedDate"].Value = null;
        }
        else
        {
            if (status == 4)
            {
                e.Command.Parameters["@ClosedDate"].Value = (from i in ctx.TSTRequests
                                                             where i.RequestID == (int)gvTickets.SelectedValue
                                                             select i.ClosedDate).Single();
            }
            else
            {
                e.Command.Parameters["@ClosedDate"].Value = DateTime.Now;
            }
        }

        //get existing notes from the database
        string techNotes = (from i in ctx.TSTRequests
                      where i.RequestID == (int)gvTickets.SelectedValue
                      select i.TechNotes).Single();

        //get the textbox control and the notes inside of it
        TextBox notesAdded = (TextBox)dvTicketDetails.FindControl("TextBox3");
        string newNotes = notesAdded.Text;

        //see if there were existing notes
        if (techNotes != null)
        {
            //if there are existing notes, append newly added notes with tech's username and datetimestamp
            e.Command.Parameters["@TechNotes"].Value = DateTime.Now.ToString() + " - " + User.Identity.Name +
                "</br>" + newNotes + "</br></br>" + techNotes;
        }
        else
        {
            //populate the field with the notes added by the tech
            e.Command.Parameters["@TechNotes"].Value = DateTime.Now.ToString() + " - " + User.Identity.Name + newNotes;
        }



    }

    protected void gvTickets_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvRequests.SetActiveView(vwTicketDetails);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        dvTicketDetails.ChangeMode(DetailsViewMode.ReadOnly);
        mvRequests.SetActiveView(vwGridviewRequests);
    }
}