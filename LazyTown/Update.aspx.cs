using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyTown
{
    public partial class Update : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlUpdate = "";
        public string sqlSelect = "";
        public int id;
        public string firstName, lastName, age, adress, email, phone, password;




        protected void Page_Load(object sender, EventArgs e)
        {

            string fileName = "FunDB.mdf";
            /*id = Int32.Parse(Session["id"].ToString());
            // string user = Session["user"].ToString();

            if (id == "אורח")
            {
                msg = "אינך משתמש רשום במערכת";
                Response.Redirect("Fun.aspx");
            }*/

            string idRequest = Request.QueryString["id"];
            if (idRequest == null)
            {
                id = Int32.Parse(Session["id"].ToString());
                if(Session["id"].ToString() == "-1")
                {
                    Response.Redirect("Login.aspx");
                }
            } else
            {
                id = Int32.Parse(idRequest);
                if (Session["admin"].ToString() == "false")
                {
                    Response.Redirect("AdminLogin.aspx");
                }
            }

            sqlSelect = "SELECT * FROM users WHERE id= '" + id + "' ";
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

            //is existing user??
            int length = table.Rows.Count;
            if (length == 0)
                msg = "המשתמש אינו רשום במערכת";
            else
            {
                firstName = table.Rows[0]["firstName"].ToString().Trim();
                lastName = table.Rows[0]["lastName"].ToString().Trim();
                age = table.Rows[0]["age"].ToString().Trim();
                adress = table.Rows[0]["adress"].ToString().Trim();
                email = table.Rows[0]["email"].ToString().Trim();
                phone = table.Rows[0]["phone"].ToString().Trim();
                password = table.Rows[0]["password"].ToString().Trim();
            }



            if (this.IsPostBack)
            {
                firstName = Request.Form["firstName"];
                lastName = Request.Form["lastName"];
                age = Request.Form["age"];
                adress = Request.Form["adress"];
                email = Request.Form["email"];
                phone = Request.Form["phone"];
                password = Request.Form["password"];

                //בניית שאילתת העדכון
                sqlUpdate = "UPDATE users ";
                sqlUpdate += "SET firstName = '" + firstName + "', ";
                sqlUpdate += "lastName = '" + lastName + "', ";
                sqlUpdate += "age = '" + age + "', ";
                sqlUpdate += "adress = '" + adress + "', ";
                sqlUpdate += "email = '" + email + "' , ";
                sqlUpdate += "phone = '" + phone + "',";
                sqlUpdate += "password = '" + password + "' ";
                sqlUpdate += "WHERE id = '" + id + "'";

                Helper.DoQuery(fileName, sqlUpdate);
                msg = "Updated User Successfully!";
            }
        }
    }
}