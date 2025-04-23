<%@ Page Title="Sign Up" Language="C#" AutoEventWireup="true" CodeFile="../cs/signup.aspx.cs" Inherits="MyProject.Signup" MasterPageFile="../Master/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center my-4">Sign Up</h1>
    <script src="../js/signup.js" type="text/javascript"></script>
    <asp:HiddenField ID="formPage" runat="server" Value="signup" />

    <div class="container my-5">


        <!-- User Name -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="uName" runat="server" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="uName">User Name</label>
            <asp:Label ID="uNameError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="User Name must be 6-30 characters" />
        </div>

        <!-- Last Name -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="lName" runat="server" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="lName">Last Name</label>
            <asp:Label ID="lNameError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Last Name is required and must be 2-50 alphabetic characters (without space between characters)." />
        </div>

        <!-- First Name -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="fName" runat="server" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="fName">First Name</label>
            <asp:Label ID="fNameError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="First Name is required and must be 2-50 alphabetic characters." />
        </div>

        <!-- Email -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="email" runat="server" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="email">Email</label>
            <asp:Label ID="emailError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;"></asp:Label>        

        </div>

        <!-- Gender -->
        <div class="form-field mb-3">
            <label class="form-label">Gender</label>
            <div>
                <asp:RadioButtonList ID="gender" runat="server" CssClass="form-check-inline slippery-snail" ClientIDMode="Static" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Male" Value="Male" CssClass="form-check-input" />
                    <asp:ListItem Text="Female" Value="Female" CssClass="form-check-input" />
                </asp:RadioButtonList>
            </div>
            <asp:Label ID="genderError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Please select a gender." />
        </div>

        <!-- Phone Prefix -->
        <div class="form-floating mb-3">
            <asp:DropDownList ID="prefix" runat="server" CssClass="form-select slippery-snail" ClientIDMode="Static">
                <asp:ListItem Text="02" Value="02" />
                <asp:ListItem Text="03" Value="03" />
                <asp:ListItem Text="04" Value="04" />
                <asp:ListItem Text="08" Value="08" />
                <asp:ListItem Text="077" Value="077" />
                <asp:ListItem Text="050" Value="050" />
                <asp:ListItem Text="052" Value="052" />
                <asp:ListItem Text="053" Value="053" />
                <asp:ListItem Text="054" Value="054" />
                <asp:ListItem Text="057" Value="057" />
            </asp:DropDownList>
            <label for="prefix">Phone Prefix</label>
            <asp:Label ID="phoneError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Please select a phone prefix." />
        </div>

        <!-- Phone Number -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="phone" runat="server" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="phone">Phone</label>
            <asp:Label ID="Label1" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Phone Number must be 7-10 digits." />
        </div>

        <!-- Year Born -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="yearBorn" runat="server" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="yearBorn">Year Born</label>
            <asp:Label ID="yearBornError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Please enter a valid 4-digit year." />
        </div>

        <!-- City -->
        <div class="form-floating mb-3">
            <asp:DropDownList ID="city" runat="server" CssClass="form-select slippery-snail" ClientIDMode="Static">
                <asp:ListItem Text="Tel Aviv" Value="Tel Aviv" />
                <asp:ListItem Text="Jerusalem" Value="Jerusalem" />
                <asp:ListItem Text="Haifa" Value="Haifa" />
                <asp:ListItem Text="Be'er Sheva" Value="Be'er Sheva" />
                <asp:ListItem Text="Netanya" Value="Netanya" />
                <asp:ListItem Text="Ashdod" Value="Ashdod" />
                <asp:ListItem Text="Eilat" Value="Eilat" />
            </asp:DropDownList>
            <label for="city">City</label>
            <asp:Label ID="cityError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Please select a city." />
        </div>

       <!-- Hobbies -->
<div class="form-field mb-3">
    <label class="form-label"  >Hobbies</label>
<asp:CheckBoxList ID="hobbies" runat="server" CssClass="form-check-input slippery-snail" ClientIDMode="Static" RepeatDirection="Horizontal">
    <asp:ListItem Text=" Reading "  Value="Reading" CssClass="form-check-input" style="margin: 5px;" />
    <asp:ListItem Text=" Traveling " Value="Traveling" CssClass="form-check-input" style="margin: 5px;" />
    <asp:ListItem Text=" Sports"   Value="Sports" CssClass="form-check-input" style="margin: 5px;" />
    <asp:ListItem Text=" Music "  Value="Music" CssClass="form-check-input" style="margin: 5px;" />
    <asp:ListItem Text=" Cooking " Value="Cooking" CssClass="form-check-input" style="margin: 5px;" />
</asp:CheckBoxList>


    <asp:Label ID="hobbiesError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Please select at least one hobby." />
</div>


        <!-- Password -->
        <div class="form-floating mb-3 position-relative">
            <asp:TextBox ID="pw" runat="server" TextMode="Password" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="pw">Password</label>
 <button id="togglePw" type="button" class="password-toggle">
    <i class="fas fa-eye"></i>
