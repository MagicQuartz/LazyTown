using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LazyTown
{
    public partial class Register : System.Web.UI.Page
    {

        public string st = "";
        public string yearBorn = "";
        public string msg = "";      //מחזרזת טקסט שתשמור הודעה למשתמש אם הכל תקין יחסית לשם שתמש נכנס
        public string sqlMsg = ""; //מחרוזת שתכיל את תוכן השאילתה


        protected void Page_Load(object sender, EventArgs e)
        {
            string myTime = DateTime.Now.ToString();
            int year = DateTime.Now.Year;
            int from = year - 30;
            int to = year - 10;

            if (Request.Form["submit"] != null)
            {
                st += "<table dir = 'ltr' border='1'>";
                //st += "<tr><th colspan='2'> הפריטים שהתקבלו</th></tr>";

                string id = Request.Form["Id"];
                string firstName = Request.Form["firstName"];
                string lastName = Request.Form["lastName"];
                string age = Request.Form["age"];
                string adress = Request.Form["adress"];
                string email = Request.Form["email"];
                string phone = Request.Form["phone"];
                string password = Request.Form["password"];

                if(id != "" && email != "" && password != "")
                {
                    st += "<tr><td>Id: </td><td>" + id + "</td></tr>";
                    st += "<tr><td>First Name: </td><td>" + firstName + "</td></tr>";
                    st += "<tr><td>Last Name: </td><td>" + lastName + "</td></tr>";
                    st += "<tr><td>Age: </td><td>" + age + "</td></tr>";
                    st += "<tr><td>Address: </td><td>" + adress + "</td></tr>";
                    st += "<tr><td>Email: </td><td>" + email + "</td></tr>";
                    st += "<tr><td>Phone Number: </td><td>" + "0" + phone + "</td></tr>";
                    st += "<tr><td>Password: </td><td>" + password + "</td></tr>";
                    st += "</table>";


                    string fileName = "FunDB.mdf";
                    string tableName = "users";
                    //בדיקה האם משתמש קיים 
                    string sqlSelect = "SELECT * FROM " + tableName + " WHERE Id='" + id + "'";
                    //sqlMsg = sqlSelect;

                    if (Helper.IsExist(fileName, sqlSelect))
                    {
                        msg = "Id has been taken...";
                        sqlMsg = sqlSelect;
                    }

                    else
                    {
                        string sqlInsert = "INSERT INTO " + tableName; // "INSERT INTO contactsTbl";
                        sqlInsert += " VALUES ('" + id + "' , '" + firstName + "' , '" + lastName + "' , '";
                        sqlInsert += age + "'  , '" + adress + "' , '" + email + "' , '";
                        sqlInsert += phone + "' , '" + password + "' );";

                        sqlMsg = sqlInsert;
                        Helper.DoQuery(fileName, sqlInsert);
                        msg = "Success inserting user to the table";

                    }
                }


            }
        }
    }
}