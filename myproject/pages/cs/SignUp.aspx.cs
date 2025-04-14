using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Threading;


namespace MyProject
{
    public partial class Signup : Page
    {
        private static string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // Page.Title = "Sign Up";
                string userName = (string)Session["UserName"];
                if (!string.IsNullOrEmpty(userName))
                {
                    Response.Write($"<script>alert('Welcome back, {userName}!');</script>");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string userName = Request.Form["uName"];
            string firstName = Request.Form["fName"];
            string lastName = Request.Form["lName"];
            string email = Request.Form["email"];
            string password = Request.Form["pw"];
            string confirmPassword = Request.Form["pwConfirm"];
            string gender = Request.Form["gender"];
            string phone = Request.Form["phone"];
            string yearBorn = Request.Form["yearBorn"];
            string city = Request.Form["city"];
            string hobbies = Request.Form["hobbies"]; 

            if (ValidateForm(userName, firstName, lastName, email, gender, phone, yearBorn, city, hobbies, password, confirmPassword))
            {
                try
                {
                    SaveUserToDatabase(userName, firstName, lastName, email, password);
                    Session["UserName"] = userName;
                    Session["FirstName"] = firstName;
                    Session["LastName"] = lastName;
                    Session["Email"] = email;
                  // Response.Write($"[SIGN UP] Session FirstName: { Session["FirstName"]}  Session LastName: {Session["LastName"]}");
                   // Thread.Sleep(10000);
                    Response.Redirect("../aspx/HomePage.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Validation failed');</script>");
            }
        }


        private void SaveUserToDatabase(string userName, string firstName, string lastName, string email, string password)
        {
            string query = @"INSERT INTO users (users_name, users_first_name, users_last_name, email, users_password) 
                             VALUES (@UserName, @FirstName, @LastName, @Email, @Password)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }


        private bool ValidateForm(string userName, string firstName, string lastName, string email, string gender,
                                  string phone, string yearBorn, string city, string hobbies, string password, string confirmPassword)
        {
            bool isValid = true;

            if (string.IsNullOrEmpty(userName) || !IsValidName(userName)) isValid = false;
            if (string.IsNullOrEmpty(firstName) || !IsValidName(firstName)) isValid = false;
            if (string.IsNullOrEmpty(lastName) || !IsValidName(lastName)) isValid = false;
            if (string.IsNullOrEmpty(email) || !IsValidEmail(email)) isValid = false;
            if (string.IsNullOrEmpty(gender)) isValid = false;
            if (string.IsNullOrEmpty(phone) || !IsValidPhone(phone)) isValid = false;
            if (string.IsNullOrEmpty(yearBorn) || !IsValidYear(yearBorn)) isValid = false;
            if (string.IsNullOrEmpty(city)) isValid = false;
            if (string.IsNullOrEmpty(hobbies)) isValid = false;
            if (string.IsNullOrEmpty(password) || !IsValidPassword(password)) isValid = false;
            if (password != confirmPassword) isValid = false;

            return isValid;
        }

        private bool IsValidName(string name)
        {
            return Regex.IsMatch(name, @"^[A-Za-z\u0590-\u05FF]{2,50}$");
        }

        private bool IsValidEmail(string email)
        {
            string pattern = @"^[^\s@]+@[^\s@]+\.[^\s@]+$";
            return Regex.IsMatch(email, pattern);
        }

        private bool IsValidPhone(string phone)
        {
            return Regex.IsMatch(phone, @"^[0-9]{7,10}$");
        }

        private bool IsValidYear(string year)
        {
            if (int.TryParse(year, out int yearInt))
            {
                int currentYear = DateTime.Now.Year;
                return yearInt >= 1900 && yearInt <= currentYear;
            }
            return false;
        }

        private bool IsValidPassword(string password)
        {
            return password.Length >= 6;
        }
    }
}
