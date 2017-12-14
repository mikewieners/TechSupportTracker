<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <script>
        $(document).ready(function () {
            $('#default').addClass('active');
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">



    <div class="row">
        <div class="col-lg-12">
            <h1>Tech Support Home <small>Overview</small></h1>
            <ol class="breadcrumb">
                <li class="active"><i class="icon-house"></i>Tech Support Home</li>
            </ol>
        </div>
    </div>
    <!-- /.row -->

    <div class="row">
        <div class="col-lg-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <i class="icon-check icon-5x"></i>
                        </div>
                        <div class="col-xs-6 text-right">
                            <p class="announcement-heading">456</p>
                            <p class="announcement-text">Resolved Today!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <i class="icon-tasks icon-5x"></i>
                        </div>
                        <div class="col-xs-6 text-right">
                            <p class="announcement-heading">18</p>
                            <p class="announcement-text">Open Tickets</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->

    <asp:LoginView ID="lvDefault" runat="server">
        <AnonymousTemplate>
            <div class="row">
                <asp:Login ID="Login1" runat="server" CssClass="form-group" Orientation="Horizontal" TitleText="&lt;h2&gt;Log In&lt;/h2&gt;">
                    <LayoutTemplate>
                        <div class="row">
                            <div class="col-lg-12">
                                <h2>Log In</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">

                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-3">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-3">
                                <asp:CheckBox ID="RememberMe" runat="server" CssClass="checkbox" Text="Remember me next time." />
                            </div>
                            <div class="col-lg-3">
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-lg btn-primary" Text="Log In" ValidationGroup="Login1" />
                            </div>
                        </div>
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                    </LayoutTemplate>
                    <FailureTextStyle CssClass="help-block" />
                    <LoginButtonStyle CssClass="btn btn-lg btn-primary" />
                    <TextBoxStyle CssClass="form-control" />
                </asp:Login>
            </div>
        </AnonymousTemplate>
    </asp:LoginView>



</asp:Content>

