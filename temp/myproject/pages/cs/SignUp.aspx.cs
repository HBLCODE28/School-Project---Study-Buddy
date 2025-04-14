using System;
using System.Text.RegularExpressions;
using System.Web.UI;


namespace MyProject
{
    public partial class Signup : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // בדוק אם זה פוסטבק ואם יש שם משתמש שהוזן (אם נרשם בהצלחה)
                string userName = Request.Form["users_name"];

                if (!string.IsNullOrEmpty(userName))
                {
                    // שמירת שם המשתמש ב-Session
                    Session["UserName"] = userName;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           

            // קבלת הערכים מהטופס
            string userName = Request.Form["uName"];
            string firstName = Request.Form["fName"];
            string lastName = Request.Form["lName"];
            string email = Request.Form["email"];
            string gender = Request.Form["gender"];
            string phonePrefix = Request.Form["prefix"];  // קידומת הטלפון
            string phone = Request.Form["phone"];
            string yearBorn = Request.Form["yearBorn"];
            string city = Request.Form["city"];
            string hobbies = Request.Form["hobbies"];  // במידה ויש בחירת תחביבים
            string password = Request.Form["pw"];
            string confirmPassword = Request.Form["pwConfirm"];

            // לוודא שצד השרת מבצע את כל הוולידציות הדרושות
            if (ValidateForm())
            {
                Response.Write("<script>alert('Registration successful!');</script>");
                Response.Redirect("Sql_code.aspx?commend=Insert&users_Name="+ userName + "users_first_name=" + firstName +
                           "&users_last_name=" + lastName +       
                           "&email=" + email +
                           "&gender=" + gender +
                           "&phone=" + phonePrefix + phone +  // חיבור הקידומת למספר הטלפון
                           "&yearBorn=" + yearBorn +
                           "&city=" + city +
                           "&hobbies=" + hobbies +
                           "&users_password=" + password +
                           "&users_password_authentication=" + confirmPassword);
            }
            else
            {
                Response.Write("<script>alert('There are validation errors in the form.');</script>");
            }
        }

        private bool ValidateForm()
        {
            bool isValid = true;

            // בדיקת שם משתמש
            if (string.IsNullOrEmpty(uName.Text.Trim()) || !IsValidName(uName.Text.Trim()))
            {
                uNameError.Visible = true;
                isValid = false;
            }
            // בדיקת שם פרטי
            if (string.IsNullOrEmpty(fName.Text.Trim()) || !IsValidName(fName.Text.Trim()))
            {
                fNameError.Visible = true;
                isValid = false;
            }
            else
            {
                fNameError.Visible = false;
            }

            // בדיקת שם משפחה
            if (string.IsNullOrEmpty(lName.Text.Trim()) || !IsValidName(lName.Text.Trim()))
            {
                lNameError.Visible = true;
                isValid = false;
            }
            else
            {
                lNameError.Visible = false;
            }

            // בדיקת כתובת דוא"ל
            if (string.IsNullOrEmpty(email.Text.Trim()) || !IsValidEmail(email.Text.Trim()))
            {
                emailError.Visible = true;
                isValid = false;
            }
            else
            {
                emailError.Visible = false;
            }

            // בדיקת מין
            if (string.IsNullOrEmpty(gender.SelectedValue))
            {
                genderError.Visible = true;
                isValid = false;
            }
            else
            {
                genderError.Visible = false;
            }

            // בדיקת קידומת טלפון
            if (string.IsNullOrEmpty(prefix.SelectedValue))
            {
                phoneError.Visible = true;
                isValid = false;
            }
            else
            {
                phoneError.Visible = false;
            }

            // בדיקת מספר טלפון
            if (string.IsNullOrEmpty(phone.Text.Trim()) || !IsValidPhone(phone.Text.Trim()))
            {
                phoneError.Visible = true;
                isValid = false;
            }
            else
            {
                phoneError.Visible = false;
            }

            // בדיקת שנת לידה
            if (string.IsNullOrEmpty(yearBorn.Text.Trim()) || !IsValidYear(yearBorn.Text.Trim()))
            {
                yearBornError.Visible = true;
                isValid = false;
            }
            else
            {
                yearBornError.Visible = false;
            }

            // בדיקת עיר
            if (string.IsNullOrEmpty(city.SelectedValue))
            {
                cityError.Visible = true;
                isValid = false;
            }
            else
            {
                cityError.Visible = false;
            }

            // בדיקת סיסמה
            if (string.IsNullOrEmpty(pw.Text.Trim()) || !IsValidPassword(pw.Text.Trim()))
            {
                pwError.Visible = true;
                isValid = false;
            }
            else
            {
                pwError.Visible = false;
            }

            // בדיקת אימות סיסמה
            if (pw.Text.Trim() != pwConfirm.Text.Trim())
            {
                pwConfirmError.Visible = true;
                isValid = false;
            }
            else
            {
                pwConfirmError.Visible = false;
            }

            return isValid;
        }

        private bool IsValidName(string name)
        {
            // תנאים לשם (רק אותיות, בין 2 ל-50 תווים)
            return Regex.IsMatch(name, @"^[A-Za-z]{2,50}$");
        }

        private bool IsValidEmail(string email)
        {
            // Using regular expression from JavaScript for consistency
            string pattern = @"^[^\s@]+@[^\s@]+\.[^\s@]+$";
            return Regex.IsMatch(email, pattern);
        }

        private bool IsValidPhone(string phone)
        {
            // מספר טלפון יכול להיות באורך 7-10 ספרות
            return Regex.IsMatch(phone, @"^[0-9]{7,10}$");
        }

        private bool IsValidYear(string year)
        {
            // לוודא שהשנה היא מספר בן 4 ספרות ולא יותר מהשנה הנוכחית
            int currentYear = DateTime.Now.Year;
            if (int.TryParse(year, out int yearBorn))
            {
                return yearBorn >= 1900 && yearBorn <= currentYear;
            }
            return false;
        }

        private bool IsValidPassword(string password)
        {
            // סיסמה צריכה להיות באורך של לפחות 6 תווים
            return password.Length >= 6;
        }



    }
}
