using System;
using System.Data.SqlClient;

public class DatabaseHelper
{
    public static string CheckSqlConnection()
    {
        // כאן תכניס את מחרוזת החיבור שלך
        string connectionString = "Server=HBL\\SQLEXPRESS;Database=demotasks_4389;Integrated Security=True;";

        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open(); // ניסיון לפתוח את החיבור

                if (connection.State == System.Data.ConnectionState.Open)
                {
                    return "החיבור ל-SQL Server הצליח!";
                }
                else
                {
                    return "החיבור ל-SQL Server נכשל.";
                }
            }
        }
        catch (Exception ex)
        {
            return $"אירעה שגיאה במהלך ניסיון החיבור ל-SQL Server: {ex.Message}";
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // כאן אנחנו קוראים לפונקציה שבודקת את החיבור
        string connectionStatus = DatabaseHelper.CheckSqlConnection();
        Console.WriteLine(connectionStatus); // מציגים את הסטטוס של החיבור בקונסול
    }
}
