<%@ Page Title="Where art thou?" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="Concordia42.Account.Location" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Hi,  <asp:Label ID="NameLabel" runat="server" Text="Your Name"></asp:Label>!</h2>
    <div class="form-horizontal">
    <fieldset>
        <legend>Where are you logging in from?</legend>
        <div class="form-group">
            <asp:Label ID="ListLabel" runat="server" AssociatedControlID="DropDownList1" CssClass="col-md-2 control-label">Location</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="DefaultConnection" DataTextField="locName" DataValueField="locName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DefaultConnection" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [locName] FROM [Locations] ORDER BY [locName] DESC"></asp:SqlDataSource>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Submit" />
            </div>
        </div>
    </fieldset>
        </div>
</asp:Content>
