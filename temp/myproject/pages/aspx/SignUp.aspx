<%@ Page Title="Sign Up" Language="C#" AutoEventWireup="true" CodeFile="../cs/signup.aspx.cs" Inherits="MyProject.Signup" MasterPageFile="../Master/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Sign Up</h1>
    <script src="../js/signup.js" type="text/javascript"></script>
      <asp:HiddenField ID="formPage" runat="server" Value="signup" />

    <div class="container my-5">
    <!-- User Name -->
    <div class="form-outline mb-4">
        <label class="form-label" for="uName">User Name:</label>
        <asp:TextBox ID="uName" runat="server" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="uNameError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="User Name must be 6-30 characters" />
    </div>

    <!-- Last Name -->
    <div class="form-outline mb-4">
        <label class="form-label" for="lName">Last Name:</label>
        <asp:TextBox ID="lName" runat="server" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="lNameError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Last Name is required and must be 2-50 alphabetic characters (without space between characters)." />
    </div>

    <!-- First Name -->
    <div class="form-outline mb-4">
        <label class="form-label" for="fName">First Name:</label>
        <asp:TextBox ID="fName" runat="server" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="fNameError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="First Name is required and must be 2-50 alphabetic characters." />
    </div>

    <!-- Email -->
    <div class="form-outline mb-4">
        <label class="form-label" for="email">Email:</label>
        <asp:TextBox ID="email" runat="server" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="emailError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Please enter a valid email address." />
    </div>

    <!-- Gender -->
    <div class="form-outline mb-4">
        <label class="form-label">Gender:</label>
        <asp:RadioButtonList ID="gender" runat="server" CssClass="btn-group" ClientIDMode="Static" RepeatDirection="Horizontal">
            <asp:ListItem Text="Male" Value="Male" />
            <asp:ListItem Text="Female" Value="Female" />
        </asp:RadioButtonList>
        <asp:Label ID="genderError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Please select a gender." />
    </div>

    <!-- Phone Prefix -->
    <div class="form-outline mb-4">
        <label class="form-label" for="prefix">Phone Prefix:</label>
        <asp:DropDownList ID="prefix" runat="server" CssClass="form-select" ClientIDMode="Static">
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
        <asp:Label ID="phoneError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Please select a phone prefix." />
    </div>

    <!-- Phone Number -->
    <div class="form-outline mb-4">
        <label class="form-label" for="phone">Phone:</label>
        <asp:TextBox ID="phone" runat="server" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="Label1" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Phone Number must be 7-10 digits." />
    </div>

    <!-- Year Born -->
    <div class="form-outline mb-4">
        <label class="form-label" for="yearBorn">Year Born:</label>
        <asp:TextBox ID="yearBorn" runat="server" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="yearBornError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Please enter a valid 4-digit year." />
    </div>

    <!-- City -->
    <div class="form-outline mb-4">
        <label class="form-label" for="city">City:</label>
        <asp:DropDownList ID="city" runat="server" CssClass="form-select" ClientIDMode="Static">
            <asp:ListItem Text="Tel Aviv" Value="Tel Aviv" />
            <asp:ListItem Text="Jerusalem" Value="Jerusalem" />
            <asp:ListItem Text="Haifa" Value="Haifa" />
            <asp:ListItem Text="Be'er Sheva" Value="Be'er Sheva" />
            <asp:ListItem Text="Netanya" Value="Netanya" />
            <asp:ListItem Text="Ashdod" Value="Ashdod" />
            <asp:ListItem Text="Eilat" Value="Eilat" />
        </asp:DropDownList>
        <asp:Label ID="cityError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Please select a city." />
    </div>

    <!-- Hobbies -->
    <div class="form-outline mb-4">
        <label class="form-label">Hobbies:</label>
        <asp:CheckBoxList ID="hobbies" runat="server" CssClass="form-check" ClientIDMode="Static">
            <asp:ListItem Text="Reading" Value="Reading" />
            <asp:ListItem Text="Traveling" Value="Traveling" />
            <asp:ListItem Text="Sports" Value="Sports" />
            <asp:ListItem Text="Music" Value="Music" />
            <asp:ListItem Text="Cooking" Value="Cooking" />
        </asp:CheckBoxList>
        <asp:Label ID="hobbiesError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Please select at least one hobby." />
    </div>

    <!-- Password -->
    <div class="form-outline mb-4">
        <label class="form-label" for="pw">Password:</label>
        <asp:TextBox ID="pw" runat="server" TextMode="Password" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="pwError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Password must be at least 6 characters." />
    </div>

    <!-- Confirm Password -->
    <div class="form-outline mb-4">
        <label class="form-label" for="pwConfirm">Confirm Password:</label>
        <asp:TextBox ID="pwConfirm" runat="server" TextMode="Password" CssClass="form-control" ClientIDMode="Static" />
        <asp:Label ID="pwConfirmError" runat="server" CssClass="form-label text-danger" ClientIDMode="Static" style="display:none;" Text="Passwords do not match." />
    </div>

    <!-- Submit Button -->
    <div class="text-center">
        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Sign Up" OnClientClick="return validateForm(event);" />
    </div>
</div>


</asp:Content>