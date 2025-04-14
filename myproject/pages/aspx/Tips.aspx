<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/Tips.aspx.cs" MasterPageFile="../Master/Site.Master" Inherits="Namespace.Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <div class="album py-5" style="background-color: #ffffff;">
        <div class="container">
            <h2 class="text-center mb-5">Tips</h2>
            <div class="row" id="tips" runat="server">
                <!-- Dynamic Tip Cards will be added here -->
            </div>
        </div>
    </div>

</asp:Content>








