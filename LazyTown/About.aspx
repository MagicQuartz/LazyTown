<%@ Page Title="LazyTown - About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LazyTown.About" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        @font-face {
            font-family: "Poppins";
            src: url('fonts/Poppins-Medium.ttf') format('truetype');
        }
        h2.title {
            text-align: center;
        }
        p.description {
            line-height: 30px;
        }
        h2.title, p.description {
            margin-top: 50px;
            margin-bottom: 50px;
            margin-left: 250px;
            margin-right: 250px;
            font-family: Poppins;
        }
        img.featured-image {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width:60%;
        }
    </style>
    <h2 class="title">About</h2>
    <p class="description">LazyTown is all about promoting a healthy lifestyle for children, 
        in a positive, entertaining and catchy way 
        and is recognized world-wide through channels such as the successful television series, 
        live events and branded consumer products. 
        This way LazyTown encourages kids to be more active and lead healthier lives. 
        We know that LazyTown resonates because raising healthy, well-adjusted children is an objective we share with parents all across the world! 
        There is a lot of different advice out there about how to succeed in raising happy, 
        healthy kids but everyone can agree that having a healthy body, 
        eating a balanced diet and being physically active are excellent ways to start.</p>
    <img src="Media/robbierotten.jpg" class="featured-image" />
</asp:Content>
