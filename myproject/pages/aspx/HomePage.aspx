<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/HomePage.aspx.cs" Inherits="Namespace.HomePage" MasterPageFile="../Master/Site.Master" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
    <div class="container mt-5">
        <!-- Welcome Section -->
        <div class="row mt-5 justify-content-center">
            <div class="col-lg-12 text-center">
                <h1 class="display-4 font-weight-bold" style="color: #ff6f61;">Welcome to StudyBuddy!</h1>
                <p class="lead" style="color: #ff6f61;">On this website, students share study tips to help others succeed.</p>
            </div>
        </div>

        <!-- Button Section with Flexbox to handle alignment -->
        <div class="row mt-3 justify-content-center">
            <div class="col-lg-12 text-center d-flex justify-content-center">
                <% if (Session["UserName"] != null) { %>
                    <!-- Show both buttons side by side -->
                    <a href="/pages/aspx/Tips.aspx" class="button" style="margin-right: 10px;">
                        Discover Tips!
                    </a>
                    <a href="/pages/aspx/NewTip.aspx" class="button">
                        Create New Tip!
                    </a>
                <% } else { %>
                    <!-- Show only one button centered -->
                    <a href="/pages/aspx/Tips.aspx" class="button">
                        Discover Tips!
                    </a>
                <% } %>
            </div>
        </div>

        <!-- Footer Section -->
        <footer class="bg-light text-center text-lg-start">
            <div class="container p-4">
                <div class="text-center">
                    <p style="color: #ff4c4c;">&copy; <%: DateTime.Now.Year %> - StudyBuddy </p>
                    <p style="color: #ff4c4c;">מי שמאמין לא מתעד#</p>
                </div>
            </div>
        </footer>
    </div>
</asp:Content>
