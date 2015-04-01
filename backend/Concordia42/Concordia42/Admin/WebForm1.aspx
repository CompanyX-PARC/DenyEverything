<%@ Page Title="User List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Concordia42.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <h2>Registered Students</h2>
    
    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Email], [FirstName], [LastName] FROM [AspNetUsers]"></asp:SqlDataSource> 
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="3" ForeColor="Black" AutoGenerateColumns ="False" DataSourceID="UserSource">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:ButtonField DataTextField="MoreInfo" HeaderText="More Info" />
            <!-- <asp:HyperLinkField DataTextField="Details" DataNavigateUrlFields="Email" DataNavigateUrlFormatString="~/Admin/ExpandedUserInfo.aspx?Email={0}"/> -->
     
     </Columns>
        <PagerStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" Font-Bold="false" /> 
        <PagerSettings Mode="NumericFirstLast" />
     </asp:GridView>
    
</asp:Content>

