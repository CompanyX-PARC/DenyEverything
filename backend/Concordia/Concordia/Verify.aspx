<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="Concordia.Verify" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2 main form-inline">
                <h1>Step 2</h1>
                 <legend>Email Verification</legend>
                                <div class="form-group">
                                <p>We need to make sure you're a human and not an evil robot!
                                    <br>
                                You will receive an email shortly. Enter the six-digit code in the email to verify your email address.</p>
                                </div>
                                
                                <div class="form-group" runat="server" id="group1">
                                    <p><asp:Label ID="errorLabel"  class="control-label" runat="server" Text=""></asp:Label></p>
                                    <asp:TextBox ID="verificationCode" runat="server" placeholder="Enter Code..." class="form-control"></asp:TextBox>
                                    <asp:Button ID="submitButton" runat="server" Text="Submit" class="btn btn-primary" OnClick="submitButton_Click" />
                                </div>
                </div>
            </div>
        </div>
</asp:Content>
