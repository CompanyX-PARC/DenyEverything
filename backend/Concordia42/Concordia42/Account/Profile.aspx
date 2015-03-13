<%@ Page Title="Final Step" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Profile.aspx.cs" Inherits="Concordia42.Account.Profile" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
       <fieldset>
        <legend>
            Please fill out the following information.
        </legend>

        <asp:ValidationSummary runat="server" CssClass="text-danger" Visible="False" />

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="classLevel" CssClass="col-md-2 control-label">Class Level</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="classLevel" runat="server" ToolTip="Your Class Level" CssClass="form-control">
                    <asp:ListItem Value="Freshman" Text="Freshman (1st Year)">Freshman (1st year)</asp:ListItem>
                    <asp:ListItem Value="Sophmore" Text="Sophmore (2nd Year)">Sophmore (2nd year)</asp:ListItem>
                    <asp:ListItem Value="Junior" Text="Junior (3rd Year)">Junior (3rd year)</asp:ListItem>
                    <asp:ListItem Value="Senior" Text="Senior (4th Year)">Senior (4th year)</asp:ListItem>
                    <asp:ListItem Value="Other" Text="Other (5+ Years)">Other (5+ years)</asp:ListItem>
                </asp:DropDownList>  
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="EstimatedGradDate" CssClass="col-md-2 control-label">Graduation Date (Expected)</asp:Label>
            <div class="col-md-10">
            <asp:TextBox runat="server" ID="EstimatedGradDate" CssClass="form-control" TextMode="SingleLine" placeholder="Estimated Graduation Date..." ToolTip="For example, Fall 2015" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="EstimatedGradDate"
                CssClass="text-danger" Display="Dynamic" ErrorMessage="Your expected graduation date is required. Estimate if you are uncertain." SetFocusOnError="true" />
                </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Major" CssClass="col-md-2 control-label">Major</asp:Label>
            <div class="col-md-10">
            <asp:TextBox runat="server" ID="Major" CssClass="form-control" TextMode="SingleLine" placeholder="Your Major..." />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Major"
                CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter your major." SetFocusOnError="true" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Minor" CssClass="col-md-2 control-label">Minor</asp:Label>
            <div class="col-md-10">
            <asp:TextBox runat="server" ID="Minor" CssClass="form-control" TextMode="SingleLine" placeholder="Your Minor (if any)..." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Why" CssClass="col-md-2 control-label">Why are you seeking PARC services?</asp:Label>
            <div class="col-md-10">
            <asp:TextBox runat="server" ID="Why" CssClass="form-control" TextMode="SingleLine" placeholder="Why are you seeking PARC services?" ToolTip="Your reason for visiting PARC, e.g.: Tutoring" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Why"
                CssClass="text-danger" Display="Dynamic" ErrorMessage="Please tell us why you need our services. This will help us help you!" SetFocusOnError="true" />
                </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="WhatCourses" CssClass="col-md-2 control-label">What courses or subjects do you need assistance in?</asp:Label>
            <div class="col-md-10">
            <asp:TextBox runat="server" ID="WhatCourses" CssClass="form-control" placeholder="Enter courses or subjects..." TextMode="MultiLine" ToolTip="ie: Calculus, History, etc" Rows="3" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="WhatCourses"
                CssClass="text-danger" Display="Dynamic" ErrorMessage="Please tell us what you need help with." SetFocusOnError="true" />
             </div>
        </div>
        </fieldset>
        <fieldset>
        <legend>Optional Information.</legend>
            <p>
                Providing the following information is volunatry; it may be used by the department to assess our effectiveness, or it may be used for research purposes. Don't worry! We wont share this data with anyone else.
            </p>
        <hr />

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Gender" CssClass="col-md-2 control-label">Gender</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Gender" CssClass="form-control" placeholder="Gender..." TextMode="SingleLine" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Ethnicity" CssClass="col-md-2 control-label">Ethnicity</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Ethnicity" CssClass="form-control" placeholder="Ethnicity..." TextMode="SingleLine" />
            </div>
        </div>

        <div class="form-group">
            
            <div class="col-md-10 col-md-offset-2">
            <asp:CheckBox runat="server" ID="InternationalStudent" /> <asp:Label AssociatedControlID="InternationalStudent" runat="server">Are you an International Student?</asp:Label>
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CountryOfOrigin" CssClass="col-md-2 control-label">Country of Origin</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="CountryOfOrigin" CssClass="form-control" placeholder="Your country of origin..." TextMode="SingleLine" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LanguagesSpoken" CssClass="col-md-2 control-label">Languages Spoken</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="LanguagesSpoken" CssClass="form-control" placeholder="Languages you speak..." TextMode="MultiLine" Rows="3" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:CheckBox runat="server" ID="OtherPrograms" /> <asp:Label runat="server" AssociatedControlID="OtherPrograms"> Are you receiving services from other programs on campus?</asp:Label>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ListOtherPrograms" CssClass="col-md-2 control-label">Which programs?</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ListOtherPrograms" CssClass="form-control" placeholder="List the other campus programs you are receiving services from..." Textmode="MultiLine" Rows="3" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
            <asp:CheckBox runat="server" ID="DegreesProgram" /> <asp:Label AssociatedControlID="DegreesProgram" runat="server">Are you enrolled in the DEGREES program?</asp:Label>
            </div>
        </div>

        <div class="form-group">
            
            <div class="col-md-offset-2 col-md-10">
            <asp:CheckBox runat="server" ID="Smartthinking" />
            <asp:Label AssociatedControlID="Smartthinking" runat="server"> Have you used the SMARTTHINKING online tutoring service?</asp:Label> 
           </div>
        </div>

        <div class="form-group">
            <asp:Label CssClass="col-md-2 control-label" AssociatedControlID="How" runat="server">How did you hear about PARC?</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" CssClass="form-control" ID="How" placeholder="How did you hear about PARC?" TextMode="MultiLine" Rows="3" />
            </div>
        </div>


        <div class="form-group">
            <asp:Button runat="server" Text="Finish &raquo;" CssClass="btn btn-primary" ID="FinishBtn" OnClick="FinishBtn_Click" />
        </div>

           </fieldset>
    </div>

</asp:Content>
