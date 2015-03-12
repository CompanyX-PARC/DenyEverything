<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Concordia42.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Step 1</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <fieldset>
            <legend>Create a PARC Account</legend>
            <p>Enter your email and pick a password. Your password has to be at least eight letters long.<br />
                We're going to send you a verification email to the address you list here, so make sure it's correct!
            </p>
            <asp:ValidationSummary runat="server" CssClass="text-danger" Visible="False" />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label">Your Name</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" placeholder="First Name..." TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter your first name." ForeColor="Red" />
                </div>
            </div>
              <div class="form-group">
               
                <div class="col-md-offset-2 col-md-10">
                    <asp:TextBox runat="server" ID="LastName" CssClass="form-control" placeholder="Last Name..." TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter your last name." ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="Your Desired Email..." TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." ForeColor="Red" />
                </div>
            </div>

            
                 <p>Please enter your desired password below.<br />
                </p>
            

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Your Desired Password..." ToolTip="Passwords must be at least 8 characters in length" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." ForeColor="Red" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Password" CssClass="text-danger" 
                       Display="Dynamic" ErrorMessage="The password must be at least 8 characters." ForeColor="Red" ValidationExpression="" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" placeholder="Verify Your Desired Password..." CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." ForeColor="Red" />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register &raquo;" CssClass="btn btn-primary" />
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
