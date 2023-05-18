<%@ Page Title="LazyTown - Songs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Songs.aspx.cs" Inherits="LazyTown.WebForm1"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="FancySongs.css" rel="stylesheet" />
    <h1 class="title">songs</h1>
    <div class="grid-row reverse video-gallery" style="text-align: center; padding-left: 200px; padding-right: 200px;">
        <input type="radio" value="1" name="video-list" id="video-1" checked="checked" /><label for="video-1">We are number one</label>
        <input type="radio" value="2" name="video-list" id="video-2" /><label for="video-2">The Mine Song</label>
        <input type="radio" value="3" name="video-list" id="video-3" /><label for="video-3">LazyTown's Intro</label>
        <input type="radio" value="4" name="video-list" id="video-4" /><label for="video-4">Energy</label>
        <input type="radio" value="5" name="video-list" id="video-5" /><label for="video-5">No One Is Lazy In Lazy Town</label>
        <input type="radio" value="6" name="video-list" id="video-6" /><label for="video-6">Good Stuff</label>
        <!-- videos -->
        <div class="video video-1">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/PfYnvDL0Qcw" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="video video-2">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/2dTh3iI0is8" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="video video-3">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/48-sl9GrngQ" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="video video-4">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/LfUZXNzmo8Y" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="video video-5">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/tkjmk3ReN78" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="video video-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/fyWp6t4fn_8" frameborder="0" allowfullscreen></iframe>
        </div>
    <!-- videos -->
    </div>
    <div style="height: 150px"></div>
</asp:Content>