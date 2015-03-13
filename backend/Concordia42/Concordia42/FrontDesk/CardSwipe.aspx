<%@ Page Title="Card Swipe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CardSwipe.aspx.cs" Inherits="Concordia42.FrontDesk.CardSwipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Swipe In</h2>

     <div class="alert alert-danger" ID="ErrorDiv" runat="server" visible="false">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span class="sr-only">Error:</span>
        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
         <span aria-hidden="true">&times;</span>
        </button>
    </div>

      <div class="alert alert-success" ID="SuccessDiv" runat="server" visible="false">
        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
        <span class="sr-only">Success:</span>
        <asp:Literal ID="SuccessMessage" runat="server"></asp:Literal>
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
    </div>


    <div class="col-md-8 col-md-offset-2">
        <div class="form-horizontal">
            <fieldset>
                <legend>Swipe Student ID Card</legend>
        
                <asp:TextBox ID="IdBox" runat="server" CssClass="input-lg" ></asp:TextBox>
                <asp:Button ID="IdButton" runat="server" OnClick="IdButton_Click" Text="Swipe In" CssClass="btn btn-primary" />
            </fieldset>
        </div>
    </div>
</asp:Content>
