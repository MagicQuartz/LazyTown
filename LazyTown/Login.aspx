<%@ Page Title="LazyTown - Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LazyTown.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="FancyLogin.css" rel="stylesheet" />
    <center>
        <h1 class="title">Login</h1>
        <table id="table1" dir="ltr" style="align-self:center; align-content:center">
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id" id="id" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" id="password" /></td>
            </tr>
            <tr>
                <td colspan="2" style="align-self:center; align-content:center">
                    <input type="submit" name="submit" value="Login" />
                </td>
            </tr>
        </table>
        <a href="Register" class="register"><h3>Register</h3></a>
        <a href="AdminLogin" class="admin"><h3>Admin Login</h3></a>
    </center>
</asp:Content>
