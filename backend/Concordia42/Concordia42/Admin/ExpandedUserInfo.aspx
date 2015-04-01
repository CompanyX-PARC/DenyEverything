<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpandedUserInfo.aspx.cs" Inherits="Concordia42.Admin.ExpandedUserInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>User Details</h2>
    <!--
    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT AspNetUsers.Email, AspNetUsers.FirstName, AspNetUsers.LastName FROM AspNetUsersv WHERE AspNetUsers.Email = @BobEmail">

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
    
    -->

    <!--
    <div class="form-horizontal">
        
          <p>
             
             <asp:Label ID="emailLabel" runat="server" >Details</asp:Label>
             
         </p>
    </div>
    -->
</asp:Content>
