<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="Concordia42.Account.Verify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Step 2</h1>
                   
                            <fieldset>
                                <legend>Email Verification</legend>
                                <div class="form-group">
                                <p>We need to make sure you're a human and not an evil robot!<br/>
                                You will receive an email shortly. Enter the six-digit code in the email to verify your email address.</p>

                                </div>
                                    

                                <div class="form-group form-inline">
                                    <p class="text-danger">
                                        <asp:Literal runat="server" ID="ErrorMessage" />
                                    </p>
                                    <asp:TextBox ID="verifyCode" runat="server" CssClass="form-control" Width="160px"></asp:TextBox>
                                    <asp:Button ID="verifyButton" runat="server" CssClass="btn btn-primary" Text="Verify" OnClick="verifyButton_Click" />
                                </div>
                            </fieldset>
                    


</asp:Content>
