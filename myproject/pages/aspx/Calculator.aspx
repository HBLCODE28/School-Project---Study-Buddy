<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="server">
    <h1 class="text-center my-4">Regular Calculator</h1>
    <link rel="stylesheet" type="text/css" href="/css/Site.css">

    <div class="container my-5">
        <!-- Regular Calculator - One Line Layout -->
        <div class="calculator-container">
            <input type="number" id="firstNumber" class="form-control calculator-input" placeholder="number" />
            
            <select id="operation" class="form-control calculator-select">
                <option value="add">+</option>
                <option value="subtract">-</option>
                <option value="multiply">×</option>
                <option value="divide">÷</option>
            </select>
            
            <input type="number" id="secondNumber" class="form-control calculator-input" placeholder="number" />
            
            <button class="button" onclick="calculate(event)">calculate</button>
        </div>

        <div class="text-center mt-3">
            <a href="/pages/aspx/MathQuestions.aspx" class="button">
                Math Questions!
            </a>
        </div>
    </div>

    <style>
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }

        .calculator-container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        .calculator-input,
        .calculator-select {
            width: 120px;
            height: 50px;
            font-size: 25px;
            text-align: center;
            border-radius: 10px;
            border: 2px solid #ffcccc;
            background-color: #FFA49C;

        }

        .calculator-select {
            font-size: 28px;
            width: 80px;
        }

        /*.calculator-button {
            height: 50px;
            font-size: 24px;
            padding: 0 20px;
            border-radius: 10px;
            background-color: #ff7070;
            color: white;
            border: none;
            cursor: pointer;
        }*/
    </style>

    <script>
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
                case 'add':
                    result = num1 + num2;
                    break;
                case 'subtract':
                    result = num1 - num2;
                    break;
                case 'multiply':
                    result = num1 * num2;
                    break;
                case 'divide':
                    if (num2 !== 0) {
                        result = num1 / num2;
                    } else {
                        alert("Error: Division by zero.");
                        return;
                    }
                    break;
                default:
                    alert("Invalid operation.");
                    return;
            }

            alert("Result: " + result);
        }
    </script>
</asp:Content>
