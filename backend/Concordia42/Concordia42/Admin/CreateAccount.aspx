<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Concordia42.Admin.CreateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create Account
    </h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <fieldset>
            <asp:ValidationSummary runat="server" CssClass="text-danger" Visible="False" />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label">User Name</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" placeholder="First Name..." TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter the user's first name." ForeColor="Red" SetFocusOnError="true" />
                </div>
            </div>
              <div class="form-group">
               
                <div class="col-md-offset-2 col-md-10">
                    <asp:TextBox runat="server" ID="LastName" CssClass="form-control" placeholder="Last Name..." TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter the user's last name." ForeColor="Red" SetFocusOnError="true" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="The User's Desired Email..." TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." ForeColor="Red" SetFocusOnError="true" />
                </div>
            </div>

            
                 <p>Please a password below. The password must be <strong>at least</strong> 8 characters long.<br />
                </p>
            

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Your Desired Password..." ToolTip="Passwords must be at least 8 characters in length" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." ForeColor="Red" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Password" CssClass="text-danger" 
                       Display="Dynamic" ErrorMessage="The password must be at least 8 characters." ForeColor="Red" ValidationExpression=".{8}.*" SetFocusOnError="true" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" placeholder="Verify Your Desired Password..." CssClass="form-control" SetFocusOnError="true" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." ForeColor="Red" />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ForeColor="Red" SetFocusOnError="true" />
                </div>
            </div>
                        
            <div class="form-group">
                <asp:Label runat="server" ID="UserRoleLabel" CssClass="col-md-2 control-label">Account Type</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="UserRoleDropdown" CssClass="form-control" SetFocusOnError="true" >
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>SI Leader</asp:ListItem>
                        <asp:ListItem>Staff</asp:ListItem>
                        <asp:ListItem>Administrator</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" ID="StudentRoleLabel" CssClass="col-md-2 control-label">Account Type</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList runat="server" ID="StudentRoleDropdown" CssClass="form-control" SetFocusOnError="true" >
                        <asp:ListItem>Student</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Create Account »" CssClass="btn btn-primary" />
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
