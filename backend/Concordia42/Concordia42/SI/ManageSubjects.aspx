<%@ Page Title="Manage Subjects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageSubjects.aspx.cs" Inherits="Concordia42.SI.ManageSubjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
            <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Department], [Number], [Description], [ID] FROM [Subjects] ORDER BY [Department], [Number]" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Department], [Number], [Description], [ID] FROM [Subjects] ORDER BY [Department], [Number]" >
    </asp:SqlDataSource>



</asp:Content>
