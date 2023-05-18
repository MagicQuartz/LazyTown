using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyTown
{
    public partial class SiteMaster : MasterPage
    {
        public string myTime;
        public string loginMsg;

        protected void Page_Load(object sender, EventArgs e)
        {
            myTime = DateTime.Now.ToString();

            loginMsg = "<h5 class='loginMsg' style='color: #ad4cf5;padding-top: 10px;padding-bottom: 10px;padding-left: 25px;'>Welcome ";
            loginMsg += Session["userFirstName"].ToString();
            loginMsg += "</h5>";
        }
    }
}