<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Concordia42.User.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Admin Dashboard
    </h2>

    <div>
        <asp:Button ID="Button1" runat="server" Text="View Users" OnClick="Button1_Click"/>
        <asp:Button ID="Button2" runat="server" Text="Create Account" OnClick="Button2_Click"/>
        <asp:Button ID="Button3" runat="server" Text="Register User" OnClick="Button3_Click"/>
    </div>
</asp:Content>
