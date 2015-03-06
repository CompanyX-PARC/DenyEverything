<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Concordia42._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Concordia</h1>
        <p class="lead">Concordia is a tutor scheduling web application for PARC.</p>
        <p><a href="http://www.csus.edu/parc/Program%20Description.html" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                If this is your first time to PARC you must register first. Please click on the Register link in the upper right-hand corner.
            </p>
            <p>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                    <AnonymousTemplate>
                        <a class="btn btn-primary" id="registerLink" runat="server" href="~/Account/Register">Register &raquo;</a>
                    </AnonymousTemplate>
                </asp:LoginView>   
            </p>
        </div>
        <div class="col-md-4">
            <h2>Once Registered, Login!</h2>
            <p>
                Once you have completed your registration you will be permitted to login. Please click on the Log In link in the upper right-hand corner.
            </p>
            <p>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                    <AnonymousTemplate>
                        <a class="btn btn-primary" id="loginLink" runat="server" href="~/Account/Login">Log In &raquo;</a>
                    </AnonymousTemplate>
                </asp:LoginView>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Once Logged In, Schedule a Tutor Session</h2>
            <p>
                Once you have logged in you will be able to schedule a tutoring session. As a reminder to you and a courtesy to the tutors, please cancel your tutoring sessions well in advance. Good luck!
            </p>
            <p>
                <!-- a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a -->
            </p>
        </div>
    </div>

</asp:Content>
