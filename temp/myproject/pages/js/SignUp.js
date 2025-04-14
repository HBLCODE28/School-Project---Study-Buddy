


/*
 

 __ __   ____  _____ __ __      ____   ____  _____ _____ __    __   ___   ____   ___        ____     ___    ___  ___        ______   ___       _____  ____  __ __
|  |  | /    |/ ___/|  |  |    |    \ /    |/ ___// ___/|  |__|  | /   \ |    \ |   \      |    \   /  _]  /  _]|   \      |      | /   \     |     ||    ||  |  |
|  |  ||  o  (   \_ |  |  |    |  o  )  o  (   \_(   \_ |  |  |  ||     ||  D  )|    \     |  _  | /  [_  /  [_ |    \     |      ||     |    |   __| |  | |  |  |
|  _  ||     |\__  ||  _  |    |   _/|     |\__  |\__  ||  |  |  ||  O  ||    / |  D  |    |  |  ||    _]|    _]|  D  |    |_|  |_||  O  |    |  |_   |  | |_   _|
|  |  ||  _  |/  \ ||  |  |    |  |  |  _  |/  \ |/  \ ||  `  '  ||     ||    \ |     |    |  |  ||   [_ |   [_ |     |      |  |  |     |    |   _]  |  | |     |
|  |  ||  |  |\    ||  |  |    |  |  |  |  |\    |\    | \      / |     ||  .  \|     |    |  |  ||     ||     ||     |      |  |  |     |    |  |    |  | |  |  |
|__|__||__|__| \___||__|__|    |__|  |__|__| \___| \___|  \_/\_/   \___/ |__|\_||_____|    |__|__||_____||_____||_____|      |__|   \___/     |__|   |____||__|__|


 */

/*

 ____  _____  ________  ________  ______
|_   \|_   _||_   __  ||_   __  ||_   _ `.
  |   \ | |    | |_ \_|  | |_ \_|  | | `. \
  | |\ \| |    |  _| _   |  _| _   | |  | |
 _| |_\   |_  _| |__/ | _| |__/ | _| |_.' /
|_____|\____||________||________||______.'
|  _   _  | .'   `.  |_   _ `.  .'   `.
|_/ | | \_|/  .-.  \   | | `. \/  .-.  \
    | |    | |   | |   | |  | || |   | |
   _| |_   \  `-'  /  _| |_.' /\  `-'  /
  |_____|   `.___.'  |______.'  `.___.'
 ________  _______     _______      ___   _______      ____    ____  ________  ________   ______        _        ______  ________
|_   __  ||_   __ \   |_   __ \   .'   `.|_   __ \    |_   \  /   _||_   __  ||_   __  |.' ____ \      / \     .' ___  ||_   __  |
  | |_ \_|  | |__) |    | |__) | /  .-.  \ | |__) |     |   \/   |    | |_ \_|  | |_ \_|| (___ \_|    / _ \   / .'   \_|  | |_ \_|
  |  _| _   |  __ /     |  __ /  | |   | | |  __ /      | |\  /| |    |  _| _   |  _| _  _.____`.    / ___ \  | |   ____  |  _| _
 _| |__/ | _| |  \ \_  _| |  \ \_\  `-'  /_| |  \ \_   _| |_\/_| |_  _| |__/ | _| |__/ || \____) | _/ /   \ \_\ `.___]  |_| |__/ |
|________||____| |___||____| |___|`.___.'|____| |___| |_____||_____||________||________| \______.'|____| |____|`._____.'|________|
 ________    ___   _______      ________  ____    ____       _       _____  _____      _____  _____  ____  _____  _____   ___
|_   __  | .'   `.|_   __ \    |_   __  ||_   \  /   _|     / \     |_   _||_   _|    |_   _||_   _||_   \|_   _||_   _|.'   `.
  | |_ \_|/  .-.  \ | |__) |     | |_ \_|  |   \/   |      / _ \      | |    | |        | |    | |    |   \ | |    | | /  .-.  \
  |  _|   | |   | | |  __ /      |  _| _   | |\  /| |     / ___ \     | |    | |   _    | '    ' |    | |\ \| |    | | | |   | |
 _| |_    \  `-'  /_| |  \ \_   _| |__/ | _| |_\/_| |_  _/ /   \ \_  _| |_  _| |__/ |    \ \__/ /    _| |_\   |_  _| |_\  `-'  \_
|_____|    `.___.'|____| |___| |________||_____||_____||____| |____||_____||________|     `.__.'    |_____|\____||_____|`.___.\__|


 */
// Function to hide error messages
function hideError(elementId) {
    const element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'none';
    }
}

