using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;

//לעשות שיהיו הדפסות למסך כאשר יש אימייל שכבר קיים//
namespace SqlCode_namespace
{
    public partial class Sql_code : System.Web.UI.Page
    {
        private static string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string formSource = HttpContext.Current.Request.Form["formPage"];
                Response.Write("formPage value: " + formSource + "\n");

                if (formSource == "signup")
                {
                    bool result = ProcessSignupForm();
                    if (result)
                    {
                        Response.Write("Signup successed!");
                    }

                }
                else if (formSource == "login")
                {
                    bool result = ProcessLogInForm();

                    if (result)
                    {
                        Dictionary<string, string> userDetails = GetUserDetailsFromDB(HttpContext.Current.Request.Form["users_name"]);
                        Session["username"] = HttpContext.Current.Request.Form["users_name"];
                        Session["first_name"] = userDetails.ContainsKey("first_name") ? userDetails["first_name"] : "";
                        Session["last_name"] = userDetails.ContainsKey("last_name") ? userDetails["last_name"] : "";
                        Session["email"] = userDetails.ContainsKey("email") ? userDetails["email"] : "";
                        Session["admin"] = userDetails.ContainsKey("admin") && int.TryParse(userDetails["admin"].ToString(), out int adminValue) ? adminValue : 0;
                        Response.Write("Welcome!");
                        /*if (Session["admin"] != null && Convert.ToInt32(Session["admin"]) == 1)
                        {
                            RunQuery("SELECT * FROM users", null);
                        }*/


                    }
                    else
                    {
                        Response.Clear();
                        Response.Write("Invalid login.");
                    }
                    Response.End();
                }


                else if (formSource == "new tip")
                {
                    bool result = InsertNewTip();
                    if (result)
                    {
                        Response.Write("New Tip Was Added!");
                    }
                }
            }
        }

        // פונקציה המרה של הקלט לטופס
        public static string[][] ConvertFormToParams(HttpRequest request)
        {
            List<string[]> paramList = new List<string[]>();
            foreach (string key in request.Form.Keys)
            {
                if (!string.IsNullOrWhiteSpace(request.Form[key]))
                {
                    paramList.Add(new string[] { key, request.Form[key] });
                }
            }
            return paramList.ToArray();  // שינוי ל-ToArray
        }

        private static (bool success, object result) RunQuery(string query, string[][] parms)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parms != null)
                    {
                        foreach (var param in parms)
                        {
                            if (param.Length == 2)
                            {
                                cmd.Parameters.AddWithValue("@" + param[0], param[1]);


                            }
                        }
                    }

                    try
                    {
                        con.Open();
                        if (query.Trim().StartsWith("SELECT", StringComparison.OrdinalIgnoreCase))
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                var results = new List<Dictionary<string, object>>();
                                while (reader.Read())
                                {
                                    var row = new Dictionary<string, object>();
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        row[reader.GetName(i)] = reader.GetValue(i);
                                    }
                                    results.Add(row);
                                }
                                return (true, results);
                            }
                        }
                        else
                        {
                            int rowsAffected = cmd.ExecuteNonQuery();
                            return (rowsAffected > 0, null);
                        }
                    }
                    catch (Exception ex)
                    {
                        HttpContext.Current.Response.Write($"General Error: {ex.Message}\n");
                        return (false, null);
                    }
                }
            }
        }

        // פונקציה לבדיקת התחברות המשתמשים
        private bool ProcessLogInForm()
        {
            try
            {
                string query = "SELECT users_name, users_first_name, users_last_name, email FROM users WHERE users_name = @users_name AND users_password = @users_password";

                var formParams = ConvertFormToParams(HttpContext.Current.Request);
                var queryResult = RunQuery(query, formParams);

                if (queryResult.result is List<Dictionary<string, object>> results && results.Count > 0)
                {
                    // שמירת פרטי המשתמש ב-Session
                    Session["users_first_name"] = results[0]["users_first_name"].ToString();
                    Session["users_last_name"] = results[0]["users_last_name"].ToString();
                    Session["email"] = results[0]["email"].ToString();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message + "\n");
                return false;
            }
        }

        private Dictionary<string, string> GetUserDetailsFromDB(string username)
        {
            Dictionary<string, string> userDetails = new Dictionary<string, string>();

            // שאילתה לשליפת פרטי המשתמש
            string query = "SELECT users_first_name, users_last_name, email, admin FROM users WHERE users_name = @username";

            try
            {
                string[][] Params = new string[][] {
            new string[] { "username", username }
        };

                var queryResult = RunQuery(query, Params);

                if (queryResult.result is List<Dictionary<string, object>> results && results.Count > 0)
                {
                    var row = results[0];

                    userDetails["first_name"] = row["users_first_name"].ToString();
                    userDetails["last_name"] = row["users_last_name"].ToString();
                    userDetails["email"] = row["email"].ToString();
                    userDetails["admin"] = row["admin"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error retrieving user details: " + ex.Message);
            }

            return userDetails;
        }
        private bool ProcessSignupForm()
        {
            try
            {
                // שאילתה להוספת משתמש חדש למסד הנתונים
                string query = @"INSERT INTO users (users_name, users_first_name, users_last_name, email, gender, phone, yearBorn, city, hobbies, users_password, admin)
VALUES (@users_name, @users_first_name, @users_last_name, @email, @gender, @phone, @yearBorn, @city, @hobbies, @users_password, @admin);
";

                // המרת נתוני הטופס לפרמטרים
                var formParams = ConvertFormToParams(HttpContext.Current.Request);

                // הרצת השאילתה
                var queryResult = RunQuery(query, formParams);

                // אם הפעולה הצליחה
                if (queryResult.success)
                {
                    // שמירת פרטי המשתמש ב-Session
                    Session["username"] = HttpContext.Current.Request.Form["users_name"];
                    Session["first_name"] = HttpContext.Current.Request.Form["users_first_name"];
                    Session["last_name"] = HttpContext.Current.Request.Form["users_last_name"];
                    Session["email"] = HttpContext.Current.Request.Form["email"];
                    return true;  // רישום הצליח
                }
                else
                {
                    return false;  // הרישום נכשל
                }
            }
            catch (Exception ex)
            {
                // טיפול בשגיאות והחזרת הודעה
                Response.Write("Error: " + ex.Message + "\n");
                return false;
            }
        }

        private bool InsertNewTip()
        {

            DateTime currentDate = DateTime.Now;

            string query = @"INSERT INTO tips (tip name, tip date, tip text, tip subject, tip related files)
  VALUES (@tip name, @tip date, @tip text, @tip subject, @tip related files);
  ";
            var formParams = ConvertFormToParams(HttpContext.Current.Request);

            var queryResult = RunQuery(query, formParams);
            if (queryResult.success)
            {
                return true;
            }
            return false;


        }
    }
}
