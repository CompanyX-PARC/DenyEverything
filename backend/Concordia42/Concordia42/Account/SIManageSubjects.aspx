<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SIManageSubjects.aspx.cs" Inherits="Concordia42.Account.SIManageSubjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Subject List</h2>

    The PARC can offer services for the following Subject.
    <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="ID" ShowFooter="True" >
        <Columns>
            <asp:TemplateField HeaderText="Department" SortExpression="Department">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number" SortExpression="Number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Number") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <%--
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="AddButton" runat="server" CommandName="Insert"  Text="Add" cssclass="btn btn-primary"/>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                --%>
                <ItemTemplate>
                    <asp:CheckBox ID="ChecksIt" runat="server" AutoPostBack="true" OnCheckedChanged="czechUpdate"/>
                </ItemTemplate>
            </asp:TemplateField>
            
            
        </Columns>
        
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Department], [Number], [Description], [ID] FROM [Subjects] ORDER BY [Department], [Number]" DeleteCommand="DELETE FROM [Subjects] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Subjects] ([Department], [Number], [Description]) VALUES (@Department, @Number, @Description)" UpdateCommand="UPDATE [Subjects] SET [Department] = @Department, [Number] = @Number, [Description] = @Description WHERE [ID] = @ID">
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
    <%-- 
    <div class="form-group">
        <asp:Button ID="Button6" runat="server" Text="Add Subject" CssClass="btn btn-danger"/>
    </div>
    --%>
</asp:Content>

