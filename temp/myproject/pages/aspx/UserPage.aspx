<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/UserPage.aspx.cs" Inherits="UserPageNameSpace.UserPage" MasterPageFile="../Master/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Welcome, <asp:Label ID="lblUserName" runat="server"></asp:Label></h1>
    <p>First Name: <asp:Label ID="lblFirstName" runat="server"></asp:Label></p>
    <p>Last Name: <asp:Label ID="lblLastName" runat="server"></asp:Label></p>
    <p>Email: <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
     <p> <asp:Label ID="QueryResultLabel" runat="server" Visible="false"></asp:Label></p>
       <asp:Literal ID="UserTipsLiteral" runat="server" Visible="true"></asp:Literal>


</asp:Content>
