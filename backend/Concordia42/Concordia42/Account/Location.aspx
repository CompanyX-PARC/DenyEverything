<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="Concordia42.Account.Location" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <p>
        <br />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Select Location"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DefaultConnection" DataTextField="locName" DataValueField="locName">
        </asp:DropDownList>
        <asp:SqlDataSource ID="DefaultConnection" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [locName] FROM [Locations] ORDER BY [locName] DESC"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Submit" />
    </p>
    <p>
    </p>
    
</asp:Content>
