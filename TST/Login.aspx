<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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



</asp:Content>

