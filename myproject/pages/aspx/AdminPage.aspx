<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/AdminPage.aspx.cs" Inherits="AdminPageNameSpace.AdminPage" MasterPageFile="../Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
        <head>
            <link rel="stylesheet" type="text/css" href="/css/Site.css">
            <meta charset="utf-8" />
        
            <title>Admin Page</title>
         <body>
            <div id="Div1" runat="server">
                <!-- The table will be shown here below the user information -->
                <asp:Literal ID="LiteralTable" runat="server" />
            </div>
        </body>
      </head>
</asp:Content>
