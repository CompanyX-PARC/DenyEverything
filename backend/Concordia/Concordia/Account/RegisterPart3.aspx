<%@ Page Title="Register: Part 3"Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterPart3.aspx.cs" Inherits="Concordia.Account.RegisterPart3" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 main form-inline">
                <hgroup class="title">
                    <h1><%: Title %>.</h1>
                    <h2>Student Profile</h2>
                </hgroup>
                <section id="profileForm">
                    <asp:Wizard runat="server" ID="UserProfileUpdate" ViewStateMode="Disabled">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
                            <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
                            <asp:PlaceHolder ID="sideBarPlaceHolder" runat="server" />
 
                        </LayoutTemplate>
                        <WizardSteps>
                             <asp:WizardStep runat="server" ID="UserProfileWizardStep">
                                    <p class="validation-summary-errors">
                                        <asp:Literal runat="server" ID="ErrorMessage" />
                                    </p>

                                    <fieldset>
                                        <legend>Please Fill Out The Following</legend>
                                         <li>
                                            <asp:TextBox placeholder="Your Name"  runat="server" ID="Name" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" CssClass="field-validation-error" ErrorMessage="Your Name is Required." />
                                        </li>
                                        <li>
                                            <asp:DropDownList ID="classLevel" runat="server">
                                                <asp:ListItem Value="Freshman" Text="Freshman (1st Year)">Freshman (1st year)</asp:ListItem>
                                                <asp:ListItem Value="Sophmore" Text="Sophmore (2nd Year)">Sophmore (2nd year)</asp:ListItem>
                                                <asp:ListItem Value="Junior" Text="Junior (3rd Year)">Junior (3rd year)</asp:ListItem>
                                                <asp:ListItem Value="Senior" Text="Senior (4th Year)">Senior (4th year)</asp:ListItem>
                                                <asp:ListItem Value="Other" Text="Other (5+ Years)">Other (5+ years)</asp:ListItem>
                                            </asp:DropDownList>   
                                        </li>

                                    </fieldset>
                                 
                       
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
                </section>
            </div>
        </div>
    </div>
</asp:Content>