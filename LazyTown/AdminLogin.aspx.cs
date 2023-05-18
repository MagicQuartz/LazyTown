using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LazyTown
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        public string msg;
        public string sqlLogin;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                string id = Request.Form["id"];
                string password = Request.Form["password"];

                string fileName = "FunDB.mdf";
                string tableName = "admins";

                sqlLogin = "SELECT * FROM " + tableName + " WHERE id = '" + id + "' AND password = '" + password + "'";

                if (Helper.IsExist(fileName, sqlLogin))
                {
                    DataTable table = Helper.ExecuteDataTable(fileName, sqlLogin);

                    int length = table.Rows.Count;
                    if (length == 0)
                    {
                        msg = "User not found";
                        Response.Redirect("AdminLogin.aspx");
                    }
                    else
                    {
                        Session["id"] = table.Rows[0]["id"];
                        Session["userFirstName"] = table.Rows[0]["firstName"];
                        Session["admin"] = "true";
                        Response.Redirect("Fun.aspx");
                    }
                }
            }
        }
    }
}