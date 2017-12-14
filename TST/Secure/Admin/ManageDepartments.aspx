<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageDepartments.aspx.cs" Inherits="Admin_ManageDepartments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
     <script>
         $(document).ready(function () {
             $('#manage-depts').addClass('active');
         });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <h1>ADMIN <small>Manage Departments</small></h1>
            <ol class="breadcrumb">
                <li><a runat="server" href="#"><i class="icon-dashboard"></i>Dashboard</a></li>
                <li class="active"><i class="icon-table"></i>Tables</li>
            </ol>
        </div>
    </div>
    <!-- /.row -->
    <asp:MultiView ID="mvDepartments" ActiveViewIndex="0" runat="server">
        <asp:View ID="vwGridview" runat="server">
            <div class="row">
                <div class="col-lg-6">
                    <div class="table-responsive">

                        <asp:GridView ID="gvDepartments" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DepartmentID" DataSourceID="dsAllDepartments" OnSelectedIndexChanged="gvDepartments_SelectedIndexChanged" CssClass="table table-hover table-sorter">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-lg btn-block" Text="Select" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department &lt;i class=&quot;icon-sort&quot;&gt;&lt;/i&gt;" SortExpression="DepartmentName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description &lt;i class=&quot;icon-sort&quot;&gt;&lt;/i&gt;" SortExpression="DepartmentDescription">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DepartmentDescription") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DepartmentDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger btn-lg btn-block" Text="Delete" OnClientClick="return confirm('Choose OK to confirm department delete')" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <asp:Button ID="btnAddDepartment" class="btn btn-primary btn-lg btn-block" runat="server" Text="Add a new department" OnClick="btnAddDepartment_Click" />
                </div>
            </div>
            <asp:SqlDataSource ID="dsAllDepartments" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" SelectCommand="SELECT * FROM [TSTDepartments]" DeleteCommand="DELETE FROM [TSTDepartments] WHERE [DepartmentID] = @DepartmentID" InsertCommand="INSERT INTO [TSTDepartments] ([DepartmentName], [DepartmentDescription]) VALUES (@DepartmentName, @DepartmentDescription)" UpdateCommand="UPDATE [TSTDepartments] SET [DepartmentName] = @DepartmentName, [DepartmentDescription] = @DepartmentDescription WHERE [DepartmentID] = @DepartmentID">
                <DeleteParameters>
                    <asp:Parameter Name="DepartmentID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                    <asp:Parameter Name="DepartmentDescription" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                    <asp:Parameter Name="DepartmentDescription" Type="String" />
                    <asp:Parameter Name="DepartmentID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="vwDetails" runat="server">
            <div class="row">
                <div class="col-lg-6">
                    <div class="table-responsive">

                        <asp:DetailsView ID="dvSelectedDepartment" runat="server" class="table table-bordered table-hover tablesorter" AutoGenerateRows="False" DataKeyNames="DepartmentID" DataSourceID="dsSelectedDepartment">
                            <Fields>
                                <asp:TemplateField HeaderText="Department Name" SortExpression="DepartmentName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentName") %>' Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="A Department Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentName") %>' Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="A Department Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department Description" SortExpression="DepartmentDescription">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Rows="5" Text='<%# Bind("DepartmentDescription") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Rows="5" Text='<%# Bind("DepartmentDescription") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DepartmentDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success btn-lg" Text="Submit" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-warning btn-lg" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success btn-lg" Text="Submit" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-warning btn-lg" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary btn-lg" Text="Edit" />
                                        &nbsp;
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                    </div>
                    <asp:Button ID="btnBack" class="btn btn-primary btn-lg btn-block" runat="server" Text="Back to Manage Departments" OnClick="btnBack_Click" />
                </div>
            </div>
            <asp:SqlDataSource ID="dsSelectedDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:TSTConnectionString %>" SelectCommand="SELECT * FROM [TSTDepartments] WHERE ([DepartmentID] = @DepartmentID)" DeleteCommand="DELETE FROM [TSTDepartments] WHERE [DepartmentID] = @DepartmentID" InsertCommand="INSERT INTO [TSTDepartments] ([DepartmentName], [DepartmentDescription]) VALUES (@DepartmentName, @DepartmentDescription)" UpdateCommand="UPDATE [TSTDepartments] SET [DepartmentName] = @DepartmentName, [DepartmentDescription] = @DepartmentDescription WHERE [DepartmentID] = @DepartmentID" OnInserted="dsSelectedDepartment_Inserted" OnUpdated="dsSelectedDepartment_Updated">
                <DeleteParameters>
                    <asp:Parameter Name="DepartmentID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                    <asp:Parameter Name="DepartmentDescription" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvDepartments" Name="DepartmentID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                    <asp:Parameter Name="DepartmentDescription" Type="String" />
                    <asp:Parameter Name="DepartmentID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

