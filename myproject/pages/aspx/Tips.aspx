<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/Tips.aspx.cs" MasterPageFile="../Master/Site.Master" Inherits="Namespace.Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Monomaniac+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/Site.css">

    <div class="album py-5" style="background-color: #c5e2e2;">
        <div class="container">
            <h2 class="text-center mb-5" style="font-family: 'Monomaniac One', sans-serif; color:#ff6f61;">Tips</h2>
            <div class="row" id="tips" runat="server">
                <!-- Dynamic Tip Cards will be added here -->
            </div>
        </div>
        
        <!-- Dropdown for selecting sort order -->
        <label for="sort">Sort By:</label><br />
        <select id="sort" runat="server">
            <option value="0">Nothing</option>
            <option value="1">Biology</option>
            <option value="2">Chemistry</option>
            <option value="3">Physics</option>
            <option value="4">Geography</option>
            <option value="5">Environmental Science</option>
            <option value="6">Computer Science</option>
            <option value="7">Software Engineering</option>
            <option value="8">Information Systems</option>
            <option value="9">Mathematics</option>
            <option value="10">Statistics</option>
            <option value="11">Psychology</option>
            <option value="12">Sociology</option>
            <option value="13">Political Science</option>
            <option value="14">Economics</option>
            <option value="15">Anthropology</option>
            <option value="16">English</option>
            <option value="17">Spanish</option>
            <option value="18">French</option>
            <option value="19">German</option>
            <option value="20">Chinese</option>
            <option value="21">Hebrew</option>
            <option value="22">Arabic</option>
            <option value="23">Philosophy</option>
            <option value="24">History</option>
            <option value="25">Literature</option>
            <option value="26">Art History</option>
            <option value="27">Art</option>
            <option value="28">Music</option>
            <option value="29">Law</option>
            <option value="30">Business Studies</option>
            <option value="31">Education</option>
            <option value="32">Medicine</option>
            <option value="33">Nursing</option>
            <option value="34">Engineering</option>
        </select>

        <!-- Button to trigger sorting -->
        <button onclick="sortSubjects()" class="button">Sort</button>
    </div>

    <script>
        function sortSubjects() {
            var select = document.getElementById('<%= sort.ClientID %>'); // השתמש ב-ClientID של ASP.NET
            if (select) {  // אם ה- select קיים
                var selectedValue = select.value;

                // ווידוא שקיים HiddenField
                var hiddenField = document.getElementById('<%= sortOrder.ClientID %>');
                if (hiddenField) {
                    hiddenField.value = selectedValue; // שמור את הערך ב-HiddenField
                }

                // שלח את הטופס כדי להפעיל את ה-PostBack
                var form = document.forms[0];
                form.submit(); // שלח את הטופס
            } else {
                console.error("Not Found");
            }
        }
    </script>

    <!-- Hidden field to store the selected value and send it on postback -->
    <asp:HiddenField ID="sortOrder" runat="server" />
</asp:Content>
