using System;
using System.Data;


public partial class SelectShowTable : System.Web.UI.Page
{
    public string st = "";
    public string msg = "";
    public string sqlSelect = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "FunDB.mdf";
        string tableName = "users";
        string sqlSelect = "SELECT * FROM " + tableName;
        DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
        int length = table.Rows.Count;
        if (length == 0)
            msg = "אין נרשמים";
        else
        {
            st += "<tr>";
            st += "<th>ID</th>";
            st += "<th>First Name</th>";
            st += "<th>Last Name</th>";
            st += "<th>Age</th>";
            st += "<th>Adress</th>";
            st += "<th>Email</th>";
            st += "<th>Phone</th>";
            st += "<th>Password</th>";
        }

        for (int i = 0; i < length; i++)
        {
            st += "<tr>";
            st += "<td>" + table.Rows[i]["id"] + "</td>";
            st += "<td>" + table.Rows[i]["firstName"] + "</td>";
            st += "<td>" + table.Rows[i]["lastName"] + "</td>";
            st += "<td>" + table.Rows[i]["age"] + "</td>";
            st += "<td>" + table.Rows[i]["adress"] + "</td>";
            st += "<td>" + table.Rows[i]["email"] + "</td>";
            st += "<td>" + table.Rows[i]["phone"] + "</td>";
            st += "<td>" + table.Rows[i]["password"] + "</td>";

            st += "</tr>";
        }

        msg = "נרשמו " + length + " אנשים";
    }
}