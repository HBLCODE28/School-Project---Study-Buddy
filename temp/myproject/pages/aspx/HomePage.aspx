<%@ Page Language="C#" AutoEventWireup="true" CodeFile="../cs/HomePage.aspx.cs" Inherits="Namespace.HomePage" MasterPageFile="../Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        /* עיצוב כללי של הכפתור */
        .gradient-button {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px;
            font-size: 16px;
            font-family: Arial, sans-serif;
            color: white;
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            border-radius: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        /* אפקט כשעוברים עם העכבר */
        .gradient-button:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transform: translateY(-2px);
        }

        /* אייקון ליד הטקסט */
        .gradient-button img {
            margin-right: 10px;
            width: 24px;
            height: 24px;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }
        .fixed-sidebar {
            position: fixed;
            top: 20px;
            left: 20px;
            width: 200px;
            background-color: white;
            border: 1px solid #ccc;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 10px;
            z-index: 1000;
            border-radius: 5px;
            cursor: move; /* סמן גרירה */
        }
.content {
    margin-left: 220px;
    padding: 20px;
    background-color: white;
    border: 1px solid #ccc; /* שומר על גבול דק, אבל ניתן להקטין יותר אם רצוי */
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); /* הפחתת הצל להיות דק ופחות בולט */
    border-radius: 5px; /* אופציונלי, שומר על פינות מעוגלות */
    min-height: 600px;
}
        .link {
            color: black;
            text-decoration: none;
            display: block;
            margin: 10px 0;
        }
        .link:hover {
            color: cornflowerblue;
        }
    </style>
  
    <div class="content-wrapper">
    <img src="/images/homepage.png"  style="width:20%;"/>

<div id="content2" class="content">
        
        <h1>Welcome to StudyBuddy!</h1>
        <p>In this site, students share their study tips.</p>
        <h2>New Tips</h2>
    <div id="TipsContainer" runat="server"></div> <!-- מקום להצגת הטיפים -->
 

    </div>

        </div>

      <% if (Session["username"] != null ) { %>
    <!-- משתמש מחובר, אל תציג כפתורי כניסה/הרשמה -->

<div id="content1" class="content">
            <a href="/pages/aspx/NewTip.aspx" class="gradient-button">
        <img src="/images/tipbutton.png" alt="Icon">
        Create New Tip!
    </a>

         </div>
<% } else { %>
    <!-- הצג את הקישורים להתחברות או הרשמה -->
   <div class="fixed-sidebar" id="draggable">
    <div>Have an account?</div>
    <a class="link" href="/pages/aspx/LogIn.aspx">Login.</a>
    <div>Don't have an account?</div>
    <a class="link" href="/pages/aspx/SignUp.aspx">Sign up.</a>
</div>


    
   
<% } %>
     <script>
         // JavaScript לגרירת הסרגל
         dragElement(document.getElementById("draggable"));

         function dragElement(elmnt) {
             var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
             elmnt.onmousedown = dragMouseDown;

             function dragMouseDown(e) {
                 e = e || window.event;
                 e.preventDefault();
                 // מיקום המקש בעת לחיצה
                 pos3 = e.clientX;
                 pos4 = e.clientY;
                 document.onmouseup = closeDragElement;
                 // קריאה לפונקציה בעת הזזת העכבר
                 document.onmousemove = elementDrag;
             }

             function elementDrag(e) {
                 e = e || window.event;
                 e.preventDefault();
                 // חישוב המיקום החדש
                 pos1 = pos3 - e.clientX;
                 pos2 = pos4 - e.clientY;
                 pos3 = e.clientX;
                 pos4 = e.clientY;
                 // הגדרת המיקום החדש של האלמנט
                 elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                 elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
             }

             function closeDragElement() {
                 // סיום הזזה בעת שחרור המקש
                 document.onmouseup = null;
                 document.onmousemove = null;
             }
         }
     </script>
</asp:Content>
