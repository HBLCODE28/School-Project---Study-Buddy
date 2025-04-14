using System;
using System.Web;

public partial class StudyBuddy : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user session exists
        if (Session["UserName"] != null || Session["users_name"] != null) 
        {
            ProfileLinkPlaceholder.Visible = true; // Show the profile link
           // WelcomeLiteral.Text = "Welcome, " + Session["User"].ToString(); // Optional: Display the username
        }
        else
        {
            ProfileLinkPlaceholder.Visible = false; // Hide the profile link
        }
    }
}
