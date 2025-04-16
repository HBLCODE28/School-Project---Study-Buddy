<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/Tips.aspx.cs" MasterPageFile="../Master/Site.Master" Inherits="Namespace.Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Monomaniac+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/Site.css">

    <div class="album py-5" style="background-color: #c5e2e2;">
        <div class="container">
            <h2 class="text-center mb-5" style="font-family: 'Monomaniac One', sans-serif; color:#ff6f61;">Tips</h2>
<div class="row" id="tips" runat="server" >
                <!-- Dynamic Tip Cards will be added here -->
            </div>
        </div>
    </div>
</asp:Content>