// Function to show error messages matching the ASP.NET style
function showError(elementId, message) {
    const element = document.getElementById(elementId);
    if (element) {
        element.style.display = 'block';  // Change display to block to show the error
        element.textContent = message;    // Set the error message text
        element.style.color = 'red';      // Set the text color to red
        element.style.fontWeight = 'bold';// Make the text bold
        element.style.marginTop = '5px';  // Add some space above the error message
    } else {
        console.log(`Element with ID ${elementId} not found.`);
    }
}

// Main form validation function
function validateForm(event) {
    event.preventDefault(); // Prevent automatic form submission
    console.clear();
    let isValid = true;
    console.log("Starting form validation...");

    // Form elements
    const uNameElement = document.getElementById('uName');
    const fNameElement = document.getElementById('fName');
    const lNameElement = document.getElementById('lName');
    const emailElement = document.getElementById('email');
    const genderElement = document.getElementById('gender');
    const phonePrefixElement = document.getElementById('prefix');
    const phoneElement = document.getElementById('phone');
    const yearBornElement = document.getElementById('yearBorn');
    const cityElement = document.getElementById('city');
    const passwordElement = document.getElementById('pw');
    const passwordConfirmElement = document.getElementById('pwConfirm');

    // Trim the input to remove any leading/trailing whitespace
    const userName = uNameElement ? uNameElement.value.trim() : "";
    const firstName = fNameElement ? fNameElement.value.trim() : "";
    const lastName = lNameElement ? lNameElement.value.trim() : "";
    const email = emailElement ? emailElement.value.trim() : "";
    const phone = phoneElement ? phoneElement.value.trim() : "";
    const yearBorn = yearBornElement ? yearBornElement.value.trim() : "";
    let password = passwordElement ? passwordElement.value.trim() : "";
    const passwordConfirm = passwordConfirmElement ? passwordConfirmElement.value.trim() : "";

    // Print the values of the elements to console for debugging
    console.log("User Name:", userName);
    console.log("First Name:", firstName);
    console.log("Last Name:", lastName);
    console.log("Email:", email);
    console.log("Gender:", genderElement ? genderElement.querySelector('input[type="radio"]:checked')?.value : "Not selected");
    console.log("Phone Prefix:", phonePrefixElement ? phonePrefixElement.value : "Not selected");
    console.log("Phone:", phone);
    console.log("Year Born:", yearBorn);
    console.log("City:", cityElement ? cityElement.value : "Not selected");

  
    const selectedHobbies = document.querySelectorAll('#hobbies input[type="checkbox"]:checked');
    console.log("Selected Hobbies:", Array.from(selectedHobbies).map(hobby => hobby.value).join(", ") || "None");

    console.log("Password:", password);
    console.log("Confirm Password:", passwordConfirm);

    // Reset error messages
    const errorFields = ['uNameError', 'fNameError', 'lNameError', 'emailError', 'genderError', 'phoneError', 'yearBornError', 'cityError', 'hobbiesError', 'pwError', 'pwConfirmError'];
    errorFields.forEach(hideError);

    // Validate User Name (6-30 characters, allows special characters)
    if (!userName || !validateUserName(userName)) {
        showError('uNameError', "User Name must be 6-30 characters, can include special characters.");
        isValid = false;
    }

    // Validate First Name
    if (!firstName || firstName === "" || !isValidName(firstName)) {
        showError('fNameError', "First Name is required and must be 2-50 alphabetic characters.");
        isValid = false;
    }

    // Validate Last Name
    if (!lastName || lastName === "" || !isValidName(lastName)) {
        showError('lNameError', "Last Name is required and must be 2-50 alphabetic characters.");
        isValid = false;
    }

    // Validate Email
    if (!email || !validateEmail(email)) {
        showError('emailError', "Please enter a valid email address.");
        isValid = false;
    }

    const selectedGender = genderElement.querySelector('input[type="radio"]:checked');
    console.log("Selected Gender:", selectedGender ? selectedGender.value : "None selected");

    // Validate the selected gender
    if (!selectedGender || validateGender(selectedGender)) {
        showError('genderError', "Please select a gender.");
        isValid = false;
    }

    // Validate Phone Prefix
    if (!phonePrefixElement || phonePrefixElement.value === "" || isValidPrefix(phonePrefixElement) ) {
        showError('phoneError', "Please select a phone prefix.");
        isValid = false;
    }

    // Validate Phone Number
    if (!phone || !isValidPhone(phone)) {
        showError('phoneError', "Phone Number must be 7-10 digits.");
        isValid = false;
    }

    // Validate Year Born
    const currentYear = new Date().getFullYear();
    if (!yearBorn || !isValidYear(yearBorn) || parseInt(yearBorn) >= currentYear) {
        showError('yearBornError', "Please enter a valid 4-digit year.");
        isValid = false;
    }

    // Validate City
    if (!cityElement || cityElement.value === "" || isValidCity(cityElement)) {
        showError('cityError', "Please select a city.");
        isValid = false;
    }

    // Validate Hobbies (at least one must be selected)
    if (validateHobbies(selectedHobbies) ) {
        showError('hobbiesError', "Please select at least one hobby.");
        isValid = false;
    }

    // Validate Password
    if (!password || !isValidPassword(password)) {
        showError('pwError', "Password must be at least 6 characters.");
        isValid = false;
    }

    // Validate Confirm Password
    if (!passwordConfirm || password !== passwordConfirm) {
        showError('pwConfirmError', "Passwords do not match.");
        isValid = false;
    }
    console.log("isValid:", isValid);
    if (isValid) {
        console.log("all validated ok!");
        SendToSQL(userName, firstName, lastName, email, genderElement ? genderElement.querySelector('input[type="radio"]:checked')?.value : "Not selected", phonePrefixElement ? phonePrefixElement.value : "Not selected", phone, yearBorn, cityElement ? cityElement.value : "Not selected", selectedHobbies, password, passwordConfirm);
    }

    return isValid;
}

