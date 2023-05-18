using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyTown
{
    public partial class DeleteRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "FunDB.mdf";
            string id = Request.QueryString["id"].ToString();
            string sqlDelete = "DELETE FROM users WHERE Id='" + id + "'";
            Helper.DoQuery(fileName, sqlDelete);
            Response.Redirect("DeleteUser.aspx");

        }
    }
}