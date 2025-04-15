using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;

namespace UserTipsNameSpace
{
    public partial class UserTips : System.Web.UI.Page
    {
        private static string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // הצגת פרטי המשתמש מהסשן
                lblUserName.InnerText = Session["UserName"] != null ? Session["UserName"].ToString() : " ";
                lblFirstName.InnerText = Session["FirstName"] != null ? Session["FirstName"].ToString() : "";
                lblLastName.InnerText = Session["LastName"] != null ? Session["LastName"].ToString() : "";
                lblEmail.InnerText = Session["Email"] != null ? Session["Email"].ToString() : "";
                LiteralTable.Text = Session["Admin"] != null ? Convert.ToInt32(Session["Admin"]).ToString() : "0";

                // אם המשתמש הוא מנהל, הצג את הטבלה
                if (LiteralTable.Text == "1")
                {
                    // ניתן להסיר את הפונקציה showTable אם אינך צריך אותה
                    // showTable();
                }
                else
                {
                    LiteralTable.Visible = false;
                }

                // הצגת טיפים
                UserTipsLiteral.Text = showUserTips(lblEmail.InnerText);
            }
        }

        // פונקציה להפעלת שאילתות מול מסד נתונים
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

        // הצגת הטיפים של המשתמש
        public string showUserTips(string UserEmail)
        {
            string query = "SELECT TipName, TipText, UserEmail, TipDate, TipSubject, TipRelatedFiles FROM tips WHERE UserEmail = @UserEmail ORDER BY TipDate DESC;";

            string[][] parameters = new string[][] {
                new string[] { "UserEmail", UserEmail }
            };

            var queryResult = RunQuery(query, parameters);
            var tips = queryResult.result as List<Dictionary<string, object>>;
            List<string> tipsHtml = new List<string>();

            try
            {
                if (tips != null && tips.Any())
                {
                    foreach (var tip in tips)
                    {
                        string tipName = tip["TipName"].ToString();
                        string tipText = tip["TipText"].ToString();
                        string userEmail = tip["UserEmail"].ToString();
                        DateTime tipDate = Convert.ToDateTime(tip["TipDate"]);
                        string tipSubject = tip["TipSubject"].ToString();

                        // הצגת קובץ מצורף אם קיים
                        string filePath = string.IsNullOrEmpty(tip["TipRelatedFiles"].ToString())
                            ? null
                            : ResolveUrl("../../Uploads/" + Path.GetFileName(tip["TipRelatedFiles"].ToString()));

                        string tipHtml = $@"
                            <div class='row'>
                                <div class='col-md-12'>
                                    <div class='card mb-4 shadow-sm'>
                                        <div class='card-body'>
                                            <h5 class='card-title font-weight-bold'>{tipName}</h5>";

                        if (!string.IsNullOrEmpty(filePath))  // הצגת תמונה אם יש קובץ מצורף
                        {
                            tipHtml += $"<img src='{filePath}' class='card-img-top mt-3' alt='Related image' style='width: 100%; height: auto; object-fit: cover;' />";
                        }

                        tipHtml += $@"
                                            <h6 class='card-subtitle mb-2 text-muted'>By {userEmail} - {tipDate.ToShortDateString()}</h6>
                                            <p class='card-text' style='color: black;'><strong>Subject:</strong> {tipSubject}</p>
                                            <p class='card-text' style='color: black;'>{tipText}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>";

                        tipsHtml.Add(tipHtml); // הוספת כל טיפ לרשימה
                    }
                }
                else
                {
                    tipsHtml.Add("<p>You haven't posted any tips yet.</p>");
                }
            }
            catch (Exception ex)
            {
                tipsHtml.Add($"<p>An error occurred: {ex.Message}</p>");
            }

            return string.Join("", tipsHtml); // הצגת כל הטיפים
        }
    }
}
