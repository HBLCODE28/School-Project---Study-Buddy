using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.IO;
using System.Collections.Generic;

namespace Namespace
{
    public partial class NewTip : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // פעולה בעת טעינת הדף לראשונה
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string tipName = txtTipName.Text.Trim();
            string tipSubject = ddlSubjects.Text.Trim();
            string tipText = txtTipText.Text.Trim(); // טקסט הטיפ שצריך להוסיף

            // קבלת שם המשתמש מה-session
            string userName = GetCurrentUserName();

            if (ValidateForm(tipName, tipSubject, tipText)) // עדכן את ValidateForm כך שתכלול גם את tipText
            {
                string filePath = null;

                // בדיקה אם יש קובץ להעלות
                if (FileUpload1.HasFile)
                {
                    filePath = UploadFile();
                }

                // שמירת הנתונים בבסיס הנתונים
                SaveToDatabase(tipName, tipSubject, tipText, filePath, userName);

                // הצגת הודעה
                ShowAlert("New Tip Was Added!");
            }
            else
            {
                ShowAlert("Form validation failed.");
            }
        }

        private bool ValidateForm(string txtTipName, string txtTipSubject, string txtTipText)
        {
            bool isValid = true;

            // בדיקת שם הטיפ
            if (string.IsNullOrEmpty(txtTipName.Trim()) || !IsValidtxtTipName(txtTipName.Trim()))
            {
                isValid = false;
                TipNameError.Style["display"] = "block";
            }
            else
            {
                TipNameError.Style["display"] = "none";
            }

            // בדיקת נושא הטיפ
            if (string.IsNullOrEmpty(txtTipSubject.Trim()) || !IsValidtxtTipSubject(txtTipSubject.Trim()))
            {
                isValid = false;
                SubjectError.Style["display"] = "block";
            }
            else
            {
                SubjectError.Style["display"] = "none";
            }

            // בדיקת תוכן הטיפ
            if (string.IsNullOrEmpty(txtTipText.Trim()) || !IsValidtxtTipText(txtTipText.Trim()))
            {
                isValid = false;
                TipTextError.Style["display"] = "block"; // ודא שיש לך פאנל להודעות שגיאה עבור טקסט הטיפ
            }
            else
            {
                TipTextError.Style["display"] = "none";
            }

            return isValid;
        }

        private bool IsValidtxtTipText(string txtTipText)
        {
            return txtTipText.Length <= 50; // או כל בדיקה נוספת שאתה רוצה
        }

        private bool IsValidtxtTipName(string txtTipName)
        {
            return Regex.IsMatch(txtTipName, @"^[A-Za-z\s]{2,50}$");
        }

        private bool IsValidtxtTipSubject(string txtTipSubject)
        {
            return Regex.IsMatch(txtTipSubject, @"^[A-Za-z\s]{2,50}$");
        }

        protected string UploadFile()
        {
            // אם אין קובץ, אין צורך להעלות
            if (!FileUpload1.HasFile)
            {
                return null; // החזרת null כדי להצביע שאין קובץ
            }

            try
            {
                string extension = Path.GetExtension(FileUpload1.FileName)?.ToLower();
                if (!IsAllowFiletype(extension))
                {
                    ResultLabel.Text = "File type not allowed.";
                    return null; // החזרת null במקרה של שגיאה
                }

                string folderPath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, Path.GetFileName(FileUpload1.FileName));
                FileUpload1.SaveAs(filePath);
                ResultLabel.Text = "File uploaded successfully!";
                return filePath; // החזרת נתיב הקובץ
            }
            catch (Exception ex)
            {
                ResultLabel.Text = "File upload failed: " + ex.Message;
                return null; // החזרת null במקרה של שגיאה
            }
        }

        private bool IsAllowFiletype(string extension)
        {
            var allowedExtensions = new List<string> { ".zip", ".rar", ".pdf", ".png", ".jpg", ".jpeg", ".gif" };
            return allowedExtensions.Contains(extension);
        }

        private void ShowAlert(string message)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }

        private string GetCurrentUserName()
        {
            // בדוק אם יש ערך ב-session
            if (Session["UserName"] != null)
            {
                return Session["UserName"].ToString();
            }

            return "Guest"; // או תוכל להחזיר ערך אחר אם המשתמש לא מחובר
        }

        private void SaveToDatabase(string tipName, string tipSubject, string tipText, string filePath, string userName)
        {
            string connectionString = @"Data Source=HBL\SQLEXPRESS;Initial Catalog=demotasks_4389;Integrated Security=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO Tips (TipName, TipDate, TipText, TipSubject, TipRelatedFiles, UserName) VALUES (@TipName, @TipDate, @TipText, @TipSubject, @TipRelatedFiles, @UserName)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TipName", tipName);
                    command.Parameters.AddWithValue("@TipText", tipText);
                    command.Parameters.AddWithValue("@TipSubject", tipSubject);
                    command.Parameters.AddWithValue("@TipDate", DateTime.Now);

                    // Validate file path length
                    if (string.IsNullOrEmpty(filePath))
                    {
                        command.Parameters.AddWithValue("@TipRelatedFiles", DBNull.Value);
                    }
                    else if (filePath.Length > 255)  // or whatever length you set in the database
                    {
                        // Handle error (e.g., log it, alert the user)
                        throw new Exception("File path is too long.");
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@TipRelatedFiles", filePath);
                    }

                    command.Parameters.AddWithValue("@UserName", userName);
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}
