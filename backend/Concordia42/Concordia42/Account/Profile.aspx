﻿<%@ Page Title="Final Step" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Profile.aspx.cs" Inherits="Concordia42.Account.Profile" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="col-sm-6 col-sm-offset-3 form-horizontal main">
        <h4>Student Profile</h4>
        <p>
            Please fill out the following information.
        </p>
        <hr />

        <asp:ValidationSummary runat="server" CssClass="text-danger" Visible="False" />

        <div class="form-group">
            <asp:DropDownList ID="classLevel" runat="server" ToolTip="Your Class Level" CssClass="form-control">
                <asp:ListItem Value="Freshman" Text="Freshman (1st Year)">Freshman (1st year)</asp:ListItem>
                <asp:ListItem Value="Sophmore" Text="Sophmore (2nd Year)">Sophmore (2nd year)</asp:ListItem>
                <asp:ListItem Value="Junior" Text="Junior (3rd Year)">Junior (3rd year)</asp:ListItem>
                <asp:ListItem Value="Senior" Text="Senior (4th Year)">Senior (4th year)</asp:ListItem>
                <asp:ListItem Value="Other" Text="Other (5+ Years)">Other (5+ years)</asp:ListItem>
            </asp:DropDownList>  
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="EstimatedGradDate" CssClass="form-control" TextMode="SingleLine" placeholder="Estimated Graduation Date..." ToolTip="For example, Fall 2015" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="EstimatedGradDate"
                CssClass="text-danger" ErrorMessage="Your expected graduation date is required. Estimate if you are uncertain." />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="Major" CssClass="form-control" TextMode="SingleLine" placeholder="Your Major..." />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Major"
                CssClass="text-danger" ErrorMessage="Please enter your major." />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="Minor" CssClass="form-control" TextMode="SingleLine" placeholder="Your Minor (if any)..." />
            <br />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="Why" CssClass="form-control" TextMode="SingleLine" placeholder="Why are you seeking PARC services?" ToolTip="Your reason for visiting PARC, ie: Tutoring" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Why"
                CssClass="text-danger" ErrorMessage="Please tell us why you need our services. This will help us help you!" />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="WhatCourses" CssClass="form-control" placeholder="What courses do you require assistance with?" TextMode="MultiLine" ToolTip="ie: Calculus, History, etc" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="WhatCourses"
                CssClass="text-danger" ErrorMessage="Please tell us what you need help with." />
        </div>
        <hr />
 
        <h4>Optional Information</h4>
            <p>
                Providing the following information is volunatry; it may be used by the department to assess our effectiveness, or it may be used for research purposes. Don't worry! We wont share this data with anyone else.
            </p>
        <hr />

        <div class="form-group">
            <asp:TextBox runat="server" ID="Gender" CssClass="form-control" placeholder="Gender" TextMode="SingleLine" />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="Ethnicity" CssClass="form-control" placeholder="Ethnicity" TextMode="SingleLine" />
        </div>

        <div class="form-group">
            <asp:CheckBox runat="server" CssClass="form-control" ID="InternationalStudent" Text="  Are you an International Student?" />
        </div>
        
        <div class="form-group">
            <asp:TextBox runat="server" ID="CountryOfOrigin" CssClass="form-control" placeholder="Country of Origin" TextMode="SingleLine" />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="LanguagesSpoken" CssClass="form-control" placeholder="Languages Spoken" TextMode="MultiLine" />
        </div>

        <div class="form-group">
            <asp:CheckBox runat="server" CssClass="form-control" ID="OtherProgramsOnCampus" Text="  Are you receiving services from other programs on campus?" />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" ID="ListOtherPrograms" CssClass="form-control" placeholder="Please list the other campus programs you are receiving services from..." Textmode="MultiLine" />
        </div>

        <div class="form-group">
            <asp:CheckBox runat="server" CssClass="form-control" ID="DegreesProgram" Text=" Are you enrolled in the DEGREES program?" />
        </div>

        <div class="form-group">
            <asp:CheckBox runat="server" CssClass="form-control" ID="Smartthinking" Text=" Have you used the SMARTTHINKING online tutoring service?" />
        </div>

        <div class="form-group">
            <asp:TextBox runat="server" CssClass="form-control" ID="How" placeholder="How did you hear about PARC?" TextMode="MultiLine" />
        </div>


        <div class="form-group">
            <asp:Button runat="server" Text="Finish" CssClass="btn btn-primary" />
        </div>
    </div>

</asp:Content>
