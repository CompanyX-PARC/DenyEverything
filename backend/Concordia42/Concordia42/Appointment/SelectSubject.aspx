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
    </fieldset>
    <fieldset runat="server" id="DateFieldset">
        <legend>Select Time and Date</legend>

        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        <asp:DropDownList ID="TimeList" runat="server">
            <asp:ListItem Value="8:00AM">8:00AM</asp:ListItem>
            <asp:ListItem Value="8:30AM">8:30AM</asp:ListItem>
            <asp:ListItem Value="9:00AM">9:00AM</asp:ListItem>
            <asp:ListItem Value="9:30AM">9:30AM</asp:ListItem>
            <asp:ListItem Value="10:00AM">10:00AM</asp:ListItem>
            <asp:ListItem Value="10:30AM">10:30AM</asp:ListItem>
            <asp:ListItem Value="11:00AM">11:00AM</asp:ListItem>
            <asp:ListItem Value="11:30AM">11:30AM</asp:ListItem>
            <asp:ListItem Value="12:00PM">12:00PM</asp:ListItem>
            <asp:ListItem Value="12:30PM">12:30PM</asp:ListItem>
            <asp:ListItem Value="1:00PM">1:00PM</asp:ListItem>
            <asp:ListItem Value="1:30PM">1:30PM</asp:ListItem>
            <asp:ListItem Value="2:00PM">2:00PM</asp:ListItem>
            <asp:ListItem Value="2:30PM">2:30PM</asp:ListItem>
            <asp:ListItem Value="3:00PM">3:00PM</asp:ListItem>
            <asp:ListItem Value="3:30PM">3:30PM</asp:ListItem>
            <asp:ListItem Value="4:00PM">4:00PM</asp:ListItem>
            <asp:ListItem Value="4:30PM">4:30PM</asp:ListItem>
        </asp:DropDownList>
         <div class="form-group">
        <asp:Button CssClass="btn btn-primary" runat="server" ID="Button2" Text="Make Appointment &raquo;" OnClick="ClassButton_Click"/>
        </div>
    </fieldset>
       



</asp:Content>