</button>
            <asp:Label ID="pwError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Password must be at least 6 characters." />
        </div>

        <!-- Confirm Password -->
        <div class="form-floating mb-3 position-relative">
            <asp:TextBox ID="pwConfirm" runat="server" TextMode="Password" CssClass="form-control slippery-snail" ClientIDMode="Static" placeholder=" " />
            <label for="pwConfirm">Confirm Password</label>
<button id="togglePwConfirm" type="button" class="password-toggle">
    <i class="fas fa-eye"></i>
</button>            
            <asp:Label ID="pwConfirmError" runat="server" CssClass="badge bg-danger text-white mt-1" ClientIDMode="Static" style="display:none;" Text="Passwords do not match." />
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <asp:Button ID="btnSubmit" runat="server" CssClass="button" Text="Sign Up" OnClientClick="return validateForm(event);" />
        </div>

        <!-- Fill Form Button -->
        <div class="text-center mt-3">
            <button id="btnFillForm" class="button" type="button">Fill Form with Random Data</button>
        </div>
    </div>

    <style>
 .container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            text-align: center;
        }


 #hobbies {
    margin-right: 10px;
    padding-right: 5px;
}


    </style>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {

            // כפתור למילוי טופס באופן אוטומטי
            const btnFillForm = document.getElementById("btnFillForm");
            if (btnFillForm) {
                btnFillForm.addEventListener("click", function () {
                    document.getElementById("<%= uName.ClientID %>").value = "randomUser" + Math.floor(Math.random() * 1000);
                    document.getElementById("<%= fName.ClientID %>").value = "John";
                    document.getElementById("<%= lName.ClientID %>").value = "Doe";
                    document.getElementById("<%= email.ClientID %>").value = "john.doe@example.com";
                    document.getElementById("<%= phone.ClientID %>").value = Math.floor(1000000 + Math.random() * 9000000);
                    document.getElementById("<%= yearBorn.ClientID %>").value = "1990";
                    document.getElementById("<%= prefix.ClientID %>").value = "050";
                    document.getElementById("<%= city.ClientID %>").value = "Tel Aviv";
                    document.getElementById("<%= pw.ClientID %>").value = "password123";
                    document.getElementById("<%= pwConfirm.ClientID %>").value = "password123";

            // בחירת מגדר (יש להשתמש ב-ClientID כדי לוודא שהשמות נכונים)
            const genderRadios = document.querySelectorAll('input[name="<%= gender.UniqueID %>"]');
            if (genderRadios.length > 0) {
                genderRadios.forEach(input => {
                    input.checked = (input.value === "Male");
                });
            }

            // בחירת תחביבים (ASP.NET יוצר רשימת CheckBox כטבלה, לכן נבחר את כל ה- checkboxים)
            const hobbyCheckboxes = document.querySelectorAll('#<%= hobbies.ClientID %> input[type="checkbox"]');
            if (hobbyCheckboxes.length > 0) {
                hobbyCheckboxes.forEach(checkbox => {
                    checkbox.checked = Math.random() < 0.5;
                });
            }
        });
    }

    function togglePasswordVisibility(toggleId, inputId) {
        const toggleElement = document.getElementById(toggleId);
        const inputElement = document.getElementById(inputId);

        if (toggleElement && inputElement) {
            toggleElement.addEventListener("click", function () {
                if (inputElement.type === "password") {
                    inputElement.type = "text";
                    toggleElement.innerHTML = '<i class="fas fa-eye-slash"></i>'; // אייקון לעין סגורה
                } else {
                    inputElement.type = "password";
                    toggleElement.innerHTML = '<i class="fas fa-eye"></i>'; // אייקון לעין פתוחה
                }
            });
        }
    }
    
    // קריאה לפונקציה עבור שדות הסיסמה והאימות
            togglePasswordVisibility("togglePw", "<%= pw.ClientID %>");
            togglePasswordVisibility("togglePwConfirm", "<%= pwConfirm.ClientID %>");

        });
        // Function to check if passwords match and show error
        function checkPasswordMatch() {
            const password = document.getElementById('<%= pw.ClientID %>');
    const confirmPassword = document.getElementById('<%= pwConfirm.ClientID %>');
    const pwConfirmError = document.getElementById('<%= pwConfirmError.ClientID %>');

    if (password.value !== confirmPassword.value) {
        pwConfirmError.style.display = 'block';  // Show error if passwords don't match
    } else {
        pwConfirmError.style.display = 'none';  // Hide error if passwords match
    }
}

document.addEventListener("DOMContentLoaded", function () {
    // Add event listeners for password and confirm password fields
    const password = document.getElementById('<%= pw.ClientID %>');
    const confirmPassword = document.getElementById('<%= pwConfirm.ClientID %>');

    if (password && confirmPassword) {
        password.addEventListener('input', checkPasswordMatch);  // Check password match when password is changed
        confirmPassword.addEventListener('input', checkPasswordMatch);  // Check password match when confirm password is changed
    }
});

    </script>

</asp:Content>
