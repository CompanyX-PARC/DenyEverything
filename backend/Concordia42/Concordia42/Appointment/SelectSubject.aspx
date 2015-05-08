<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectSubject.aspx.cs" Inherits="Concordia42.Appointment.SelectSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h1>Select Subject</h1>
<fieldset><legend>Select department</legend>
    <div class="form-group">
<asp:DropDownList CssClass="form-control" ID="SubjectList" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="Department" OnSelectedIndexChanged="SubjectList_SelectedIndexChanged">
</asp:DropDownList>
        </div>
</fieldset>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT Department FROM Subjects "></asp:SqlDataSource>
    <fieldset runat="server" id="ClassFieldset">
        <legend>Select class</legend>
        <div class="form-group">
        <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="ClassList" runat="server" OnSelectedIndexChanged="ClassList_SelectedIndexChanged" />
            </div>
    </fieldset>
    <fieldset runat="server" id="TutorFieldset">
        <legend>Select Tutor</legend>
        <div class="form-group">
         <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="TutorList" runat="server" OnSelectedIndexChanged="TutorList_SelectedIndexChanged" />
            </div>
        <div class="form-group">
        <asp:Button CssClass="btn btn-primary" runat="server" ID="Button2" Text="Next &raquo;" OnClick="ClassButton_Click"/>
        </div>

    </fieldset>
</asp:Content>


