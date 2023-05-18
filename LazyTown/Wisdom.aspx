<%@ Page Title="LazyTown - The Index" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wisdom.aspx.cs" Inherits="SelectShowTable"%>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="FancyIndex.css" rel="stylesheet" />
    <center>
        
        <h1>טבלת משתמשים</h1>
        <h2><%=sqlSelect%></h2>

        <table class="wrapper" border="1" style="padding:15px">

            <%=st%>
        </table>
        <h3><%=msg%></h3>
    </center>
</asp:Content>