using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Namespace
{
    public partial class Tips : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTips(); // Load all tips once
            }
        }

        private void LoadTips()
        {
            string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";
            List<string> tips = new List<string>();
            int count = 0;

            tips.Add("<div class='row' style='background-color: #c5e2e2; font-family: Monomaniac One, sans-serif; color: #575757;'>");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT TipName, TipText, UserEmail, TipDate, TipSubject, TipRelatedFiles FROM tips ORDER BY TipDate DESC";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string tipName = reader["TipName"].ToString();
                            string tipText = reader["TipText"].ToString();
                            string userEmail = reader["UserEmail"].ToString();
                            DateTime tipDate = Convert.ToDateTime(reader["TipDate"]);
                            string tipSubject = reader["TipSubject"].ToString();
                            string filePath = string.IsNullOrEmpty(reader["TipRelatedFiles"].ToString())
                                ? null
                                : ResolveUrl("../../Uploads/" + Path.GetFileName(reader["TipRelatedFiles"].ToString()));

                            string tipHtml = $@"
<div class='col-md-4 tip-card' data-subject='{tipSubject}' style='background-color: #c5e2e2;'>
    <div class='card mb-4 shadow-sm' style='background-color: #2E9797;'>
        <div class='card-body' style='background-color: #8CC5C5;'>
            <h5 class='card-title font-weight-bold'>{tipName}</h5>";

                            if (!string.IsNullOrEmpty(filePath))
                            {
                                string fileExtension = Path.GetExtension(filePath).ToLower();

                                if (fileExtension == ".pdf")
                                {
                                    tipHtml += $"<a href='{filePath}' target='_blank'>Download PDF</a>";
                                }
                                else
                                {
                                    tipHtml += $"<img src='{filePath}' class='card-img-top mt-3' alt='Related image' style='width: 100%; height: auto; object-fit: cover;' />";
                                }
                            }

                            string userDisplay = string.IsNullOrEmpty(userEmail) ? "Anonymous" : userEmail;

                            tipHtml += $@"
            <h6 class='card-subtitle mb-2 text-muted'>By {userDisplay} - {tipDate}</h6>
            <p class='card-text' style='color: black;'><strong>Subject:</strong> {tipSubject}</p>
            <p class='card-text' style='color: black;'>{tipText}</p>
        </div>
    </div>
</div>";

                            tips.Add(tipHtml);
                            count++;

                            if (count == 3)
                            {
                                tips.Add("</div><div class='row' style='background-color: #c5e2e2;'>");
                                count = 0;
                            }
                        }
                    }
                }
            }

            if (count > 0)
            {
                tips.Add("</div>");
            }

            HtmlGenericControl tipsContainer = (HtmlGenericControl)FindControl("tips");
            if (tipsContainer == null)
            {
                tipsContainer = new HtmlGenericControl("div");
                tipsContainer.ID = "tips";
                this.Controls.Add(tipsContainer);
            }

            tipsContainer.InnerHtml = string.Join("", tips);
        }
    }
}
