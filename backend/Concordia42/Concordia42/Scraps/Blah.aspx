<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blah.aspx.cs" Inherits="Concordia42.Blah" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%= HttpContext.Current.Session.SessionID %>
    Your name is: <%= HttpContext.Current.Session["name"] %>

</asp:Content>
