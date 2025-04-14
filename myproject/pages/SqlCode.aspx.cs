using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;

namespace Namespace
{
    public partial class Sql_code : System.Web.UI.Page
    {
        private static string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string formSource = Request.Form["formPage"];
                Response.Write("formPage value: " + formSource + "\n");

                if (formSource == "signup")
                {
                    ProcessSignupForm();
                }
                else if (formSource == "login")
                {
                    bool result = ProcessLogInForm();

                    if (result)
                    {
                        // שמירת פרטי המשתמש ב-Session
                        Dictionary<string, string> userDetails = GetUserDetailsFromDB(Request.Form["users_name"]);
                        Session["username"] = Request.Form["users_name"];
                        Session["first_name"] = userDetails.ContainsKey("first_name") ? userDetails["first_name"] : "";
                        Session["last_name"] = userDetails.ContainsKey("last_name") ? userDetails["last_name"] : "";
                        Session["email"] = userDetails.ContainsKey("email") ? userDetails["email"] : "";

                        // מחזיר הודעה פשוטה ל-JavaScript
                        //Response.Clear();  // מנקה את כל ה-HTML של הדף
                        Response.Write("Welcome!");  
                    }
                    else
                    {
                        // במקרה שהמשתמש לא נמצא, מחזיר הודעה ל-JavaScript
                        Response.Clear();
                        Response.Write("Invalid login.");
                    }
                    Response.End();
                }




                else
                {
                    Response.Clear();
                    Response.Write("Invalid request.");
                    Response.End();
                }
            }
        }

        private void ProcessSignupForm()
        {
            try
            {
                Response.Write("Processing Signup Form..\n");

                string query = @"INSERT INTO users (users_name, users_first_name, users_last_name, email, gender, phone, yearBorn, city, hobbies , users_password)
                         VALUES (@users_name, @users_first_name, @users_last_name, @email, @gender, @phone, @yearBorn, @city, @hobbies , @users_password)";

                var formParams = ConvertFormToParams(Request);

                var queryResult = RunQuery(query, formParams);
                if (queryResult.success)
                {
                    Response.Write("Data inserted successfully\n");

                    // שמירת פרטי המשתמש ב-Session
                    Dictionary<string, string> userDetails = GetUserDetailsFromDB(Request.Form["users_name"]);
                    Session["username"] = Request.Form["users_name"];
                    Session["first_name"] = userDetails.ContainsKey("first_name") ? userDetails["first_name"] : "";
                    Session["last_name"] = userDetails.ContainsKey("last_name") ? userDetails["last_name"] : "";
                    Session["email"] = userDetails.ContainsKey("email") ? userDetails["email"] : "";

                    // הפניה לדף פרטי המשתמש
                   Response.Redirect("UserPage.aspx", false);  // false ימנע את ThreadAbortException
                    HttpContext.Current.ApplicationInstance.CompleteRequest();  // מסיים את הבקשה בצורה בטוחה
                }
                else
                {
                    Response.Write("Data was not successfully entered\n");
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message + "\n");
                if (ex.InnerException != null)
                {
                    Response.Write("Inner Exception: " + ex.InnerException.Message + "\n");
                }
            }
        }

        private (bool success, object result) RunQuery(string query, string[][] parms)
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
                        Response.Write($"General Error: {ex.Message}\n");
                        return (false, null);
                    }
                }
            }
        }

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
            return paramList.ToArray();
        }

        private bool ProcessLogInForm()
        {
            try
            {
                Response.Write("Processing Log In Form..\n");

                // בדיקת פרטי המשתמש
                string query = "SELECT users_name, users_first_name, users_last_name, email FROM users WHERE users_name = @users_name AND users_password = @users_password";

                var formParams = ConvertFormToParams(Request);
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

            string query = "SELECT users_first_name, users_last_name, email FROM users WHERE users_name = @username";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    userDetails["first_name"] = reader["users_first_name"].ToString();
                    userDetails["last_name"] = reader["users_last_name"].ToString();
                    userDetails["email"] = reader["email"].ToString();
                }
            }

            return userDetails;
        }
    }
}
