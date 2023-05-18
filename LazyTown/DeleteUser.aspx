<%@ Page Title="LazyTown - The Index" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteUser.aspx.cs" Inherits="LazyTown.DeleteUser" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="FancyIndex.css" rel="stylesheet" />
    <center>
        <h1>טבלת משתמשים</h1>
        <table class="wrapper" border="1" style="padding:15px">

            <%=st%>
        </table>
        <h3><%=msg%></h3>
    </center>
</asp:Content>