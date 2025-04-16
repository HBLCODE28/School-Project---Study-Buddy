<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/AdminPage.aspx.cs" Inherits="AdminPageNameSpace.AdminPage" MasterPageFile="../Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        
        <style>
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
                cursor: pointer;
                position: relative;
            }
            th.asc::after {
                content: " ▲";
            }
            th.desc::after {
                content: " ▼";
            }
        </style>
        
        <script type="text/javascript">
            let currentSort = [];

            // Function to sort the table based on column index and sort direction
            function sortTable(colIndex, order) {
                let table = document.getElementById("dataTable");
                let rows = Array.from(table.rows).slice(1); // Skip header row
                let isSorted = false;

                // Check if the same column was clicked, toggle the order
                if (currentSort[0] === colIndex) {
                    currentSort[1] = (currentSort[1] === 'asc') ? 'desc' : 'asc';
                } else {
                    currentSort = [colIndex, order || 'asc'];
                }

                rows.sort(function (a, b) {
                    let cellA = a.cells[colIndex].innerText;
                    let cellB = b.cells[colIndex].innerText;
                    if (cellA < cellB) {
                        return currentSort[1] === 'asc' ? -1 : 1;
                    }
                    if (cellA > cellB) {
                        return currentSort[1] === 'asc' ? 1 : -1;
                    }
                    return 0;
                });

                // Reorder the rows
                rows.forEach(row => table.appendChild(row));

                // Highlight the sorted column
                updateSortIndicator(colIndex);
            }

            // Function to update the sort indicator (ascending or descending)
            function updateSortIndicator(colIndex) {
                let ths = document.querySelectorAll("th");
                ths.forEach((th, index) => {
                    if (index === colIndex) {
                        th.classList.add(currentSort[1]);
                    } else {
                        th.classList.remove('asc', 'desc');
                    }
                });
            }
        </script>
    </head>
    <body>
        <h1>Welcome, <%= Session["FirstName"] %>!</h1>

        <!-- Literal control to display the table -->
        <asp:Literal ID="LiteralTable" runat="server" />

        <div id="tableContainer" class="table table-bordered table-striped">
            <table id="dataTable">
                <thead>
                    <tr>
                        <th onclick="sortTable(0, 'asc')">ID</th>
                        <th onclick="sortTable(1, 'asc')">Name</th>
                        <th onclick="sortTable(2, 'asc')">Email</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="dataRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Email") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </body>
    </html>
</asp:Content>
