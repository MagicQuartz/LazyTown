<%@ Page Title="LazyTown - Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Fun.aspx.cs" Inherits="LazyTown.Fun" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Fancy.css" rel="stylesheet"/>
    <section class="title">
        <h1 class="title"">welcome to lazytown!</h1>
    </section>
    <h2 class="about">LazyTown is all about promoting a healthy lifestyle for children, in a positive, entertaining and catchy way...<a href="About"> Read More</a></h2>
    <iframe style="display:block; margin-left:auto; margin-right:auto;" width="644" height="362" src="https://www.youtube.com/embed/48-sl9GrngQ" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"></iframe>
</asp:Content>