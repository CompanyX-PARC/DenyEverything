<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectSubject.aspx.cs" Inherits="Concordia42.Appointment.SelectSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h1>Select Subject</h1>
<asp:DropDownList ID="SubjectList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="Department" OnSelectedIndexChanged="SubjectList_SelectedIndexChanged"></asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT Department FROM Subjects "></asp:SqlDataSource>

    <fieldset>

    </fieldset>

</asp:Content>


