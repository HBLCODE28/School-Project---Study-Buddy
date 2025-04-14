<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/HomePage.aspx.cs" Inherits="Namespace.HomePage"  MasterPageFile="../Master/Site.Master" %>
<%--Server Error in '/' Application.
Parser Error
Description: An error occurred during the parsing of a resource required to service this request. Please review the following specific parse error details and modify your source file appropriately.

Parser Error Message: Only Content controls are allowed directly in a content page that contains Content controls.

Source Error:


Line 45: </asp:Content>
Line 46: 
Line 47:   <html>
Line 48: 
Line 49:       <head>

Source File: /pages/aspx/HomePage.aspx    Line: 47

Version Information: Microsoft .NET Framework Version:4.0.30319; ASP.NET Version:4.8.9282.0--%>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
    <div class="container mt-5">
        <!-- Welcome Section -->
        <div class="row mt-5 justify-content-center">
            <div class="col-lg-12 text-center">
                <h1 class="display-4 font-weight-bold">ברוך הבא ל-StudyBuddy!</h1>
                <p class="lead" style="color: #ff4c4c;">באתר הזה, סטודנטים משתפים טיפים ללימודים כדי לעזור לאחרים להצליח.</p>
            </div>
        </div>

        <!-- Button Section with Flexbox to handle alignment -->
        <div class="row mt-3 justify-content-center">
            <div class="col-lg-12 text-center d-flex justify-content-center">
                <% if (Session["UserName"] != null) { %>
                    <!-- Show both buttons side by side -->
                    <a href="/pages/aspx/Tips.aspx" class="button-73-red" style="margin-right: 10px;">
                        גלה טיפים!
                    </a>
                    <a href="/pages/aspx/NewTip.aspx" class="button-73-red">
                        צור טיפ חדש!
                    </a>
                <% } else { %>
                    <!-- Show only one button centered -->
                    <a href="/pages/aspx/Tips.aspx" class="button-73-red">
                        גלה טיפים!
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

  <html>

      <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>StudyBuddy - Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/site.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+IE+Guides&family=Playwrite+NG+Modern:wght@100..400&family=Pacifico&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Monomaniac+One&display=swap" rel="stylesheet">

    <style>
        .button-73-red {
           background-color: red;
            box-shadow: rgba(255, 0, 0, 0.4) 0 -25px 18px -14px inset, 
                        rgba(255, 0, 0, 0.25) 0 1px 2px, 
                        rgba(255, 0, 0, 0.25) 0 2px 4px, 
                        rgba(255, 0, 0, 0.25) 0 4px 8px, 
                        rgba(255, 0, 0, 0.25) 0 8px 16px, 
                        rgba(255, 0, 0, 0.25) 0 16px 32px;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1.25rem;
            align-content:center;
        }

        .button-73-red:hover {
            box-shadow: rgba(255, 0, 0, 0.4) 0 -25px 18px -14px inset, 
                        rgba(255, 0, 0, 0.25) 0 1px 2px, 
                        rgba(255, 0, 0, 0.25) 0 2px 4px, 
                        rgba(255, 0, 0, 0.25) 0 4px 8px, 
                        rgba(255, 0, 0, 0.25) 0 8px 16px, 
                        rgba(255, 0, 0, 0.5) 0 0 0 4px;
            transform: translateY(-2px);
            color: white;
        }

        .button-73-red:active {
            transform: translateY(0);
        }

        .button-73-red:visited {
            color: white;
        }

        #clock-icon-link, #calculator-icon-link {
            margin-left: 10px;
            display: inline-flex;
            align-items: center;
        }

        #clock-icon, #calculator-icon {
            width: 24px;
            height: 24px;
            cursor: pointer;
            fill: #ff6f61;
        }

        #clock-icon:hover, #calculator-icon:hover {
            fill: #d9534f;
        }

        h1, h2 {
            color: #ff6f61;
            font-family: 'Monomaniac One', sans-serif;
        }

        p {
            color: white;
        }
    </style>
</head>
<body>

  </html>
<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
