<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/Profile.aspx.cs" Inherits="UserPageNameSpace.UserPage" MasterPageFile="../Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
        <head>
            <link rel="stylesheet" type="text/css" href="/css/Site.css">
            <meta charset="utf-8" />
            <title>User Profile</title>
            <style>
    body {
        font-family: 'Monomaniac One', sans-serif;
        direction: ltr;
        margin: 0;
        padding: 0;

    }
    #container {
        display: flex;
        justify-content: space-between;
        padding: 20px;
        margin-top: 20px;
    }
    #user-details {
        width: 48%;
        padding: 15px;
        background-color: #c5e2e2;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    #user-tips {
        width: 48%;
        padding: 15px;
        background-color: #c5e2e2;
        border: 1px solid #ddd;
        border-radius: 5px;
        max-height: 300px;
        overflow-y: auto;
    }


h2, h3 {
    color: #ff6f61;
  /*  text-align: center;
    margin: 0;   ביטול מרג'ין ברירת מחדל של הדפדפן 
    display: flex;
    justify-content: center;   מרכז אופקית 
    align-items: center;       מרכז אנכית */
}

p {
    margin: 10px 0;
    font-size: 14px;
    color: #FF6666; /* אדום בהיר */
   /* text-align: center;
    display: flex;
    justify-content: center;   מרכז אופקית 
    align-items: center;       מרכז אנכית */
}
/*    #user-tips p {
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
    }*/
</style>

        </head>
        <body>
            <div id="container">
                <div id="user-details">
                    <h2>User Details</h2>
                    <p id="username">Username: <span runat="server" id="lblUserName"></span></p>
                    <p id="firstname">First Name: <span runat="server" id="lblFirstName"></span></p>
                    <p id="lastname">Last Name: <span runat="server" id="lblLastName"></span></p>
                    <p id="email" style="margin-bottom: 20px;">Email: <span runat="server" id="lblEmail"></span></p>
<a href="UserTips.aspx" class="button" style="inline-size:100px; margin-top: 10px;">
    Your Tips!
</a>

                </div>
                
<%--         <div id="user-tips" >
    <h3>User Tips</h3>
    <asp:Literal ID="UserTipsLiteral" runat="server" />
</div>--%>


<div id="admin" runat="server" visible="false">
        <a href="AdminPage.aspx" class="button">
            Admin Page
        </a>
</div>

        </body>

</asp:Content>
