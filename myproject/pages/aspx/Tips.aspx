<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/Tips.aspx.cs" MasterPageFile="../Master/Site.Master" Inherits="Namespace.Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Monomaniac+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/Site.css">

    <div class="album py-5" style="background-color: #c5e2e2;">
        <div class="container">
            <h2 class="text-center mb-5" style="font-family: 'Monomaniac One', sans-serif; color:#ff6f61;">Tips</h2>

            <!-- Dropdown for client-side filtering -->
            <label for="subjectFilter">Filter by Subject:</label>
            <select id="subjectFilter" class="form-control mb-4">
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

            <div class="row" id="tips" runat="server">
                <!-- Dynamic Tip Cards will be rendered here -->
            </div>
        </div>
    </div>

    <!-- JavaScript for filtering tips by subject -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const filter = document.getElementById("subjectFilter");
            filter.addEventListener("change", function () {
                const selected = this.value.trim().toLowerCase(); // להבטיח שאין רווחים
                const cards = document.querySelectorAll(".tip-card");

                cards.forEach(card => {
                    const subject = card.getAttribute("data-subject").trim().toLowerCase();
                    card.style.display = (selected === "all" || subject === selected) ? "block" : "none";
                });
            });
        });

    </script>
</asp:Content>
