<%@ Page Title="Card Swipe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CardSwipe.aspx.cs" Inherits="Concordia42.FrontDesk.CardSwipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Swipe your card: "></asp:Label><br /><br />
    <asp:TextBox ID="TextBox1" runat="server" onblur="this.focus();" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
  
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Swipe In" />
  
</asp:Content>
