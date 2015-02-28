<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Concordia.Account.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 main form-inline">
                <hgroup class="title">
                    <!-- <h1><%: Title %></h1> -->
                    <h1>Welcome!</h1>
                </hgroup>
                <section id="loginForm">
                    <!-- <h2>Use Your PARC account to log in.</h2> -->
                    <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
                        <LayoutTemplate>
                            <p class="validation-summary-errors">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                            <fieldset>
                                <legend>Use Your PARC Account to Log in</legend>
                                <!-- <legend>Log in Form</legend> -->
                                <ol>
                                    <!--
                                    <li>
                                        <asp:Label runat="server" AssociatedControlID="UserName">Username</asp:Label>
                                        <asp:TextBox runat="server" ID="UserName" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                                    </li>
                                    -->
                                    <li>
                                        <!--
                                        <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                                        -->
                                        <asp:TextBox placeholder="Enter Your Email"  runat="server" ID="Email" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="field-validation-error" ErrorMessage="The user Email field is required." />
                                    </li>
                                    <li>
                                        <!--
                                        <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                                        -->
                                         <asp:TextBox placeholder="Enter Your Password" runat="server" ID="Password" TextMode="Password" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                                    </li>
                                    <li>
                                        <asp:CheckBox runat="server" ID="RememberMe" />
                                        <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                                    </li>
                                </ol>
                                <div class="col-sm-8 col-sm-offset-2 main form-inline">
                                    <asp:Button runat="server" CommandName="Login" Text="Log in" />
                                </div>
                            </fieldset>
                        </LayoutTemplate>
                    </asp:Login>
                    <p>
                        New to PARC? 
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
                        if you don't have an account.
                    </p>
                </section>
                <!--
                <section id="socialLoginForm">
                    <h2>Use another service to log in.</h2>
                    <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
                </section>
                -->
            </div>
        </div>
    </div>
</asp:Content>
