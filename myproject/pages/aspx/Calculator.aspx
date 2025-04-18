<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="server">
    <h1 class="text-center my-4">Regular Calculator</h1>
    <link rel="stylesheet" type="text/css" href="/css/Site.css">

    <div class="container my-5">
        <!-- Regular Calculator -->
        <div class="calculator-container" >
            <div id="mathQuestions" class="form-floating mb-3" >
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
                <input type="number" id="secondNumber" class="form-control slippery-snail" placeholder="Second number">
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



input, select {
    margin: 10px 0;
    padding: 10px;
    border-radius: 10px;
    border: 2px solid #ffcccc;
    background-color: #FFA49C;
    box-sizing: border-box; /* כדי להבטיח שה-padding נלקח בחשבון ברוחב */
    height: 50px; /* גובה קבוע */
    width: 60%; /* רוחב 60% */

/* עיצוב כותרות ופסקאות */
input, h1, p {
    margin-bottom: 20px; /* רווח בין כותרות לפסקאות */
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
