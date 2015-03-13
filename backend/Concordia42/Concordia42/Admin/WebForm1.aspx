<%@ Page Title="User List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Concordia42.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <h2>Registered Students</h2>
    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Email, AspNetUsers.FirstName, AspNetUsers.LastName FROM AspNetUsers"></asp:SqlDataSource>
    <asp:DataList ID="DataList12222222222222" runat="server" CssClass="table table-striped" DataSourceID="UserSource">
        <HeaderTemplate>

            <th>Email</th>
            <th>FirstName</th>
            <th>LastName</th>
        </HeaderTemplate>
        <ItemTemplate>
                <td><asp:HyperLink ID="bob" runat="server" NavigateUrl="http://google.com"><%# Eval("Email") %></asp:HyperLink></td>
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://google.com"><%# Eval("FirstName") %></asp:HyperLink></td>
                <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://google.com"><%# Eval("LastName") %></asp:HyperLink></td>
       </ItemTemplate>

    </asp:DataList>

    <p>
        
    </p>

</asp:Content>

