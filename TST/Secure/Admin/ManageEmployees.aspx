<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageEmployees.aspx.cs" Inherits="Admin_ManageEmployees" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
     <script>
         $(document).ready(function () {
             $('#manage-ees').addClass('active');
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:MultiView ID="mvEmployees" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwGridview" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1>ADMIN <small>Manage Employees</small></h1>
                    <ol class="breadcrumb">
                        <li><a id="A1" runat="server" href="#"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active"><i class="icon-table"></i>Tables</li>
                    </ol>
                    <asp:CheckBox ID="cbInactiveEEs" runat="server" OnCheckedChanged="cbInactiveEEs_CheckedChanged" AutoPostBack="True" Text="Show inactive employees" />
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="table-responsive">

                        <asp:GridView ID="gvEmployees" runat="server" class="table table-hover tablesorter" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="dsActiveEmployees" OnSelectedIndexChanged="gvDepartments_SelectedIndexChanged" AllowPaging="True">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" CssClass="btn btn-lg btn-primary" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name&lt;i class=&quot;icon-sort&quot;&gt;&lt;/i&gt;" SortExpression="LName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("LName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name&lt;i class=&quot;icon-sort&quot;&gt;&lt;/i&gt;" SortExpression="FName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email Address&lt;i class=&quot;icon-sort&quot;&gt;&lt;/i&gt;" SortExpression="Email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department&lt;i class=&quot;icon-sort&quot;&gt;&lt;/i&gt;" SortExpression="DepartmentName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Job Title&lt;i class=&quot;icon-sort&quot;&gt;&lt;/i&gt;" SortExpression="Title">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-lg btn-danger" OnPreRender="Button2_PreRender" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <asp:Button ID="btnAddEmployee" class="btn btn-primary btn-lg btn-block" runat="server" Text="Add a new employee" OnClick="btnAddEmployee_Click" />
                </div>
            </div>
            <asp:SqlDataSource ID="dsActiveEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" DeleteCommand="UPDATE [TSTEmployees] SET [IsActive] = 'FALSE' WHERE EmployeeID = @EmployeeID" InsertCommand="INSERT INTO [TSTEmployees] ([Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (@Title, @FName, @LName, @Phone, @Email, @HireDate, @Notes, @IsActive, @EmpDepartmentID, @Location, @EmployeeImage)" SelectCommand="SELECT TSTEmployees.EmployeeID, TSTEmployees.Title, TSTEmployees.FName, TSTEmployees.LName, TSTEmployees.Phone, TSTEmployees.Email, TSTEmployees.HireDate, TSTEmployees.Notes, TSTEmployees.IsActive, TSTEmployees.EmpDepartmentID, TSTEmployees.Location, TSTEmployees.EmployeeImage, TSTDepartments.DepartmentName FROM TSTEmployees INNER JOIN TSTDepartments ON TSTEmployees.EmpDepartmentID = TSTDepartments.DepartmentID WHERE (TSTEmployees.IsActive = 'TRUE') ORDER BY TSTEmployees.LName" UpdateCommand="UPDATE [TSTEmployees] SET [Title] = @Title, [FName] = @FName, [LName] = @LName, [Phone] = @Phone, [Email] = @Email, [HireDate] = @HireDate, [Notes] = @Notes, [IsActive] = @IsActive, [EmpDepartmentID] = @EmpDepartmentID, [Location] = @Location, [EmployeeImage] = @EmployeeImage WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="EmpDepartmentID" Type="Int32" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="EmployeeImage" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="EmpDepartmentID" Type="Int32" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="EmployeeImage" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsInactiveEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" DeleteCommand="UPDATE [TSTEmployees] SET [IsActive] = 'TRUE' WHERE EmployeeID = @EmployeeID" InsertCommand="INSERT INTO [TSTEmployees] ([Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (@Title, @FName, @LName, @Phone, @Email, @HireDate, @Notes, @IsActive, @EmpDepartmentID, @Location, @EmployeeImage)" SelectCommand="SELECT TSTEmployees.EmployeeID, TSTEmployees.Title, TSTEmployees.FName, TSTEmployees.LName, TSTEmployees.Phone, TSTEmployees.Email, TSTEmployees.HireDate, TSTEmployees.Notes, TSTEmployees.IsActive, TSTEmployees.EmpDepartmentID, TSTEmployees.Location, TSTEmployees.EmployeeImage, TSTDepartments.DepartmentName FROM TSTEmployees INNER JOIN TSTDepartments ON TSTEmployees.EmpDepartmentID = TSTDepartments.DepartmentID WHERE (TSTEmployees.IsActive = 'FALSE') ORDER BY TSTEmployees.LName" UpdateCommand="UPDATE [TSTEmployees] SET [Title] = @Title, [FName] = @FName, [LName] = @LName, [Phone] = @Phone, [Email] = @Email, [HireDate] = @HireDate, [Notes] = @Notes, [IsActive] = @IsActive, [EmpDepartmentID] = @EmpDepartmentID, [Location] = @Location, [EmployeeImage] = @EmployeeImage WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="EmpDepartmentID" Type="Int32" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="EmployeeImage" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="EmpDepartmentID" Type="Int32" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="EmployeeImage" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="vwDetailsview" runat="server">
            <div class="row">
                <div class="col-lg-12">
                    <h1>ADMIN <small>Add/Edit Employee</small></h1>
                    <ol class="breadcrumb">
                        <li><a id="A2" runat="server" href="#"><i class="icon-dashboard"></i>Dashboard</a></li>
                        <li class="active"><i class="icon-table"></i>Tables</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="table-responsive">

                        <asp:DetailsView ID="dvSelectedEmployee" runat="server" class="table table-bordered table-hover tablesorter" AutoGenerateRows="False" DataKeyNames="EmployeeID" DataSourceID="dsSelectedEmployee">
                            <Fields>
                                <asp:TemplateField SortExpression="EmployeeImage">
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("EmployeeImage", "~/EmployeeImages/{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name" SortExpression="FName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FName") %>' Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="*A first name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FName") %>' Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="*A first name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name" SortExpression="LName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("LName") %>' Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="*A last name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("LName") %>' Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="*A last name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("LName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department" SortExpression="DepartmentName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("EmpDepartmentID") %>' Width="50%" AppendDataBoundItems="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" SelectCommand="SELECT * FROM [TSTDepartments]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentID" SelectedValue='<%# Bind("EmpDepartmentID") %>' Width="50%" TabIndex="-1" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="-1">[ Choose Department ]</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" SelectCommand="SELECT * FROM [TSTDepartments]"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*Choose a department" InitialValue="-1" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Job Title" SortExpression="Title">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Title") %>' Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Title") %>' Width="100%"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone Number" SortExpression="Phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Phone") %>' TextMode="Phone" Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Phone") %>' TextMode="Phone" Width="100%"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email Address" SortExpression="Email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Email") %>' TextMode="Email" Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Email") %>' TextMode="Email" Width="100%"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hire Date" SortExpression="HireDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>' Width="100%"></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox3"></asp:CalendarExtender>
                                        <br />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>' Width="100%"></asp:TextBox>
                                        <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox3"></asp:CalendarExtender>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Rows="5" Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Rows="5" Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active" SortExpression="IsActive">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsActive") %>' Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-lg btn-success" Text="Update" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-warning btn-lg" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-lg btn-success" Text="Submit" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-warning btn-lg" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary btn-lg" Text="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                    </div>
                    <asp:Button ID="btnBack" class="btn btn-primary btn-lg btn-block" runat="server" Text="Back to Manage Employees" OnClick="btnBack_Click" CausesValidation="False" />
                </div>
            </div>
            <asp:SqlDataSource ID="dsSelectedEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" DeleteCommand="DELETE FROM [TSTEmployees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [TSTEmployees] ([Title], [FName], [LName], [Phone], [Email], [HireDate], [Notes], [IsActive], [EmpDepartmentID], [Location], [EmployeeImage]) VALUES (@Title, @FName, @LName, @Phone, @Email, @HireDate, @Notes, @IsActive, @EmpDepartmentID, @Location, @EmployeeImage)" SelectCommand="SELECT TSTEmployees.EmployeeID, TSTEmployees.Title, TSTEmployees.FName, TSTEmployees.LName, TSTEmployees.Phone, TSTEmployees.Email, TSTEmployees.HireDate, TSTEmployees.Notes, TSTEmployees.IsActive, TSTEmployees.EmpDepartmentID, TSTEmployees.Location, TSTEmployees.EmployeeImage, TSTDepartments.DepartmentName FROM TSTEmployees INNER JOIN TSTDepartments ON TSTEmployees.EmpDepartmentID = TSTDepartments.DepartmentID WHERE (TSTEmployees.EmployeeID = @EmployeeID)" UpdateCommand="UPDATE [TSTEmployees] SET [Title] = @Title, [FName] = @FName, [LName] = @LName, [Phone] = @Phone, [Email] = @Email, [HireDate] = @HireDate, [Notes] = @Notes, [IsActive] = @IsActive, [EmpDepartmentID] = @EmpDepartmentID, [Location] = @Location, [EmployeeImage] = @EmployeeImage WHERE [EmployeeID] = @EmployeeID" OnInserted="dsSelectedEmployee_Inserted" OnInserting="dsSelectedEmployee_Inserting" OnUpdated="dsSelectedEmployee_Updated" OnUpdating="dsSelectedEmployee_Updating">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="EmpDepartmentID" Type="Int32" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="EmployeeImage" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvEmployees" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="EmpDepartmentID" Type="Int32" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="EmployeeImage" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

