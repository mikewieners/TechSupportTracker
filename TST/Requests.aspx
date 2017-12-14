<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Requests.aspx.cs" Inherits="Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <script>
        $(document).ready(function () {
            $('#requests').addClass('active');
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">

    <!--LOGGED-IN USER CONTENT - Your open tickets;submit a ticket button-->
    <asp:MultiView ID="mvRequests" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwGridviewRequests" runat="server">
            <!--VIEW User Default 'vwTickets'-->
            <div class="row">
                <div class="col-lg-12">
                    <h1>Requests <small>Submit/Review Requests</small></h1>
                    <ol class="breadcrumb">
                        <li><a id="A2" runat="server" href="#"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active"><i class="icon-table"></i>Tables</li>
                    </ol>
                    <asp:CheckBox ID="cbClosedTickets" runat="server" OnCheckedChanged="cbClosedTickets_CheckedChanged" AutoPostBack="True" Text="Show Closed Requests" />
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="table-responsive">
                        <asp:GridView ID="gvTickets" runat="server" AllowPaging="True" class="table table-hover tablesorter" DataKeyNames="RequestID" Sorting="True" AutoGenerateColumns="False" DataSourceID="dsOpenTickets" OnDataBound="gvTickets_DataBound" OnSelectedIndexChanged="gvTickets_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-lg btn-primary" Text="Select" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RequestDate" DataFormatString="{0:d}" HeaderText="Date Submitted" HtmlEncode="False" SortExpression="RequestDate" />
                                <asp:BoundField DataField="ClosedDate" DataFormatString="{0:d}" HeaderText="Date Completed" HtmlEncode="False" SortExpression="ClosedDate" />
                                <asp:BoundField DataField="Requester Name" HeaderText="Requested By" SortExpression="Requester Name" />
                                <asp:BoundField DataField="RequestStatusDescription" HeaderText="Status" SortExpression="RequestStatusDescription" />
                                <asp:BoundField DataField="Technician Assigned" HeaderText="Technician Name" SortExpression="Technician Assigned" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-warning btn-lg" Text="Delete" OnPreRender="Button2_PreRender" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsOpenTickets" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" DeleteCommand="UPDATE TSTRequests 
SET RequestStatusID = 4, ClosedDate = GETDATE()
WHERE (RequestID = @RequestID)
"
                            InsertCommand="INSERT INTO [TSTRequests] ([RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (@RequestDate, @ClosedDate, @RequesterNotes, @TechNotes, @RequestStatusID, @RequesterID, @TechID)" SelectCommand="SELECT TSTRequests.RequestID, TSTRequests.RequestDate, TSTRequests.ClosedDate, TSTRequests.RequesterNotes, TSTRequests.TechNotes, TSTRequests.RequestStatusID, TSTRequests.RequesterID, TSTRequests.TechID, TSTDepartments.DepartmentName, TSTEmployees.Title, TSTEmployees.FName + ' ' + TSTEmployees.LName AS [Requester Name], TSTEmployees.Phone, TSTEmployees.Email, TSTRequestStatuses.RequestStatusDescription, Technicians.Title AS TechTitle, Technicians.FName + ' ' + Technicians.LName AS [Technician Assigned], Technicians.Phone AS TechPhone, Technicians.Email AS TechEmail, Technicians.EmployeeImage AS TechImage, TSTEmployees.EmployeeImage AS RequesterImage FROM TSTRequests LEFT OUTER JOIN TSTRequestStatuses ON TSTRequests.RequestStatusID = TSTRequestStatuses.RequestStatusID LEFT OUTER JOIN TSTEmployees ON TSTRequests.RequesterID = TSTEmployees.EmployeeID RIGHT OUTER JOIN TSTDepartments ON TSTEmployees.EmpDepartmentID = TSTDepartments.DepartmentID LEFT OUTER JOIN TSTEmployees AS Technicians ON TSTRequests.TechID = Technicians.EmployeeID WHERE (TSTRequests.RequestStatusID &lt; @RequestStatusID)" UpdateCommand="UPDATE [TSTRequests] SET [RequestDate] = @RequestDate, [ClosedDate] = @ClosedDate, [RequesterNotes] = @RequesterNotes, [TechNotes] = @TechNotes, [RequestStatusID] = @RequestStatusID, [RequesterID] = @RequesterID, [TechID] = @TechID WHERE [RequestID] = @RequestID">
                            <DeleteParameters>
                                <asp:Parameter Name="RequestID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="RequestDate" Type="DateTime" />
                                <asp:Parameter Name="ClosedDate" Type="DateTime" />
                                <asp:Parameter Name="RequesterNotes" Type="String" />
                                <asp:Parameter Name="TechNotes" Type="String" />
                                <asp:Parameter Name="RequestStatusID" Type="Int32" />
                                <asp:Parameter Name="RequesterID" Type="Int32" />
                                <asp:Parameter Name="TechID" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="4" Name="RequestStatusID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="RequestDate" Type="DateTime" />
                                <asp:Parameter Name="ClosedDate" Type="DateTime" />
                                <asp:Parameter Name="RequesterNotes" Type="String" />
                                <asp:Parameter Name="TechNotes" Type="String" />
                                <asp:Parameter Name="RequestStatusID" Type="Int32" />
                                <asp:Parameter Name="RequesterID" Type="Int32" />
                                <asp:Parameter Name="TechID" Type="Int32" />
                                <asp:Parameter Name="RequestID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsClosedTickets" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" DeleteCommand="UPDATE TSTRequests SET RequestStatusID = 3, ClosedDate=NULL
WHERE (RequestID = @RequestID)"
                            InsertCommand="INSERT INTO [TSTRequests] ([RequestDate], [ClosedDate], [RequesterNotes], [TechNotes], [RequestStatusID], [RequesterID], [TechID]) VALUES (@RequestDate, @ClosedDate, @RequesterNotes, @TechNotes, @RequestStatusID, @RequesterID, @TechID)" SelectCommand="SELECT TSTRequests.RequestID, TSTRequests.RequestDate, TSTRequests.ClosedDate, TSTRequests.RequesterNotes, TSTRequests.TechNotes, TSTRequests.RequestStatusID, TSTRequests.RequesterID, TSTRequests.TechID, TSTDepartments.DepartmentName, TSTEmployees.Title, TSTEmployees.FName + ' ' + TSTEmployees.LName AS [Requester Name], TSTEmployees.Phone, TSTEmployees.Email, TSTRequestStatuses.RequestStatusDescription, Technicians.Title AS TechTitle, Technicians.FName + ' ' + Technicians.LName AS [Technician Assigned], Technicians.Phone AS TechPhone, Technicians.Email AS TechEmail, Technicians.EmployeeImage AS TechImage, TSTEmployees.EmployeeImage AS RequesterImage FROM TSTRequests LEFT OUTER JOIN TSTRequestStatuses ON TSTRequests.RequestStatusID = TSTRequestStatuses.RequestStatusID LEFT OUTER JOIN TSTEmployees ON TSTRequests.RequesterID = TSTEmployees.EmployeeID RIGHT OUTER JOIN TSTDepartments ON TSTEmployees.EmpDepartmentID = TSTDepartments.DepartmentID LEFT OUTER JOIN TSTEmployees AS Technicians ON TSTRequests.TechID = Technicians.EmployeeID WHERE (TSTRequests.RequestStatusID = @RequestStatusID)" UpdateCommand="UPDATE [TSTRequests] SET [RequestDate] = @RequestDate, [ClosedDate] = @ClosedDate, [RequesterNotes] = @RequesterNotes, [TechNotes] = @TechNotes, [RequestStatusID] = @RequestStatusID, [RequesterID] = @RequesterID, [TechID] = @TechID WHERE [RequestID] = @RequestID">
                            <DeleteParameters>
                                <asp:Parameter Name="RequestID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="RequestDate" Type="DateTime" />
                                <asp:Parameter Name="ClosedDate" Type="DateTime" />
                                <asp:Parameter Name="RequesterNotes" Type="String" />
                                <asp:Parameter Name="TechNotes" Type="String" />
                                <asp:Parameter Name="RequestStatusID" Type="Int32" />
                                <asp:Parameter Name="RequesterID" Type="Int32" />
                                <asp:Parameter Name="TechID" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="4" Name="RequestStatusID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="RequestDate" Type="DateTime" />
                                <asp:Parameter Name="ClosedDate" Type="DateTime" />
                                <asp:Parameter Name="RequesterNotes" Type="String" />
                                <asp:Parameter Name="TechNotes" Type="String" />
                                <asp:Parameter Name="RequestStatusID" Type="Int32" />
                                <asp:Parameter Name="RequesterID" Type="Int32" />
                                <asp:Parameter Name="TechID" Type="Int32" />
                                <asp:Parameter Name="RequestID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <!--/.row -->
            <!--END OF VIEW 'vwTickets'-->
            <div class="row">
                <div class="col-lg-6">
                    <asp:Button ID="btnNewRequest" runat="server" Text="Submit a new request" CssClass="btn btn-lg btn-success btn-block" OnClick="btnNewRequest_Click" OnPreRender="HideControlFromAnonymous_PreRender" />
                </div>
            </div>

        </asp:View>


        <asp:View ID="vwTicketDetails" runat="server">
            <!--VIEW Details 'vwTktDetail'-->
            <div class="row">
                <div class="col-lg-12">
                    <h1>Requests <small>Ticket Details</small></h1>
                    <ol class="breadcrumb">
                        <li><a id="A5" runat="server" href="#"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active"><i class="icon-table"></i>Tables</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-6">
                    <div class="table-responsive">
                        <asp:DetailsView ID="dvTicketDetails" runat="server" class="table table-hover" AutoGenerateRows="False" DataSourceID="dsSelectedTicket" OnDataBound="dvTicketDetails_DataBound" DataKeyNames="RequestID">
                            <Fields>
                                <asp:TemplateField HeaderText="Requested By" SortExpression="Requester Name">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("[Requester Name]") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        Enter Your Employee ID:<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RequesterID", "{0}") %>' TextMode="Number"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("[Requester Name]") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact Info" SortExpression="ReqContactInfo">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("ReqContactInfo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("ReqContactInfo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location and Title" SortExpression="RequesterDeptTitle">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("RequesterDeptTitle") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("RequesterDeptTitle") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Submitted On" SortExpression="RequestDate">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("RequestDate", "{0:d}") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("RequestDate", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Problem Description" SortExpression="RequesterNotes">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("RequesterNotes") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Rows="5" Text='<%# Bind("RequesterNotes") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("RequesterNotes") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assigned Technician" SortExpression="Technician Assigned">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("[Technician Assigned]") %>'></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TechName" DataValueField="EmployeeID" SelectedValue='<%# Bind("TechID") %>' AppendDataBoundItems="True">
                                            <asp:ListItem Value="0">[-No Tech Assigned-]</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" SelectCommand="SELECT EmployeeID, FName + ' ' + LName AS TechName, IsActive FROM TSTEmployees WHERE (EmpDepartmentID = @EmpDepartmentID) AND (IsActive = @IsActive) UNION ALL SELECT NULL AS Expr1, '[ - No Tech Assigned - ]' AS Expr3, NULL AS Expr2">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="5" Name="EmpDepartmentID" Type="Int32" />
                                                <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;&nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Technician Assigned]") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact Info" SortExpression="TechContactInfo">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("TechContactInfo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("TechContactInfo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Technician's Comments" SortExpression="TechNotes">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Rows="5" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please add comments to update the ticket.</asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("TechNotes") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Current Status" SortExpression="RequestStatusDescription">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("RequestStatusDescription") %>'></asp:Label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="RequestStatusDescription" DataValueField="RequestStatusID" SelectedValue='<%# Bind("RequestStatusID") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" SelectCommand="SELECT * FROM [TSTRequestStatuses]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;&nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("RequestStatusDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Closed On" SortExpression="ClosedDate">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("ClosedDate", "{0:d}") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        &nbsp;
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("ClosedDate", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button3" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success btn-lg" Text="Update" />
                                        &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-warning btn-lg" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button3" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success btn-lg" Text="Submit" />
                                        &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-warning btn-lg" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-lg btn-primary" Text="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="dsSelectedTicket" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" DeleteCommand="DELETE FROM [TSTRequests] WHERE [RequestID] = @RequestID" InsertCommand="INSERT INTO TSTRequests(RequestDate, RequesterNotes, RequestStatusID, RequesterID, TechID) VALUES (GETDATE(), @RequesterNotes, 1, @RequesterID, @TechID)" SelectCommand="SELECT TSTRequests.RequestID, TSTRequests.RequestDate, TSTRequests.ClosedDate, TSTRequests.RequesterNotes, TSTRequests.TechNotes, TSTRequests.RequestStatusID, TSTRequests.RequesterID, TSTRequests.TechID, TSTDepartments.DepartmentName + ' - ' + TSTEmployees.Title AS RequesterDeptTitle, TSTEmployees.FName + ' ' + TSTEmployees.LName AS [Requester Name], 'Phone: ' + TSTEmployees.Phone + '&lt;br/&gt;Email: ' + TSTEmployees.Email AS ReqContactInfo, TSTRequestStatuses.RequestStatusDescription, Technicians.Title AS TechTitle, Technicians.FName + ' ' + Technicians.LName AS [Technician Assigned], 'Phone: ' + Technicians.Phone + '&lt;br/&gt;Email: ' + Technicians.Email AS TechContactInfo, Technicians.EmployeeImage AS TechImage, TSTEmployees.EmployeeImage AS RequesterImage FROM TSTRequests LEFT OUTER JOIN TSTRequestStatuses ON TSTRequests.RequestStatusID = TSTRequestStatuses.RequestStatusID LEFT OUTER JOIN TSTEmployees ON TSTRequests.RequesterID = TSTEmployees.EmployeeID RIGHT OUTER JOIN TSTDepartments ON TSTEmployees.EmpDepartmentID = TSTDepartments.DepartmentID LEFT OUTER JOIN TSTEmployees AS Technicians ON TSTRequests.TechID = Technicians.EmployeeID WHERE (TSTRequests.RequestID = @RequestID)" UpdateCommand="UPDATE [TSTRequests] SET [TechNotes] = @TechNotes, [RequestStatusID] = @RequestStatusID, [TechID] = @TechID, ClosedDate = @ClosedDate WHERE [RequestID] = @RequestID" OnInserted="dsSelectedTicket_Inserted" OnUpdated="dsSelectedTicket_Updated" OnUpdating="dsSelectedTicket_Updating">
                            <DeleteParameters>
                                <asp:Parameter Name="RequestID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="RequestDate" Type="DateTime" />
                                <asp:Parameter Name="ClosedDate" Type="DateTime" />
                                <asp:Parameter Name="RequesterNotes" Type="String" />
                                <asp:Parameter Name="TechNotes" Type="String" />
                                <asp:Parameter Name="RequestStatusID" Type="Int32" />
                                <asp:Parameter Name="RequesterID" Type="Int32" />
                                <asp:Parameter Name="TechID" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvTickets" Name="RequestID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="RequestDate" Type="DateTime" />
                                <asp:Parameter Name="ClosedDate" Type="DateTime" />
                                <asp:Parameter Name="RequesterNotes" Type="String" />
                                <asp:Parameter Name="TechNotes" Type="String" />
                                <asp:Parameter Name="RequestStatusID" Type="Int32" />
                                <asp:Parameter Name="RequesterID" Type="Int32" />
                                <asp:Parameter Name="TechID" Type="Int32" />
                                <asp:Parameter Name="RequestID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <!--/.row-->
            <!--END VIEW 'vwUserDetails'-->
            <div class="row">
                <div class="col-lg-6">
                    <asp:Button ID="btnBack" runat="server" Text="Return to all requests" CausesValidation="False" CssClass="btn btn-lg btn-primary btn-block" OnClick="btnBack_Click" />
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

