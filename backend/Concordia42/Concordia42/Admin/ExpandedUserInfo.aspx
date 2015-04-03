<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpandedUserInfo.aspx.cs" Inherits="Concordia42.Admin.ExpandedUserInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<h2>User Details</h2>

    <%-- 
    <asp:Label runat="server" ID="bobLabel" ><%=bob %></asp:Label>
    --%>

    <%--  <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Email, AspNetUsers.FirstName, AspNetUsers.LastName FROM AspNetUsers WHERE AspNetUsers.Email =@BobEmail"></asp:SqlDataSource> --%>
    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Email], [FirstName], [LastName] FROM [AspNetUsers] WHERE [Email] = @BobEmail">
        <SelectParameters>
            <asp:parameter Name="BobEmail" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource> 

        <asp:GridView ID="GridView1" CssClass="table table-striped" runat="server" AllowPaging="True" PageSize="3" ForeColor="Black" AutoGenerateColumns ="False" DataSourceID="UserSource">
            <Columns>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:TemplateField HeaderText="More Info"> 
                    <ItemTemplate> 
                        <asp:HyperLink runat="server" Text="Details" NavigateUrl='<%# Eval("Email", "~/Admin/ExpandedUserInfo.aspx?Email={0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField> 
                <%-- <!-- <asp:HyperLinkField DataTextField="Details" DataNavigateUrlFields="Email" DataNavigateUrlFormatString="~/Admin/ExpandedUserInfo.aspx?Email={0}"/> --> --%>

         </Columns>
            <PagerStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" Font-Bold="false" /> 
            <PagerSettings Mode="NumericFirstLast" />
         </asp:GridView>

    



    <%--  
    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT AspNetUsers.Email, AspNetUsers.FirstName, AspNetUsers.LastName FROM AspNetUsers WHERE AspNetUsers.Email = @BobEmail">
    </asp:SqlDataSource>

    
    
    <asp:DataList ID="DataList1" runat="server" CssClass="table table-striped" DataSourceID="UserSource">
        <HeaderTemplate>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Email</th>
            <th>Details</th>
            <th>string!</th>
        </HeaderTemplate>
        <ItemTemplate>
                <td><%# Eval("FirstName") %></td>
                <td><%# Eval("LastName") %></td>  
                <td><%# Eval("Email") %></td> 
                <td><asp:HyperLink ID="HL1" runat="server" NavigateUrl='<%# Eval("Email","~/Admin/ExpandedUserInfo.aspx?Email={0}") %>'>Link</asp:HyperLink></td>                 
                <td><asp:Label runat="server" ID="bobLabel" Text="<%#bob %>"><%=bob %></asp:Label></td>
        </ItemTemplate>
    </asp:DataList> 
    --%>
    

    <!--
    <div class="form-horizontal">
        
          <p>
             
             <asp:Label ID="emailLabel" runat="server" >Details</asp:Label>
             
         </p>
    </div>
    -->

</asp:Content>