function validateGender(genderElement) {
    const selectedGender = genderElement.querySelector('input[type="radio"]:checked');
    return selectedGender !== null; 
}
function validateUserName(username) {
    const usernameRegex = /^[\w\u0590-\u05FF\s\W]{6,30}$/;
    return usernameRegex.test(username);
}

function isValidName(name) {
    const nameRegex = /^[A-Za-z\u0590-\u05FF]{2,50}$/;
    return nameRegex.test(name);
}

function validateEmail(email) {
    const atIndex = email.indexOf('@');
    const atLastIndex = email.lastIndexOf('@');
    if (atIndex === -1 || atIndex !== atLastIndex || atIndex < 2 || atIndex === email.length - 1) {
        return false;
    }
    const domainPart = email.slice(atIndex + 1);
    const dotIndex = domainPart.indexOf('.');
    if (dotIndex === -1 || dotIndex < 2 || dotIndex === domainPart.length - 1) {
        return false;
    }
    const emailRegex = /^[A-Za-z\u0590-\u05FF0-9@._\-]+$/;
    return emailRegex.test(email);
}

function isValidPhone(phone) {
    const phoneRegex = /^[0-9]{7,10}$/;
    return phoneRegex.test(phone);
}

function isValidPrefix(prefix) {
    const allowedPrefixes = ['077', '08', '04', '03', '02', '057', '054', '053', '052', '050'];
    return allowedPrefixes.includes(prefix);
}

function isValidCity(city) {
    const allowedCities = ['Tel Aviv', 'Jerusalem', 'Haifa', 'Beer Sheva', 'Eilat', 'Ashdod', 'Netanya'];
    return allowedCities.includes(city);
}

function isValidYear(year) {
    const currentYear = new Date().getFullYear();
    const parsedYear = parseInt(year, 10);
    return !isNaN(parsedYear) && parsedYear >= 1900 && parsedYear <= currentYear;
}

function isValidPassword(password) {
    return password.length >= 6;
}

function passwordsMatch(password, passwordConfirm) {
    return password === passwordConfirm;
}

function validateHobbies(selectedHobbies) {
    return hobbies.length > 0;
}


function SendToSQL(userName, firstName, lastName, email, genderValue, phonePrefix, phone, yearBorn, city, hobbies, password, passwordConfirm) {
    let formData = new FormData();

    console.log("------------SendToSQL------------");
    console.log("User Name:", userName);
    console.log("First Name:", firstName);
    console.log("Last Name:", lastName);
    console.log("Email:", email);
    console.log("Gender:", genderValue);
    phone = phonePrefix + phone;
    console.log("Phone:", phone);
    console.log("Year Born:", yearBorn);
    console.log("City:", city);
    console.log('users_password', password);
    console.log('users_password_authentication', passwordConfirm);

    const hobbyValues = Array.from(hobbies).map(hobby => hobby.value);
    formData.append('hobbies', hobbyValues.join(', '));

    formData.append('users_name', userName);
    formData.append('users_first_name', firstName);
    formData.append('users_last_name', lastName);
    formData.append('email', email);
    formData.append('gender', genderValue);
    formData.append('phone', phone);
    formData.append('yearBorn', yearBorn);
    formData.append('city', city);
    formData.append('admin', 0);
    formData.append('users_password', password);
    
    formData.append('formPage', 'signup');
    fetch('/pages/aspx/SqlCode.aspx', {
        method: 'POST',
        body: formData
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.text();
        })
        .then(data => {
            if (data.includes("Signup successed!")) {
                window.location.href = "../aspx/HomePage.aspx";
                alert("Signup successed")
            }

            else if (data.includes("Signup failed")) {
                alert("Signup failed")
            }

            else if (data.includes("email is unique")) {
                console.error("This Email is alreeady been used!")
            }
        })
        .catch(error => {
            console.error("Error during registration:", error);
            console.error(response.text()); //השגיאה לא נראת //
        });
}
