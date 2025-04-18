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
        private const string BIOLOGY = "1";
        private const string CHEMISTRY = "2";
        private const string PHYSICS = "3";
        private const string GEOGRAPHY = "4";
        private const string ENVIRONMENTAL_SCIENCE = "5";
        private const string COMPUTER_SCIENCE = "6";
        private const string SOFTWARE_ENGINEERING = "7";
        private const string INFORMATION_SYSTEMS = "8";
        private const string MATHEMATICS = "9";
        private const string STATISTICS = "10";
        private const string PSYCHOLOGY = "11";
        private const string SOCIOLOGY = "12";
        private const string POLITICAL_SCIENCE = "13";
        private const string ECONOMICS = "14";
        private const string ANTHROPOLOGY = "15";
        private const string ENGLISH = "16";
        private const string SPANISH = "17";
        private const string FRENCH = "18";
        private const string GERMAN = "19";
        private const string CHINESE = "20";
        private const string HEBREW = "21";
        private const string ARABIC = "22";
        private const string PHILOSOPHY = "23";
        private const string HISTORY = "24";
        private const string LITERATURE = "25";
        private const string ART_HISTORY = "26";
        private const string ART = "27";
        private const string MUSIC = "28";
        private const string LAW = "29";
        private const string BUSINESS_STUDIES = "30";
        private const string EDUCATION = "31";
        private const string MEDICINE = "32";
        private const string NURSING = "33";
        private const string ENGINEERING = "34";

        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "SELECT TipName, TipText, UserEmail, TipDate, TipSubject, TipRelatedFiles FROM tips";

            if (!IsPostBack)
            {
                LoadTips(null); // Load all tips initially
            }
            else
            {
                string sortOrder = Request.Form["sortOrder"]; // Get sort order parameter

                if (!string.IsNullOrEmpty(sortOrder) && sortOrder != "0")
                {
                    string orderByClause = GetOrderByClause(sortOrder); // Generate ORDER BY clause
                    query += " " + orderByClause; // Append to the query
                    LoadTips(query);  // Load tips based on sorted query
                }
                else
                {
                    // Load tips without sorting if no order selected
                    LoadTips(null);
                }
            }
        }
        //static void ShowAlert(string query)
        //{
        //    string script = $"<script>alert('query: {query}');</script>";
        //    Console.WriteLine(script); // עבור לבדוק את הקוד שנשלח
        //}
        private string GetOrderByClause(string sortOrder)
        {
            string orderByClause = "ORDER BY TipDate";  // Default ordering by date if nothing is selected.

            switch (sortOrder)
            {
                case BIOLOGY:
                    return "WHERE TipSubject = 'Biology' ORDER BY TipDate"; // Biology

                case CHEMISTRY:
                    return "WHERE TipSubject = 'Chemistry' ORDER BY TipDate"; // Chemistry

                case PHYSICS:
                    return "WHERE TipSubject = 'Physics' ORDER BY TipDate"; // Physics

                case GEOGRAPHY:
                    return "WHERE TipSubject = 'Geography' ORDER BY TipDate"; // Geography

                case ENVIRONMENTAL_SCIENCE:
                    return "WHERE TipSubject = 'Environmental Science' ORDER BY TipDate"; // Environmental Science

                case COMPUTER_SCIENCE:
                    return "WHERE TipSubject = 'Computer Science' ORDER BY TipDate"; // Computer Science

                case SOFTWARE_ENGINEERING:
                    return "WHERE TipSubject = 'Software Engineering' ORDER BY TipDate"; // Software Engineering

                case INFORMATION_SYSTEMS:
                    return "WHERE TipSubject = 'Information Systems' ORDER BY TipDate"; // Information Systems

                case MATHEMATICS:
                    return "WHERE TipSubject = 'Mathematics' ORDER BY TipDate"; // Mathematics

                case STATISTICS:
                    return "WHERE TipSubject = 'Statistics' ORDER BY TipDate"; // Statistics

                case PSYCHOLOGY:
                    return "WHERE TipSubject = 'Psychology' ORDER BY TipDate"; // Psychology

                case SOCIOLOGY:
                    return "WHERE TipSubject = 'Sociology' ORDER BY TipDate"; // Sociology

                case POLITICAL_SCIENCE:
                    return "WHERE TipSubject = 'Political Science' ORDER BY TipDate"; // Political Science

                case ECONOMICS:
                    return "WHERE TipSubject = 'Economics' ORDER BY TipDate"; // Economics

                case ANTHROPOLOGY:
                    return "WHERE TipSubject = 'Anthropology' ORDER BY TipDate"; // Anthropology

                case ENGLISH:
                    return "WHERE TipSubject = 'English' ORDER BY TipDate"; // English

                case SPANISH:
                    return "WHERE TipSubject = 'Spanish' ORDER BY TipDate"; // Spanish

                case FRENCH:
                    return "WHERE TipSubject = 'French' ORDER BY TipDate"; // French

                case GERMAN:
                    return "WHERE TipSubject = 'German' ORDER BY TipDate"; // German

                case CHINESE:
                    return "WHERE TipSubject = 'Chinese' ORDER BY TipDate"; // Chinese

                case HEBREW:
                    return "WHERE TipSubject = 'Hebrew' ORDER BY TipDate"; // Hebrew

                case ARABIC:
                    return "WHERE TipSubject = 'Arabic' ORDER BY TipDate"; // Arabic

                case PHILOSOPHY:
                    return "WHERE TipSubject = 'Philosophy' ORDER BY TipDate"; // Philosophy

                case HISTORY:
                    return "WHERE TipSubject = 'History' ORDER BY TipDate"; // History

                case LITERATURE:
                    return "WHERE TipSubject = 'Literature' ORDER BY TipDate"; // Literature

                case ART_HISTORY:
                    return "WHERE TipSubject = 'Art History' ORDER BY TipDate"; // Art History

                case ART:
                    return "WHERE TipSubject = 'Art' ORDER BY TipDate"; // Art

                case MUSIC:
                    return "WHERE TipSubject = 'Music' ORDER BY TipDate"; // Music

                case LAW:
                    return "WHERE TipSubject = 'Law' ORDER BY TipDate"; // Law

                case BUSINESS_STUDIES:
                    return "WHERE TipSubject = 'Business Studies' ORDER BY TipDate"; // Business Studies

                case EDUCATION:
                    return "WHERE TipSubject = 'Education' ORDER BY TipDate"; // Education

                case MEDICINE:
                    return "WHERE TipSubject = 'Medicine' ORDER BY TipDate"; // Medicine

                case NURSING:
                    return "WHERE TipSubject = 'Nursing' ORDER BY TipDate"; // Nursing

                case ENGINEERING:
                    return "WHERE TipSubject = 'Engineering' ORDER BY TipDate"; // Engineering
                default:
                    return orderByClause; // Default sorting if nothing is selected
            }
        }


        private void LoadTips(string query)
        {
            string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";
            List<string> tips = new List<string>();
            int count = 0;

            tips.Add("<div class='row' style='background-color: #c5e2e2; font-family: Monomaniac One, sans-serif; color: #575757;'>");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                if (query == null)
                {
                    query = "SELECT TipName, TipText, UserEmail, TipDate, TipSubject, TipRelatedFiles FROM tips ORDER BY TipSubject ASC";
                }

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
                        <div class='col-md-4' style='background-color: #c5e2e2;'>
                            <div class='card mb-4 shadow-sm' style='background-color: #2E9797;'>
                                <div class='card-body' style='background-color: #8CC5C5;'>
                                    <h5 class='card-title font-weight-bold'>{tipName}</h5>";

                            if (!string.IsNullOrEmpty(filePath))
                            {
                                string fileExtension = Path.GetExtension(filePath).ToLower();

                                if (fileExtension == ".pdf")
                                {
                                    tipHtml += $"<a href='{filePath}' target='_blank'>Download pdf </a>";
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
                                tips.Add("</div><div class='row'>");
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
