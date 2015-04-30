<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubjectList.aspx.cs" Inherits="Concordia42.Admin.SubjectList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Subject List</h2>

    The PARC can offer services for the following Subject.
    <div class="form-group">
    <asp:Button ID="Button1" runat="server" Text="Add Subject" CssClass="btn btn-primary"/>
    <asp:Button ID="Button2" runat="server" Text="Add Subject" CssClass="btn "/>
    <asp:Button ID="Button3" runat="server" Text="Add Subject" CssClass="btn btn-info"/>
    <asp:Button ID="Button4" runat="server" Text="Add Subject" CssClass="btn btn-success"/>
    <asp:Button ID="Button5" runat="server" Text="Add Subject" CssClass="btn btn-danger"/>
    <asp:Button ID="Button8" runat="server" Text="Add Subject" CssClass="btn btn-success"/>
    <asp:Button ID="Button9" runat="server" Text="Add Subject" CssClass="btn btn-warning"/>
    <asp:Button ID="Button10" runat="server" Text="Add Subject" CssClass="btn btn-primary"/>
    <asp:Button ID="Button7" runat="server" Text="Add Subject" CssClass="btn"/>
    <asp:Button ID="Button6" runat="server" Text="Add Subject" CssClass="btn btn-danger"/>
    </div>

    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
            <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Department], [Number], [Description], [ID] FROM [Subjects] ORDER BY [Department], [Number]" DeleteCommand="DELETE FROM [Subjects] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Subjects] ([Department], [Number], [Description]) VALUES (@Department, @Number, @Description)" UpdateCommand="UPDATE [Subjects] SET [Department] = @Department, [Number] = @Number, [Description] = @Description WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Number" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Number" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
