using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;


namespace UserPageNameSpace
{
    public partial class UserPage : System.Web.UI.Page
    {
        private static string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // Page.Title = "Profile";

                // קבלת פרטי המשתמש מהסשן והצגתם בעמוד
                lblUserName.InnerText = Session["UserName"] != null ? Session["UserName"].ToString() : " ";
                lblFirstName.InnerText = Session["FirstName"] != null ? Session["FirstName"].ToString() : "";
                lblLastName.InnerText = Session["LastName"] != null ? Session["LastName"].ToString() : "";
                lblEmail.InnerText = Session["Email"] != null ? Session["Email"].ToString() : "";
                LiteralTable.Text = Session["Admin"] != null ? Convert.ToInt32(Session["Admin"]).ToString() : "0";

                if (LiteralTable.Text == "1")
                {
                    showTable();
                }
                else
                {
                    LiteralTable.Visible = false;
                }
               // UserTipsLiteral.Text = showUserTips(lblEmail.InnerText);
            }
        }


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



    //    public string showUserTips(string UserEmail)
    //    {
    //        string query = "SELECT TipName, TipText, UserEmail, TipDate, TipSubject, TipRelatedFiles FROM tips WHERE UserEmail = @UserEmail ORDER BY TipDate DESC;";

    //        string[][] parameters = new string[][] {
    //    new string[] { "UserEmail", UserEmail }
    //};

    //        var queryResult = RunQuery(query, parameters);
    //        var tips = queryResult.result as List<Dictionary<string, object>>;
    //        List<string> tipsHtml = new List<string>();

    //        try
    //        {
    //            if (tips != null && tips.Any())
    //            {
    //                foreach (var tip in tips)
    //                {
    //                    string tipName = tip["TipName"].ToString();
    //                    string tipText = tip["TipText"].ToString();
    //                    string userEmail = tip["UserEmail"].ToString();
    //                    DateTime tipDate = Convert.ToDateTime(tip["TipDate"]);
    //                    string tipSubject = tip["TipSubject"].ToString();
    //                    string filePath = string.IsNullOrEmpty(tip["TipRelatedFiles"].ToString())
    //                                        ? null
    //                                        : ResolveUrl("../../Uploads/" + Path.GetFileName(tip["TipRelatedFiles"].ToString()));

    //                    // יצירת HTML עבור כל טיפ
    //                    string tipHtml = $@"
    //            <div class='row'>
    //                <div class='col-md-12'>
    //                    <div class='card mb-4 shadow-sm'>
    //                        <div class='card-body'>
    //                            <h5 class='card-title font-weight-bold'>{tipName}</h5>";

    //                    if (!string.IsNullOrEmpty(filePath))
    //                    {
    //                        tipHtml += $"<img src='{filePath}' class='card-img-top mt-3' alt='Related image' style='width: 100%; height: auto; object-fit: cover;' />";
    //                    }

    //                    tipHtml += $@"
    //                            <h6 class='card-subtitle mb-2 text-muted'>By {userEmail} - {tipDate.ToShortDateString()}</h6>
    //                            <p class='card-text' style='color: black;'><strong>Subject:</strong> {tipSubject}</p>
    //                            <p class='card-text' style='color: black;'>{tipText}</p>
    //                        </div>
    //                    </div>
    //                </div>
    //            </div>";

    //                    tipsHtml.Add(tipHtml); // הוספת כל טיפ לרשימה
    //                }
    //            }
    //            else
    //            {
    //                tipsHtml.Add("<p>You haven't posted any tips yet.</p>");
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //            tipsHtml.Add($"<p>An error occurred: {ex.Message}</p>");
    //        }

    //        return string.Join("", tipsHtml); // מצטרף לכל הטיפים
    //    }



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
                StringBuilder tableHtml = new StringBuilder();
                tableHtml.Append("<br><br>Users Table");
                tableHtml.Append($"<table style='{tableStyle}'>");

                // Print headers
                if (listOfDictionaries.Count > 0)
                {
                    tableHtml.Append("<tr>");
                    foreach (var header in listOfDictionaries[0].Keys)
                    {
                        tableHtml.Append($"<th style='{headerStyle}'>{header}</th>");
                    }
                    tableHtml.Append("</tr>");
                }

                // Print data rows
                foreach (var dictionary in listOfDictionaries)
                {
                    tableHtml.Append("<tr>");
                    foreach (var kvp in dictionary)
                    {
                        tableHtml.Append($"<td style='{cellStyle}'>{kvp.Value}</td>");
                    }
                    tableHtml.Append("</tr>");
                }

                // End HTML table
                tableHtml.Append("</table>");

                // Display the table in the Literal control
                LiteralTable.Text = tableHtml.ToString();
            }
            else
            {
                // No results found
                LiteralTable.Text = "<p>No results found.</p>";
            }
        }
    }
}
