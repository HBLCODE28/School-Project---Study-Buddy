


function validateForm(event)
{
    event.preventDefault(); // Prevent automatic form submission
    const username = document.getElementById('txtUsername').value;
    const password = document.getElementById('txtPassword').value;
    console.log("username: ", username);
    console.log("password: ", password);
    let isValid = true;

    if (!username || !password) {
        isValid = false;
        if (!username) {
            showError('uNameError', 'Username is required.');
        } else {
            hideError('uNameError');
        }

        if (!password) {
            showError('pwError', 'Password is required.');
        } else {
            hideError('pwError');
        }
        return;
    }

    if (isValid) {
        SendToSQL(username, password, 'login');
    }
}

function SendToSQL(username, password, formPage) {
    const formData = new FormData();
    formData.append('users_name', username);
    formData.append('users_password', password);
    formData.append('formPage', formPage);

    fetch('/pages/aspx/SqlCode.aspx', {
        method: 'POST',
        body: formData
    })
        .then(response => {
            if (!response.ok) {
                // אם יש שגיאה בשרת, נזרוק שגיאה כדי להגיע ל- catch
                return response.text().then(text => { throw new Error(`Server error: ${response.status} - ${response.statusText}: ${text}`); });
            }
            return response.text();
        })
        .then(data => {
            console.log("Server response: ", data);
            if (data.includes("Welcome!")) {
                window.location.href = "../aspx/HomePage.aspx";
            } else {
                alert("Invalid login. Please try again.");
            }
        })
        .catch(error => {
            // נציג את כל המידע הקיים על השגיאה בקונסולה
            console.error("Error during fetch:", error);
            alert(`There was an issue with the login process. Please try again later. Detailed error: ${error.message}`);
        });
}

function showError(elementId, message) {
    var element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'block';
        element.textContent = message;
    }
}

function hideError(elementId) {
    var element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'none';
    }
}
