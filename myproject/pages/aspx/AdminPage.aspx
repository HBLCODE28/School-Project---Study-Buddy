<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/AdminPage.aspx.cs" Inherits="AdminPageNameSpace.AdminPage" MasterPageFile="../Master/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Welcome, <%= Session["FirstName"] %>!</h1>

    <!-- Literal to render the dynamic table -->
    <asp:Literal ID="LiteralTable" runat="server" />

    <style>
        th {
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

        function sortTable(colIndex, order) {
            let table = document.getElementById("dataTable");
            let rows = Array.from(table.rows).slice(1); // exclude header
            if (currentSort[0] === colIndex) {
                currentSort[1] = currentSort[1] === 'asc' ? 'desc' : 'asc';
            } else {
                currentSort = [colIndex, order || 'asc'];
            }

            rows.sort(function (a, b) {
                let cellA = a.cells[colIndex].innerText.trim();
                let cellB = b.cells[colIndex].innerText.trim();

                // Try numeric sort first
                let numA = parseFloat(cellA);
                let numB = parseFloat(cellB);

                if (!isNaN(numA) && !isNaN(numB)) {
                    return currentSort[1] === 'asc' ? numA - numB : numB - numA;
                }

                // Fallback to string sort
                return currentSort[1] === 'asc'
                    ? cellA.localeCompare(cellB)
                    : cellB.localeCompare(cellA);
            });

            rows.forEach(row => table.appendChild(row));
            updateSortIndicator(colIndex);
        }

        function updateSortIndicator(colIndex) {
            let ths = document.querySelectorAll("#dataTable th");
            ths.forEach((th, index) => {
                if (index === colIndex) {
                    th.classList.add(currentSort[1]);
                    th.classList.remove(currentSort[1] === 'asc' ? 'desc' : 'asc');
                } else {
                    th.classList.remove('asc', 'desc');
                }
            });
        }
    </script>
</asp:Content>
