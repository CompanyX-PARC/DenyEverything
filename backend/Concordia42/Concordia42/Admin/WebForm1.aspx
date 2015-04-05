<%@ Page Title="User List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Concordia42.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <h2>Registered Students</h2>

    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Email], [FirstName], [LastName] FROM [AspNetUsers]"></asp:SqlDataSource> 
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowPaging="True" PageSize="3" ForeColor="Black" AutoGenerateColumns ="False" DataSourceID="UserSource">
            <Columns>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="First Name" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Last Name" HeaderText="LastName" SortExpression="LastName" />
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
    <asp:SqlDataSource ID="UserSourceOLD" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Email, AspNetUsers.FirstName, AspNetUsers.LastName FROM AspNetUsers"></asp:SqlDataSource>
    <asp:DataList ID="DataList" runat="server" CssClass="table table-striped" DataSourceID="UserSource">
        <HeaderTemplate>

            <th>Email</th>
            <th>FirstName</th>
            <th>LastName</th>
        </HeaderTemplate>
        <ItemTemplate>
            <!--
            <td><asp:HyperLink ID="bob12" runat="server" NavigateUrl="http://google.com"><%# Eval("Email") %></asp:HyperLink></td>
            <td><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="http://google.com"><%# Eval("FirstName") %></asp:HyperLink></td>
            <td><asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="http://google.com"><%# Eval("LastName") %></asp:HyperLink></td>
            --> 
            <!--
            <div class="panel-group" id="currentlyLoggedIn">
                    <div class="panel panel-success">
                        <div class="panel-heading hilight" data-parent="#currentlyLoggedIn">
                            <!-- <h4 class="panel-title">TEST</h4> -->
                            <!--
                            <div class="panel-title">
                            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://google.com"><%# Eval("Email") %></asp:HyperLink></td>
                            <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://google.com"><%# Eval("FirstName") %></asp:HyperLink></td>
                            <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="http://google.com"><%# Eval("LastName") %></asp:HyperLink></td>
                            </div>
                        </div>
                    </div>
            </div>

         </ItemTemplate>

    </asp:DataList>

    <p>
        
    </p>
    -->
    --%>

</asp:Content>

