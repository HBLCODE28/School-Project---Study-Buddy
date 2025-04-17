<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="server">
    <h1 class="text-center my-4">Regular Calculator</h1>
    <link rel="stylesheet" type="text/css" href="/css/Site.css">

    <div class="container my-5">
        <!-- Regular Calculator -->
        <div class="calculator-container">
            <div id="mathQuestions" class="form-floating mb-3">
                <input type="number" id="firstNumber" class="form-control slippery-snail" placeholder="First number">
                <label for="firstNumber">First Number</label>
            </div>
            <div class="form-floating mb-3">
                <select id="operation" class="form-control slippery-snail" required>
                    <option value="add">+</option>
                    <option value="subtract">-</option>
                    <option value="multiply">×</option>
                    <option value="divide">÷</option>
                </select>
                <label for="operation">Operation</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id="secondNumber" class="form-control slippery-snail" placeholder="Second number" >
                <label for="secondNumber">Second Number</label>
            </div>
            <div class="text-center mt-3">
                <button class="button" onclick="calculate(event)">Calculate</button>
            </div>
        </div>

        <div class="text-center mt-3">
            <a href="/pages/aspx/MathQuestions.aspx" class="button">
                Math Questions!
            </a>
        </div>
    </div>

    <style>
    /* הגדרת הקונטיינר שיהיה בתצוגה אנכית */
    .container {
        display: flex;
        flex-direction: column; /* הפריסה תהיה אנכית */
        justify-content: center; /* מיישר את התוכן במרכז */
        align-items: center; /* ממקם את כל התוכן במרכז */
        padding: 20px;
        width: 100%;
        max-width: 600px; /* גודל מקסימלי עבור הקונטיינר */
        margin: 0 auto;
    }

    /* כל תפריט יהיה בשורה נפרדת */
    .calculator-container {
        display: flex;
        flex-direction: column; /* כל אחד יתפוס שורה אחת */
        width: 100%; /* כל אחד יתפוס את כל רוחב הקונטיינר */
        margin-bottom: 20px; /* מרווח בין השדות */
    }

    /* עיצוב שדות הקלט (input, select, button) */
    input, select, button {
        margin: 10px 0;
        width: 80%; /* רוחב 80% */
        padding: 10px;
        border-radius: 10px;
        border: 2px solid #ffcccc;
        background-color: #FFA49C;
    }

    /* עיצוב כותרות ופסקאות */
    h1, p {
        margin-bottom: 20px; /* רווח בין כותרות לפסקאות */
        text-align: center;
    }

    /* עיצוב שדה השאלה הרנדומלית */
    #quizSection {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    #question {
        margin: 10px 0;
        padding: 10px;
        background-color: #FFA49C;
        border: 2px solid #ffcccc;
        border-radius: 10px;
        width: 80%;
        text-align: center;
    }
    </style>

    <script>
        // Regular calculator logic
        function calculate(event) {
            event.preventDefault();
            const num1 = parseFloat(document.getElementById('firstNumber').value);
            const num2 = parseFloat(document.getElementById('secondNumber').value);
            const operation = document.getElementById('operation').value;
            let result;
            if (isNaN(num1) || isNaN(num2)) {
                alert("Please enter both numbers!");
                return;
            }
            switch (operation) {
                case 'add': result = num1 + num2; break;
                case 'subtract': result = num1 - num2; break;
                case 'multiply': result = num1 * num2; break;
                case 'divide':
                    if (num2 !== 0) result = num1 / num2;
                    else {
                        alert("Error: Division by zero.");
                        return;
                    }
                    break;
                default: alert("Invalid operation."); return;
            }
            alert("Result: " + result);
        }
    </script>
</asp:Content>
