<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="server">
    <h1 class="text-center my-4">Calculator</h1>
<%--    <p class="text-center">Solve Math Questions:</p>--%>
    <link rel="stylesheet" type="text/css" href="/css/Site.css">

    <div class="container my-5">
        <!-- Regular Calculator -->
        <div class="left">
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

        <!-- Random Question for the user -->
        <div class="right">
            <div id="quizSection" class="form-floating mb-3">
                <h3>Try to Solve This:</h3>
                <p id="question" class="form-control slippery-snail" style="text-align: center;"></p>
                <input type="number" id="answerInput" class="form-control slippery-snail" placeholder="Enter your answer">
                <button class="button" onclick="checkAnswer()">Submit Answer</button>
            </div>
        </div>
    </div>

    <style>
        /* הגדרת הקונטיינר שיהיה בתצוגה אנכית */
        .container {
            display: flex;
            flex-direction: row; /* משנה את כיוון הפריסה לאופקי */
            justify-content: space-between; /* פיזור התפריטים בין הצדדים */
            padding: 20px;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* הגדרת התפריטים כך שיהיו בצדדים שונים */
        .left, .right {
            display: flex;
            flex-direction: column; /* כל אחד יתפוס שורה אחת */
            width: 48%; /* כל אחד יתפוס 48% מהמרחב */
        }

        .left {
            text-align: left;
        }

        .right {
            text-align: right;
        }

        /* עיצוב השדות (input) */
        /*.slippery-snail {
            position: relative;
            padding: 10px;
            border: 2px solid transparent;
            background-color: #FFA49C;;
            border-radius: 12px;
            transition: all 0.3s ease;
        }*/

        /* שינוי צבע גבולות השדות בעת ריחוף */
        /*.slippery-snail:hover {
            border-color: #ff0000;
        }*/

        /* עיצוב כפתור החישוב */
        .button {
            cursor: pointer;
            position: relative;
            padding: 10px 24px;
            font-size: 18px;
            color: lightcoral;
            border: 2px solid lightcoral;
            border-radius: 34px;
            background-color: transparent;
            font-weight: 600;
            transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
            overflow: hidden;
        }

        /* כפתור עם אפקט בעת ריחוף */
        .button::before {
            content: '';
            position: absolute;
            inset: 0;
            margin: auto;
            width: 50px;
            height: 50px;
            border-radius: inherit;
            scale: 0;
            z-index: -1;
            background-color: lightcoral;
            transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
        }

        /* שינוי אפקט בעת ריחוף על כפתור */
        .button:hover::before {
            scale: 3;
        }

        .button:hover {
            color: #212121;
            scale: 1.1;
            box-shadow: 0 0px 20px rgba(255, 102, 102, 0.4);
        }

        .button:active {
            scale: 1;
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
            background-color: #FFA49C;;
            border: 2px solid #ffcccc;
            border-radius: 10px;
            width: 80%;
            text-align: center;
        }

        /* הגדרת עיצוב של תיבות input */
        input, select, button {
            margin: 10px 0;
            width: 90%; /* יבטיח שהתיבות יתפסו 90% מהמרחב של הקונטיינר */
            padding: 10px;
            border-radius: 10px;
            border: 2px solid #ffcccc;
            background-color: #FFA49C;;
        }
    </style>

    <script>
        let attempts = 0;
        let correctAnswer;

        // Generate random question
        function generateQuestion() {
            const num1 = Math.floor(Math.random() * 10) + 1;
            const num2 = Math.floor(Math.random() * 10) + 1;
            const operations = ["+", "-", "*"];
            const operation = operations[Math.floor(Math.random() * operations.length)];

            switch (operation) {
                case "+":
                    correctAnswer = num1 + num2;
                    break;
                case "-":
                    correctAnswer = num1 - num2;
                    break;
                case "*":
                    correctAnswer = num1 * num2;
                    break;
            }

            document.getElementById("question").textContent = `${num1} ${operation} ${num2} = ?`;
        }

        // Check the answer entered by the user
        function checkAnswer() {
            const userAnswer = parseInt(document.getElementById("answerInput").value);

            if (userAnswer === correctAnswer) {
                alert("Correct!");
                attempts = 0;
                generateQuestion(); // Generate a new question
            } else {
                attempts++;
                if (attempts < 3) {
                    alert("Try again!");
                } else {
                    alert(`The correct answer was: ${correctAnswer}`);
                    attempts = 0;
                    generateQuestion(); // Generate a new question
                }
            }
        }

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

        window.onload = generateQuestion;
    </script>
</asp:Content>
