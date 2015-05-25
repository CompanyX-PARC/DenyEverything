<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAppointments.aspx.cs" Inherits="Concordia42.Appointment.ViewAppointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>All Appointments</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Appointments.Duration, Appointments.StartDate, Appointments.Comment, au1.FirstName, au1.LastName, au2.FirstName AS StudentFName, au2.LastName AS StudentLName FROM Appointments INNER JOIN AspNetUsers AS au1 ON Appointments.Tutor_Id = au1.Id INNER JOIN AspNetUsers AS au2 ON Appointments.Tutee_Id = au2.Id"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1"></asp:GridView>

</asp:Content>
