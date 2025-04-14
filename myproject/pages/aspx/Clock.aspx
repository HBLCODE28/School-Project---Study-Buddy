<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="server">
    <div id="background-container">
<video autoplay loop muted id="background-video">
    <source src="../../videos/210707_small.mp4" type="video/mp4">
</video>

    </div>

<div id="clock-container" >
        <h1 id="live-clock"></h1>
    </div>

    <style>
        /* הגדרת אלמנט הוידאו כרקע */
        #background-container {
            position: fixed; /* מוודא שהוידאו תמיד נמצא במקום הנכון */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* מוודא שהוידאו מאחורי התוכן */
        }

        #background-video {
            object-fit: cover; /* מכסה את כל השטח */
            width: 100%;
            height: 100%;
        }

#clock-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
/*    color: #fcac5c;
*/    transform: scale(1.7);
    position: absolute; /* משנה את המיקום כדי שהשעון לא יגדל יחד עם הדף */
    top: 50%; /* ממקם את השעון במרכז */
    left: 50%;
    transform: translate(-50%, -50%) scale(1.7); /* מבצע שינוי מקומית (scale) תוך שמירה על מרכז */
}



        h1 {
            font-size: 3rem;
            font-family: 'Monomaniac One', sans-serif;
            margin: 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* הוספת צל לשעון */
        }
    </style>

    <script>
      


        document.addEventListener("DOMContentLoaded", function () {
            setInterval(updateClock, 1000);
        });

        function updateClock() {
            const now = new Date();
            let hours = now.getHours();
            let minutes = now.getMinutes();
            let seconds = now.getSeconds();

            hours = hours < 10 ? "0" + hours : hours;
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            document.getElementById("live-clock").textContent = hours + ":" + minutes + ":" + seconds;
        }
     
        // Initialize clock
        setInterval(updateClock, 1000);
    </script>
</asp:Content>
