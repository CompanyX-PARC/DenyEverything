<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoggedInUsers.aspx.cs" Inherits="Concordia42.Admin.LoggedInUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Logged In Users</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="LoggedInUserDataSource">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:TemplateField HeaderText="Last Action" SortExpression="lastAction">
                <ItemTemplate>
                      <asp:Label ID="timeSinceLabel" runat="server" Text='<%# timeSince(Convert.ToDateTime(Eval("lastAction"))) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Logged In" SortExpression="whenLoggedIn">
                <ItemTemplate>
                      <asp:Label ID="whenLoggedInLabel" runat="server" Text='<%# timeSince(Convert.ToDateTime(Eval("whenLoggedIn"))) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="locName" HeaderText="locName" SortExpression="locName" />
            <asp:TemplateField HeaderText="Role" SortExpression="role">
                <ItemTemplate>
                      <asp:Label ID="roleLabel" runat="server" Text='<%# rolesToString(userManager.GetRoles((string)Eval("Id"))) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="LoggedInUserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Id, AspNetUsers.FirstName, AspNetUsers.LastName, Activities.lastAction, Activities.whenLoggedIn, Locations.locName FROM Activities INNER JOIN AspNetUsers ON AspNetUsers.Id = Activities.UserId LEFT OUTER JOIN Locations ON Locations.ID = Activities.locationId WHERE (DATEDIFF(hour, GETDATE(), Activities.lastAction) &lt; 1)"></asp:SqlDataSource>

</asp:Content>

