<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/LogOut.aspx.cs" Inherits="LogOutNameSpace.Logout" MasterPageFile="../Master/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center my-4">Log Out</h1>
    <link rel="stylesheet" type="text/css" href="/css/Site.css">
    
    <div class="text-center">
        <asp:Button ID="logoutButton" runat="server" CssClass="button" Text="Log Out" OnClientClick="return confirmLogout();" OnClick="btnLogout_Click" />
    </div>

    <script type="text/javascript">
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>

    <style>
        /* כפתור אדום */
        .button {
            cursor: pointer;
            position: relative;
            padding: 6px 16px; 
            font-size: 14px; 
            color: white;
            border: 2px solid #ff4444;
            border-radius: 30px; 
            background-color: #ff4444;
            font-weight: 600;
            transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
            overflow: hidden;
            text-align: center;
            width: auto; 
        }

        .button::before {
            content: '';
            position: absolute;
            inset: 0;
            margin: auto;
            width: 50px;
            height: 50px;
            border-radius: inherit;
            scale: 0;
            z-index: -1;
            background-color: #cc0000;
            transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
        }

        .button:hover::before {
            scale: 3;
        }

        .button:hover {
            color: white;
            scale: 1.1;
            box-shadow: 0 0px 20px rgba(255, 68, 68, 0.4);
        }

        .button:active {
            scale: 1;
        }
        /* סגנון אחיד לכל התוכן */
.container {
  max-width: 400px;
  margin: auto;
  padding: 20px;
  text-align: center;
}
        
        h1 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 20px;
            color:red;
        }
    </style>
</asp:Content>
