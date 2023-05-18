<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LazyTown.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function chkForm() {


            //תקינות שם משתמש - שם משתמש קצר מדי או לא קיים
            var id = document.getElementById("id").value;
            if (id.length < 8) {
                document.getElementById("mId").value = "תעודת זהות קצרה מדי";
                document.getElementById("mId").style.display = "inline";
                return false;


            }
            else
                document.getElementById("mId").style.display = "none";


            // chkfirstName()תקינות שם פרטי //
                var fname = document.getElementById("firstName").value;
                if (fname.length < 2 || fname.value == "") {
                    document.getElementById("mFirstName").value = "חייב להכניס שם פרטי לפחות 2 אותיות";
                    document.getElementById("mFirstName").style.display = "inline";
                    return false;
                }
                else
                    document.getElementById("mFirstName").style.display = "none";

            //chklastName תקינות שם משפחה
            var lname = document.getElementById("lastName").value;
            if (lname.length < 2 || lname.value == "") {
                document.getElementById("mLastName").value = "חייב להכניס שם משפחה לפחות 2 אותיות";
                document.getElementById("mLastName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mLastName").style.display = "none";

            var age = document.getElementById("age").value;

            var adress = document.getElementById("adress").value;



            /* chkRadioButton
                var answer = document.getElementByName("gender").value;
                if (!answer[0].checked && !answer[1].checked) {
                    document.getElementById("mGender").value = "חובה לסמן מגדר";
                    document.getElementById("mGender").style.display = "inline";
                    return false;

                }
                else
                    document.getElementById("mGender").style.display = "none";
            */


            //---- בדיקת תקינות לכתובת דוא'ל ----
            var email = document.getElementById("email").value;
            //alert("email: " + email);
            var size = email.length;
            //alert("email length is: " + size);
            var atSign = email.indexOf('@');
            //alert("@ at place: " + atSign);
            var dotSign = email.indexOf('.', atSign);
            //alert("dot at place: " + dotSign);
            //alert("dot - at = " + (dotSign - atSign));
            var msg = "";
            if (size < 6)
                msg = "כתובת דוא'ל קצרה מדי או לא קיימת ";
            else if (atSign == -1)
                msg = "סימן @ לא קיים בכתובת";
            else if (atSign != email.lastIndexOf('@'))
                msg = "אסור יותר מ- @ אחד בכתובת דוא'ל ";
            else if (atSign < 2 || email.lastIndexOf('@') == size - 1)
                msg = "סימן ה-@ אינו יכול להיות במקום ראשון או אחרון ";
            else if (email.indexOf('.') == 0 || email.lastIndexOf('.') == size - 1)
                msg = "נקודה לא יכולה להיות תו ראשון או אחרון בכתובת ";
            else if (dotSign - atSign <= 1)
                msg = "נקודה חייבת להיות לפחות 2 תווים אחרי סימן ה-@";
            else if (!isQuot(email))
                msg = "כתובת דוא'ל לא יכולה להכיל גרש או גרשיים";
            else if (!isValidString(email))
                msg = "כתובת דוא'ל לא יכולה להכיל תווים אסורים";
            else if (!isHebrew(email))
                msg = "כתובת דוא'ל לא יכולה להכיל עברית";

            if (msg != "") {
                document.getElementById("mEmail").value = msg;
                document.getElementById("mEmail").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mEmail").style.display = "none";
            //alert("end of email check");

            /*
            //---   בדיקת שנת לידה ---
            //--- שנת לידה חייבת להיות מספר ---
            var yearBorn = document.getElementById("yearBorn").value;
            //alert("yearBorn = " + yearBorn);
            var d = new Date();
            var year = d.getFullYear();//השנה הנוכחית
            var msg = "";
            if (isNaN(yearBorn))
                msg = "שנת לידה חייבת להכיל ספרות בלבד";
            else if (yearBorn < 1900)
                msg = "שנת לידה חייבת להכיל מספר שלם, 4 ספרתי גדול מ- 1900";
            else if (yearBorn > (year - 5))
                msg = "צעיר מידי מכדי להירשם";

            if (msg != "") {
                document.getElementById("mYearBorn").value = msg;
                document.getElementById("mYearBorn").style.display = "inline";
                msg = "";
                return false;
            }
            else
                document.getElementById("mYearBorn").style.display = "none";

             */


            //--- בדיקת מספר טלפון --- 
            var phone = document.getElementById("phone").value;
            //alert("phone = " + phone);
            if (phone == "" || (phone.length != 7) || (isNaN(phone))) {
               
                document.getElementById("mPhone").value = " מספר הטלפון חייב להיות  7 ספרות ";
                document.getElementById("mPhone").style.display = "inline";
                
                return false;
            }
            else
                document.getElementById("mPhone").style.display = "none";



            //--- בדיקה עבור סיסמא --
            var pw = document.getElementById("password").value;
            //alert("pw1 = " + pw1);
            if (pw.length < 6) {  //6 דורשים הכנסה של סיסמא בעלת אורך מינימלי 
                document.getElementById("mPass").value = " סיסמא חייבת להיות בן לפחות 6 תווים ";
                document.getElementById("mPass").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mPass").style.display = "none";


            //--- בדיקה האם הסיסמא שווה לסיסמת האימות ---

            alert("הטופס תקין");
            return true;

        }

        //--- אם מכיל גרש או גרשיים - לא תקין ---            
        function isQuot(mail) {
            var quot = '\"', quot1 = "\'";
            if (mail.indexOf(quot) != -1 || mail.indexOf(quot1) != -1)
                return false;
            return true;
        }

        //--- מכיל תווים אסורים ---
        function isValidString(mail) {
            var badChr = "$%^&*()-! []{}<>?";
            var len = badChr.length;

            var i = 0, pos, ch;
            while (i < len) {
                ch = badChr.charAt(i);
                pos = mail.indexOf(ch);
                if (pos != -1)
                    return false;
                i++;
            }
            return true;
        }

        //--- מכיל תווים בעברית ---
        function isHebrew(mail) {
            var badChr = "אבגדהוזחטיכךלמםנןסעפףצץקרשת";
            var len = badChr.length;

            var i = 0, pos, ch;
            while (i < len) {
                ch = badChr.charAt(i);
                pos = mail.indexOf(ch);
                if (pos != -1)
                    return false;
                i++;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="FancyRegister.css" rel="stylesheet"/>
    <center>
        <h1 class="title">Register</h1>
            <table>
                <tr>
                    <td>Id</td>   
                    <td><input type="text" id="id" name="id" /> </td>
                    <td><input type="text" id="mId" size="30"
                        style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                    </td>
                </tr>

                 <tr>
                    <td>First Name</td>
                    <td><input type="text" id="firstName" name="firstName" /></td>
                      <td><input type="text" id="mFirstName" size="30"
                        style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                    </td>
                </tr>

                 <tr>
                    <td>Last Name</td>
                    <td><input type="text" id="lastName" name="lastName" /></td>
                      <td><input type="text" id="mLastName" size="30"
                        style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                    </td>
                </tr>

                <tr>
                    <td>Age</td>
                    <td><input type="number" id="age" name="age" /></td>
                      <td><input type="text" id="mAge" size="30"
                        style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                    </td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><input type="text" id="adress" name="adress" /></td>
                      <td><input type="text" id="mAdress" size="30"
                        style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                    </td>
                </tr>

                 <tr>
                    <td>Email</td>
                    <td><input type="text" id="email" name="email" /> 
                      <td><input type="text" id="mEmail" size="60"
                        style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                    </td>
                </tr>

                <tr>
                    <td>Phone Number</td>
                    <td>
                        <input type="text" id="phone" name="phone" /> 
                        <input type="text" id="mPhone" size="30" 
                            style="display:none; background-color:silver; font-weight:bold;"
                            disabled="disabled" />
                    </td>
                </tr>

                <tr>
                    <td>Password</td>
                    <td><input type="password" id="password" name="password" =""/> </td>
                    <td><input type="text" id="mPassword" size="30"
                        style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                     </td>              
                </tr>
                <tr>
                    <td colspan="2" class="submit">
                        <input type="submit" name="submit" class="submit" value="Send" />
                    </td>
                </tr>
            </table>
   



        <table class="result">
            <%= st %>
        </table>


         <h3 style="direction:ltr; text-align: center;">
            <%= msg %>
        </h3>

    </center>
</asp:Content>