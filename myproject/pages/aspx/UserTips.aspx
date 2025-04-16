﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/UserTips.aspx.cs" Inherits="UserTipsNameSpace.UserTips" MasterPageFile="../Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                <link rel="stylesheet" type="text/css" href="/css/Site.css">

    <div class="container mt-5">
<h1 class="text-center" id="user-tips"></h1>
        <div class="row">
            <div class="col-md-12">
                <%--<h3>User Tips</h3>--%>
                <asp:Literal ID="UserTipsLiteral" runat="server" />
            </div>
        </div>
    </div>
    <style>

        #user-tips p {
        font-size: 13px;
        line-height: 1.5;
    }
    #user-tips::-webkit-scrollbar {
        width: 8px;
    }
    #user-tips::-webkit-scrollbar-thumb {
        background-color: #c5e2e2;
        border-radius: 5px;
    }
    #user-tips::-webkit-scrollbar-thumb:hover {
        background-color: #c5e2e2;
    }
    </style>
    <!-- Add Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>
