<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Concordia.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 main form-inline">
                <hgroup class="title">
                    <h1><%: Title %>.</h1>
                    <h2>Step 1: Create a new PARC account.</h2>
                </hgroup>

                <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser">
                    <LayoutTemplate>
                        <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
                        <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
                    </LayoutTemplate>
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
                            <ContentTemplate>
                                <p class="message-info">
                                    Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
                                </p>

                                <p class="validation-summary-errors">
                                    <asp:Literal runat="server" ID="ErrorMessage" />
                                </p>

                                <fieldset>
                                    <legend>Please Fill Out The Following</legend>
                                    <ol>
                                        <!--
                                        <li>
                                            <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                                            <asp:TextBox runat="server" ID="UserName" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                                CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                                        </li>
                                        -->
                                        <li>
                                            <!--
                                            <asp:Label runat="server" AssociatedControlID="Email">Email address</asp:Label>
                                            -->
                                            <asp:TextBox placeholder="Email Address" runat="server" ID="Email" TextMode="Email" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                                CssClass="field-validation-error" ErrorMessage="The email address field is required." />
                                        </li>
                                        <li>
                                            <!--
                                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                                            -->
                                            <asp:TextBox placeholder="Password" runat="server" ID="Password" TextMode="Password" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                                CssClass="field-validation-error" ErrorMessage="The password field is required." />
                                        </li>
                                        <li>
                                            <!--
                                            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                                            -->
                                            <asp:TextBox placeholder="Verify Password" runat="server" ID="ConfirmPassword" TextMode="Password" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                                 CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                                 CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                        </li>
                                    </ol>
                                    <p>
                                        Click Register to proceed to Step 2
                                    </p>
                                    <div class="col-sm-8 col-sm-offset-2 main form-inline">
                                        <asp:Button runat="server" CommandName="MoveNext" Text="Register" />
                                    </div>
                                </fieldset>
                            </ContentTemplate>
                            <CustomNavigationTemplate />
                        </asp:CreateUserWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </div>
        </div>
    </div>
</asp:Content>