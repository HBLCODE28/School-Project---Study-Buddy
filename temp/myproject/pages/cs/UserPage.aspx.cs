using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using HUtilities;


namespace UserPageNameSpace
{
    public partial class UserPage : System.Web.UI.Page
    {
        private static string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                // קבלת פרטי המשתמש מהסשן והצגתם בעמוד
                lblUserName.Text = Session["username"] != null ? Session["username"].ToString() : " ";
                lblFirstName.Text = Session["first_name"] != null ? Session["first_name"].ToString() : "";
                lblLastName.Text = Session["last_name"] != null ? Session["last_name"].ToString() : "";
                lblEmail.Text = Session["email"] != null ? Session["email"].ToString() : "";
                QueryResultLabel.Text = Session["admin"] != null ? Convert.ToInt32(Session["admin"]).ToString() : "0";
                if (QueryResultLabel.Text=="1")
                {
                    showTable();
                }
                UserTipsLiteral.Text=showUserTips(lblUserName.Text);

            }
        }
        /* public void showTable()
         {
             string query = "SELECT * FROM users";


             // הרצת השאילתה וקבלת התוצאה
             var queryResult = RunQuery(query, null).result;

             // בדיקה שהתוצאה אינה ריקה
             if (queryResult != null && queryResult is List<Dictionary<string, object>>)
             {
                 // המרת התוצאה לרשימה של מילונים
                 var listOfDictionaries = queryResult as List<Dictionary<string, object>>;

                 // תחילת טבלת HTML
                 HttpContext.Current.Response.Write("<table border='1' cellpadding='5' cellspacing='0'>");

                 // הדפסת כותרות (Headers) מתוך המפתחות של המילון הראשון
                 if (listOfDictionaries.Count > 0)
                 {
                     HttpContext.Current.Response.Write("<tr>");
                     foreach (var header in listOfDictionaries[0].Keys)
                     {
                         HttpContext.Current.Response.Write($"<th>{header}</th>");
                     }
                     HttpContext.Current.Response.Write("</tr>");
                 }

                 // הדפסת נתונים (Data) מתוך כל מילון
                 foreach (var dictionary in listOfDictionaries)
                 {
                     HttpContext.Current.Response.Write("<tr>"); // תחילת שורת נתונים
                     foreach (var kvp in dictionary)
                     {
                         HttpContext.Current.Response.Write($"<td>{kvp.Value}</td>"); // הדפסת כל ערך בתא טבלה
                     }
                     HttpContext.Current.Response.Write("</tr>"); // סיום שורת נתונים
                 }

                 // סיום טבלת HTML
                 HttpContext.Current.Response.Write("</table>");
             }
             else
             {
                 // במידה ואין תוצאה, הצגת הודעת שגיאה
                 HttpContext.Current.Response.Write("No results found.<br/>");
             }


         }*/

        public string showUserTips(string UserName)
        {
            string query = "SELECT * FROM tips WHERE UserName = @UserName;";
            string UserTipsLiteral = " ";
            string[][] parameters = new string[][]
            {
    new string[] {"UserName" , UserName },  

            };

            var queryResult = Utils.RunQuery(query, parameters);
            var tips = queryResult.result as List<Dictionary<string, object>>;
            try
            {
                if (tips != null && tips.Any()) // בדיקה אם יש פריטים במערך
                {
                    foreach (var tip in tips)
                    {
                        foreach (var kvp in tip)
                        {
                            UserTipsLiteral = UserTipsLiteral + ($"{kvp.Key}: {kvp.Value}<br />");
                        }
                        UserTipsLiteral = UserTipsLiteral + ("-----------------------------<br />");
                    }
                }
                else
                {
                    UserTipsLiteral = UserTipsLiteral + ("You didn't post any tips!.<br />");
                }
            }
            catch (Exception ex) // תופס את כל החריגות ומדפיס אותן
            {
                UserTipsLiteral = UserTipsLiteral + ($"An error occurred: {ex.Message}<br />");
            } 
            
            return UserTipsLiteral;

           

        }
        public void showTable()
        {
            string query = "SELECT * FROM users";

            // Run the query and get the result
            var queryResult = RunQuery(query, null).result;

            // Check if the result is not empty
            if (queryResult != null && queryResult is List<Dictionary<string, object>>)
            {
                var listOfDictionaries = queryResult as List<Dictionary<string, object>>;

                // Table and cell styles
                string tableStyle = "border-collapse: collapse; width: 100%;";
                string headerStyle = "background-color: #f2f2f2; font-weight: bold; padding: 8px; border: 1px solid black;";
                string cellStyle = "padding: 8px; border: 1px solid black; text-align: left;";

                // Start HTML table
                HttpContext.Current.Response.Write($"<table style='{tableStyle}'>");

                // Print headers
                if (listOfDictionaries.Count > 0)
                {
                    HttpContext.Current.Response.Write("<tr>");
                    foreach (var header in listOfDictionaries[0].Keys)
                    {
                        HttpContext.Current.Response.Write($"<th style='{headerStyle}'>{header}</th>");
                    }
                    HttpContext.Current.Response.Write("</tr>");
                }

                // Print data rows
                foreach (var dictionary in listOfDictionaries)
                {
                    HttpContext.Current.Response.Write("<tr>");
                    foreach (var kvp in dictionary)
                    {
                        HttpContext.Current.Response.Write($"<td style='{cellStyle}'>{kvp.Value}</td>");
                    }
                    HttpContext.Current.Response.Write("</tr>");
                }

                // End HTML table
                HttpContext.Current.Response.Write("</table>");
            }
            else
            {
                // No results found
                HttpContext.Current.Response.Write("<p>No results found.</p>");
            }
        }

        
 

    }
}
/*using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
 namespace UtilsCode.Utilities
{

    internal static class Utils

    {
        private static string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";

        public static (bool success, object result) RunQuery(string query, string[][] parms)
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

    }
}
*/