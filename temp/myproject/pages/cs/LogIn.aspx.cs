using System;
using System.Data.SqlClient;

namespace Namespace
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // זהו קוד שעולה בכל טעינת הדף
        }

        // הפונקציה שמטפלת בלחיצה על הכפתור
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim(); 
            string password = txtPassword.Text.Trim();


            // בדיקה אם המשתמש קיים במאגר
            if (IsUserExistsInDatabase(username, password))
            {
                // שמירת פרטי המשתמש בסשן
                Session["username"] = username;
                Response.Redirect("/pages/Home Page/HomePage.aspx");

                Response.Write("Welcome!");
            }
            else
            {
                Response.StatusCode = 401;  // התחברות לא מוצלחת
                Response.Write("Invalid login.");
            }
        }

        // פונקציה שבודקת אם המשתמש קיים במסד הנתונים
        private bool IsUserExistsInDatabase(string username, string password)
        {
            bool userExists = false;

            string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM users WHERE users_name = @username AND users_password = @password";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);

                        int count = (int)cmd.ExecuteScalar();

                        if (count > 0)
                        {
                            userExists = true;  // המשתמש קיים
                        }
                    }
                }
                catch (Exception ex)
                {
                    // טיפול בשגיאות במסד הנתונים
                    throw new Exception("Error connecting to the database: " + ex.Message);
                }
            }

            return userExists;
        }
    }
}
