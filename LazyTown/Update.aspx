<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="LazyTown.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h1{
            text-align:right;
            color:orangered;
            font:200px;
        }
      </style>

    <script>

        // chkfirstName()תקינות שם פרטי //
        var firstname = document.getElementById("firstName").value;
        if (firstname.length < 2) {
            document.getElementById("mFirstName").value = "חייב להכניס שם פרטי לפחות 2 אותיות";
            document.getElementById("mFirstName").style.display = "inline";
            return false;
        }
        else
            document.getElementById("mFirstName").style.display = "none";

        //chklastName תקינות שם משפחה
        var lastname = document.getElementById("lastName").value;
        if (lastname.length < 2) {
            document.getElementById("mLastName").value = "חייב להכניס שם משפחה לפחות 2 אותיות";
            document.getElementById("mLastName").style.display = "inline";
            return false;
        }
        else
            document.getElementById("mLastName").style.display = "none";


        var age = document.getElementById("age").value;

        var adress = document.getElementById("adress").value;

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


        //--- בדיקת מספר טלפון --- 
        var phone = document.getElementById("phone").value;
        //alert("phone = " + phone);
        if (phone == "" || (phone.length != 7) || (isNaN(phone))) {

            document.getElementById("mPhone").value = " מספר הטלפון חייב להיות בעל לפחות 7 ספרות ";
            document.getElementById("mPhone").style.display = "inline";

            return false;
        }
        else
            document.getElementById("mPhone").style.display = "none";



        //--- בדיקה עבור סיסמא --
        var pw = document.getElementById("password").value;
        if (pw.length < 6) {
            msg = "סיסמא חייבת להיות בת לפחות 6 תווים";

            document.getElementById("mPass").value = msg;
            document.getElementById("mPass").style.display = "inline";
            msg = "";
            return false;
        }
        else
            document.getElementById("mPass").style.display = "none";


        alert("הטופס תקין");
        return true;


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
    <center>
        <h1 style="text-align:center">Update User Data</h1>
        <table>
            <tr>
            <td>Id: </td>   
                <td><input type="text" id="id" name="id" disabled="disabled" value="<%= id %>" /> </td>
                
            </tr>

                <tr>
                <td>First Name: </td>
                <td><input type="text" id="firstName" name="firstName"  value="<%= firstName %>"/></td>
                    <td><input type="text" id="mFirstName" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

                <tr>
                <td>Last Name: </td>
                <td><input type="text" id="lastName" name="lastName" value="<%=lastName %>"/></td>
                    <td><input type="text" id="mLastName" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>
        
            <tr>
                <td>Age: </td>
                <td><input type="text" id="age" name="age" value="<%=age %>"/></td>
                    <td><input type="text" id="mAge" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

            <tr>
                <td>Address: </td>
                <td><input type="text" id="adress" name="adress" value="<%=adress %>"/></td>
                    <td><input type="text" id="mAdress" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

                <tr>
                <td>Email: </td>
                <td><input type="text" id="email" name="email" value="<%=email %>"/> 
                    <td><input type="text" id="mEmail" size="60"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

            <tr>
                <td>Phone: </td>
                <td><input type="text" id="phone" name="phone" value="<%=phone %>"/></td>
                    <td><input type="text" id="mPhone" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" />
                </td>
            </tr>

            <tr>
                <td>Password: </td>
                <td><input type="password" id="password" name="password" value="<%=password %>"
                    maxlength="8" />
                    <span style="color: red;  font-size: 10px;">*6 characters minimum</span>
                </td>
                <td><input type="text" id="mPassword" size="30"
                    style="display:none; background-color:black; 
                    color:white ;font-weight:bold;" disabled="disabled" />
                    </td>              
            </tr>

            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="submit" value="Update" />
                </td>
            </tr>

        </table>


        <h3><%=msg %></h3>
    </center>
</asp:Content>
