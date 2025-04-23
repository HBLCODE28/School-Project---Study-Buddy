<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/Tips.aspx.cs" MasterPageFile="../Master/Site.Master" Inherits="Namespace.Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Monomaniac+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/Site.css">

    <div class="album py-5" style="background-color: #c5e2e2;">
        <div class="container">
            <h2 class="text-center mb-5" style="font-family: 'Monomaniac One', sans-serif; color:#ff6f61;">Tips</h2>

            <!-- Dropdown for client-side filtering -->
            <label for="subjectFilter">Sort Tips by Subject:</label>
            <select id="subjectFilter" class="dropdown-menu4">
                <option value="all">All Subjects</option>
                <option value="Biology">Biology</option>
                <option value="Chemistry">Chemistry</option>
                <option value="Physics">Physics</option>
                <option value="Geography">Geography</option>
                <option value="Environmental Science">Environmental Science</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Software Engineering">Software Engineering</option>
                <option value="Information Systems">Information Systems</option>
                <option value="Mathematics">Mathematics</option>
                <option value="Statistics">Statistics</option>
                <option value="Psychology">Psychology</option>
                <option value="Sociology">Sociology</option>
                <option value="Political Science">Political Science</option>
                <option value="Economics">Economics</option>
                <option value="Anthropology">Anthropology</option>
                <option value="English">English</option>
                <option value="Spanish">Spanish</option>
                <option value="French">French</option>
                <option value="German">German</option>
                <option value="Chinese">Chinese</option>
                <option value="Hebrew">Hebrew</option>
                <option value="Arabic">Arabic</option>
                <option value="Philosophy">Philosophy</option>
                <option value="History">History</option>
                <option value="Literature">Literature</option>
                <option value="Art History">Art History</option>
                <option value="Art">Art</option>
                <option value="Music">Music</option>
                <option value="Law">Law</option>
                <option value="Business Studies">Business Studies</option>
                <option value="Education">Education</option>
                <option value="Medicine">Medicine</option>
                <option value="Nursing">Nursing</option>
                <option value="Engineering">Engineering</option>
            </select>

            <!-- Dropdown for client-side filtering -->
            <label for="timeFilter" style="margin: 20px;">Sort Tips by Date:</label>
<select id="timeFilter" class="dropdown-menu4" style="margin: -20px;" >
    <option value="all" >All Tips</option>
    <option value="Newest">Newest First</option>
    <option value="Oldest">Oldest First</option>
</select>
           <div class="row" id="tipsContainer" runat="server">
    <!-- Tip cards go here -->
</div>
        </div>
    </div>

    <!-- JavaScript for filtering tips by subject -->
 <script>
     document.addEventListener("DOMContentLoaded", function () {
         const subjectFilter = document.getElementById("subjectFilter");
         const timeFilter = document.getElementById("timeFilter");
         const container = document.querySelector('#MainContent_tipsContainer');

         // Store original list of all tip cards
         const originalCards = Array.from(container.querySelectorAll(".tip-card"));

         function applyFilters() {
             const selectedSubject = subjectFilter.value.trim().toLowerCase();
             const timeOrder = timeFilter.value;

             // Filter cards based on selected subject
             let filtered = originalCards.filter(card => {
                 const cardSubject = card.getAttribute("data-subject").trim().toLowerCase();
                 return selectedSubject === "all" || cardSubject === selectedSubject;
             });

             // Sort filtered cards by date if time order is selected
             if (timeOrder === "Newest" || timeOrder === "Oldest") {
                 filtered.sort((a, b) => {
                     const dateA = new Date(a.getAttribute("data-date"));
                     const dateB = new Date(b.getAttribute("data-date"));
                     return timeOrder === "Newest" ? dateB - dateA : dateA - dateB;
                 });
             }

             // Clear the container and rebuild rows with sorted & filtered cards
             container.innerHTML = '';
             let row;
             filtered.forEach((card, index) => {
                 card.style.display = "block";
                 if (index % 3 === 0) {
                     row = document.createElement("div");
                     row.className = "row";
                     row.style.backgroundColor = "#c5e2e2";
                     container.appendChild(row);
                 }
                 row.appendChild(card);
             });
         }

         // Apply filters when user changes subject or time order
         subjectFilter.addEventListener("change", applyFilters);
         timeFilter.addEventListener("change", applyFilters);

         // Initial load
         applyFilters();
     });
 </script>



</asp:Content>
