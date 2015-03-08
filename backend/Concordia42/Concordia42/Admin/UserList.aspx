<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Concordia42.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Registered Students</h2>
    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Email, StudentProfiles.Name, StudentProfiles.Major, StudentProfiles.Minor, StudentProfiles.GradeLevel, StudentProfiles.GradSemester, StudentProfiles.WhySeking, StudentProfiles.NeedHelpWith, StudentProfiles.Gender, StudentProfiles.Ethnicity, StudentProfiles.International, StudentProfiles.CountryOfOrigin, StudentProfiles.HomeLanguages, StudentProfiles.ReceivingServices, StudentProfiles.ReceivingServicesFrom, StudentProfiles.DegreesProgram, StudentProfiles.SmartThinking, StudentProfiles.HearAboutUs FROM AspNetUsers LEFT OUTER JOIN StudentProfiles ON AspNetUsers.profile_Id = StudentProfiles.Id"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" CssClass="table table-striped" DataSourceID="UserSource">
        <HeaderTemplate>

            <th>Email</th>
            <th>Name</th>
            <th>Major</th>
            <th>Minor</th>
            <th>Grade</th>
            <th>Graduates</th>
            <th>Why Visiting?</th>
            <th>Help With?</th>
            <th>Gender</th>
            <th>Ethnicity</th>
            <th>International?</th>
            <th>Country</th>
            <th>Language(s)</th>
            <th>Other Services?</th>
            <th>Services</th>
            <th>DEGREES</th>
            <th>SMARTTHINKING</th>
            <th>Heard About?</th>
    
        </HeaderTemplate>
        <ItemTemplate>
         
                <td><%# Eval("Email") %></td>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Major") %></td>
                <td><%# Eval("Minor") %></td>
                <td><%# Eval("GradeLevel") %></td>
                <td><%# Eval("GradSemester") %></td>
                <td><%# Eval("WhySeking") %></td>
                <td><%# Eval("NeedHelpWith") %></td>
                <td><%# Eval("Gender") %></td>
                <td><%# Eval("Ethnicity") %></td>
                <td><%# Eval("International") %></td>
                <td><%# Eval("CountryOfOrigin") %></td>
                <td><%# Eval("HomeLanguages") %></td>
                <td><%# Eval("ReceivingServices") %></td>
                <td><%# Eval("ReceivingServicesFrom") %></td>
                <td><%# Eval("DegreesProgram") %></td>
                <td><%# Eval("SmartThinking") %></td>
                <td><%# Eval("HearAboutUs") %></td>
          
        </ItemTemplate>

    </asp:DataList>
    </asp:Content>



