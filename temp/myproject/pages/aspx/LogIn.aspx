<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/LogIn.aspx.cs" Inherits="Namespace.LogIn" MasterPageFile="../Master/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Login</h1>
    <script src="../js/LogIn.js" type="text/javascript"></script>
    
    <!-- Username -->
    <div>
        <label for="txtUsername">Username:</label>
        <asp:TextBox ID="txtUsername" runat="server" ClientIDMode="Static" />
        <asp:Label ID="uNameError" runat="server" ClientIDMode="Static" ForeColor="Red" Text="Username is required." style="display:none;" />
    </div>

    <!-- Password -->
    <div>
        <label for="txtPassword">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ClientIDMode="Static" />
        <asp:Label ID="pwError" runat="server" ClientIDMode="Static" ForeColor="Red" Text="Password is required." style="display:none;" />
    </div>

    <!-- Hidden Field -->
    <asp:HiddenField ID="formPage" runat="server" Value="login" />

    <!-- Submit Button -->
    <div>
        <asp:Button ID="loginButton" runat="server" CssClass="submit-btn" Text="Log In" OnClientClick="return validateForm(event);" />
    </div>
</asp:Content>
