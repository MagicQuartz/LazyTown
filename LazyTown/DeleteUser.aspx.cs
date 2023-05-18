using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyTown
{
    public partial class DeleteUser : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlDelete = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "FunDB.mdf";
            string tableName = "users";
            if (Session["admin"].ToString() == "false")
            {
                msg = "<center style='text-HorizontalAlign: center;'>";
                msg += "<h3> אינך מנהל , אין לך הרשאות לצפות בדף זה</h3>";
                msg += "<a href='Fun.aspx' style='color: #333333; font-family:Abraham;'> [המשך] </a>";
                msg += "</center>";
            }
            else
            {

                string sqlSelect = "SELECT * FROM " + tableName;
                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                string userToModify = "";
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

                st += "</tr>";

                    for (int i = 0; i < length; i++)
                    {
                        st += "<tr>";
                        st += "<td>" + table.Rows[i]["Id"] + "</td>";
                        st += "<td>" + table.Rows[i]["firstName"] + "</td>";
                        st += "<td>" + table.Rows[i]["lastName"] + "</td>";
                        st += "<td>" + table.Rows[i]["age"] + "</td>";
                        st += "<td>" + table.Rows[i]["adress"] + "</td>";
                        st += "<td>" + table.Rows[i]["email"] + "</td>";
                        st += "<td>" + table.Rows[i]["phone"] + "</td>";
                        st += "<td>" + table.Rows[i]["password"] + "</td>";

                        userToModify = table.Rows[i]["Id"].ToString();
                        st += "<td style= 'text-align: center; border: 1px solid black;'>";
                        st += "<a href = 'DeleteRecord.aspx?id=" + userToModify + "'>[delete]</a><td>";

                        st += "<a href = 'Update.aspx?id=" + userToModify + "'>[edit]</a>";
                        st += "</tr>";
                    }

                }
            }
        }
    }
}