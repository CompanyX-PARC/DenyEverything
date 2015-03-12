<%@ Page Title="Email Verification" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="Concordia42.Account.Verify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Step 2</h2>
                   
                            <fieldset>
                                <legend>Email Verification</legend>
                                <div class="form-group">
                                <p>We need to make sure you're a human and not an evil robot!<br/>
                                You will receive an email shortly. Enter the six-digit code from the email to verify your email address.</p>

                                </div>
                                    
                                <p class="text-danger">
                                        <asp:Literal runat="server" ID="ErrorMessage" />
                                </p>

                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="verifyCode" CssClass="col-md-2 control-label">Code from Email</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="verifyCode" runat="server" CssClass="form-control" Width="160px"></asp:TextBox>
                                              <asp:RequiredFieldValidator runat="server" ControlToValidate="verifyCode"
                                                 CssClass="text-danger" Display="Dynamic" ErrorMessage="You need to enter a verification code." ForeColor="Red" />
                                              <asp:RegularExpressionValidator runat="server" ControlToValidate="verifyCode" CssClass="text-danger" 
                                                Display="Dynamic" ErrorMessage="The verification code is invalid. It should be a six-digit number."
                                                   ForeColor="Red" ValidationExpression="^[0-9]{6}$" />
                                         </div>  
                                    </div>
                                    <hr />
                                    <div class="form-group">
                                        <div class="col-md-offset-2 col-md-10">
                                            <asp:Button ID="verifyButton" runat="server" CssClass="btn btn-primary" Text="Verify Account &raquo;" OnClick="verifyButton_Click" />
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                    


</asp:Content>
