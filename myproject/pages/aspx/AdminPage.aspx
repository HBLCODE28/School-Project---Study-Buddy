<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/AdminPage.aspx.cs" Inherits="AdminPageNameSpace.AdminPage" MasterPageFile="../Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        /* Table Styling */
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 8px;
            border: 1px solid black;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Welcome, <%= Session["FirstName"] %>!</h1>

    <!-- Button to show/hide the table -->
    <asp:Button ID="ToggleTableButton" runat="server" Text="Show/Hide Table" OnClientClick="toggleTable(); return false;" />
    <br><br>

    <!-- Container for the table -->
    <div id="tableContainer" style="display:none;">
        <asp:Literal ID="LiteralTable" runat="server"></asp:Literal>
    </div>

    <script type="text/javascript">
        // Function to toggle the table visibility
        function toggleTable() {
            var tableContainer = document.getElementById("tableContainer");
            if (tableContainer.style.display === "none") {
                tableContainer.style.display = "block";
            } else {
                tableContainer.style.display = "none";
            }
        }
    </script>
</body>
</html>
</asp:Content>
