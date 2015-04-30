<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyUser.aspx.cs" Inherits="Concordia42.FrontDesk.VerifyUser" %>
<%@ PreviousPageType VirtualPath="~/FrontDesk/CardSwipe.aspx" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Verify User Identity</h2>
    <div class="form-horizontal">
    <fieldset>
        <legend>This is the first time this person has visited the PARC</legend>
        <div class="form-group">
            <div class="col-md-8 col-md-offset-2">
                Please check the student's ID card to make sure the picture matches their appearance. Then, select the student from the
                list of unverified students below. If the student does not appear on this list, direct them to a computer kiosk to register a
                new PARC account. 
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-8 col-md-offset-2">
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="UserDadaSource" DataTextField="Name" DataValueField="Email" CssClass="form-control" Height="105px" Width="400px"></asp:ListBox>
                <asp:SqlDataSource ID="UserDadaSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CONCAT(AspNetUsers.FirstName, ' ', AspNetUsers.LastName) AS Name, AspNetUsers.Email FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id WHERE (AspNetRoles.Name = 'verified')"></asp:SqlDataSource>
            </div>
         </div>

        <div class="form-group">
            <div class="col-md-8 col-md-offset-2">
                <asp:Button runat="server" CssClass="btn btn-success btn-lg" Text="Yep, verify" ID="AcceptButton" OnClick="AcceptButton_Click"/> 
                <asp:Button runat="server" CssClass="btn btn-danger btn-lg" Text="Nope, reject" ID="RejectButton" OnClick="RejectButton_Click"/> 
            </div>
         </div>
        </fieldset>
        </div>
    
</asp:Content>
