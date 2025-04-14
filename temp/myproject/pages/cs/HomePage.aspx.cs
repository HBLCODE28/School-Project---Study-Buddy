using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Namespace
{
    public partial class HomePage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadNewTips();

            }



        }
        private void LoadNewTips()
        {
            string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";
            List<string> tips = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT TipName, TipText, UserName, TipDate, TipRelatedFiles, TipSubject FROM Tips ORDER BY TipDate DESC"; // הוספנו את TipSubject לשאילתה
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string tipName = reader["TipName"].ToString();
                            string tipText = reader["TipText"].ToString();
                            string userName = reader["UserName"].ToString();
                            DateTime tipDate = Convert.ToDateTime(reader["TipDate"]);
                            string tipSubject = reader["TipSubject"].ToString(); // נושא הטיפ

                            // בדיקה אם יש קובץ מצורף לתמונה
                            string filePath = string.IsNullOrEmpty(reader["TipRelatedFiles"].ToString())
                                ? null // אם אין תמונה, לא נשתמש בכתובת
                                : ResolveUrl("~/Uploads/" + Path.GetFileName(reader["TipRelatedFiles"].ToString()));

                            // HTML structure with optional image
                            string tipHtml = $@"
                        <div class='tip-container'>
                            <div class='tip-header'>
                                <h3 class='tip-title'>{tipName}</h3>
                                <p class='user-name'>{userName}</p>
                                <p class='tip-subject'>{tipSubject}</p> <!-- הצגת נושא הטיפ -->
                            </div>";

                            // הוספת תמונה רק אם יש קובץ תמונה
                            if (!string.IsNullOrEmpty(filePath))
                            {
                                tipHtml += $@"<img src='{filePath}' class='tip-image' />";
                            }

                            tipHtml += $@"
                            <p class='tip-date'>{tipDate.ToShortDateString()}</p>
                            <p class='tip-text'>{tipText}</p>
                        </div>";

                            tips.Add(tipHtml);
                        }
                    }
                }
            }

            // הצגת הטיפים במיכל
            TipsContainer.InnerHtml = string.Join("<hr />", tips);
        }




    }
}
