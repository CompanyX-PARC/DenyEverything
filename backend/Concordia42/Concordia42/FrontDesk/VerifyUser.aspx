<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyUser.aspx.cs" Inherits="Concordia42.FrontDesk.VerifyUser" %>
<%@ PreviousPageType VirtualPath="~/FrontDesk/CardSwipe.aspx" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Verify User Identity</h2>
    <div class="form-horizontal">
    <fieldset>
        <legend>This is the first time this person has visited the PARC</legend>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FirstNameLabel" CssClass="col-md-3 control-label">First Name</asp:Label>
            <div class="col-md-8">
                    <asp:Label ID="FirstNameLabel" runat="server" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LastNameLabel" CssClass="col-md-3 control-label">Last Name</asp:Label>
            <div class="col-md-8">
                    <asp:Label ID="LastNameLabel" runat="server" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="EmailLabel" CssClass="col-md-3 control-label">Email</asp:Label>
            <div class="col-md-8">
                    <asp:Label ID="EmailLabel" runat="server" />
            </div>
        </div>
           <div class="form-group col-md-8 col-md-offset-3">
        Please check the student's ID card to make sure the picture matches their appearance.
            </div>
    <div class="form-group col-md-8 col-md-offset-3">
        <asp:Button runat="server" CssClass="btn btn-success btn-lg" Text="Yep, accept" ID="Button1"/> 
        <asp:Button runat="server" CssClass="btn btn-danger btn-lg pull-right" Text="Nope, reject" ID="VerifyButton"/> 
    </div>
        </fieldset>
        </div>
    
</asp:Content>
