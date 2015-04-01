<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoggedInUsers.aspx.cs" Inherits="Concordia42.Admin.LoggedInUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="LoggedInUserDataSource">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                </td>
                <td>
                    <asp:Label ID="lastActionLabel" runat="server" Text='<%# Eval("lastAction") %>' />
                </td>
                <td>
                    <asp:Label ID="whenLoggedInLabel" runat="server" Text='<%# Eval("whenLoggedIn") %>' />
                </td>
                <td>
                    <asp:Label ID="locNameLabel" runat="server" Text='<%# Eval("locName") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="lastActionTextBox" runat="server" Text='<%# Bind("lastAction") %>' />
                </td>
                <td>
                    <asp:TextBox ID="whenLoggedInTextBox" runat="server" Text='<%# Bind("whenLoggedIn") %>' />
                </td>
                <td>
                    <asp:TextBox ID="locNameTextBox" runat="server" Text='<%# Bind("locName") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="lastActionTextBox" runat="server" Text='<%# Bind("lastAction") %>' />
                </td>
                <td>
                    <asp:TextBox ID="whenLoggedInTextBox" runat="server" Text='<%# Bind("whenLoggedIn") %>' />
                </td>
                <td>
                    <asp:TextBox ID="locNameTextBox" runat="server" Text='<%# Bind("locName") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                </td>
                <td>
                    <asp:Label ID="lastActionLabel" runat="server" Text='<%# timeSince(Convert.ToDateTime(Eval("lastAction"))) %>' />
                </td>
                <td>
                    <asp:Label ID="whenLoggedInLabel" runat="server" Text='<%# timeSince(Convert.ToDateTime(Eval("whenLoggedIn"))) %>' />
                </td>
                <td>
                    <asp:Label ID="locNameLabel" runat="server" Text='<%# Eval("locName") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">FirstName</th>
                                <th runat="server">LastName</th>
                                <th runat="server">Last Action</th>
                                <th runat="server">Login</th>
                                <th runat="server">Location</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                </td>
                <td>
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                </td>
                <td>
                    <asp:Label ID="lastActionLabel" runat="server" Text='<%# timeSince(Convert.ToDateTime(Eval("lastAction"))) %>' />
                </td>
                <td>
                    <asp:Label ID="whenLoggedInLabel" runat="server" Text='<%# timeSince(Convert.ToDateTime(Eval("whenLoggedIn"))) %>' />
                </td>
                <td>
                    <asp:Label ID="locNameLabel" runat="server" Text='<%# Eval("locName") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="LoggedInUserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.FirstName, AspNetUsers.LastName, Activities.lastAction, Activities.whenLoggedIn, Locations.locName FROM Activities INNER JOIN AspNetUsers ON AspNetUsers.Id = Activities.UserId LEFT OUTER JOIN Locations ON Locations.ID = Activities.locationId WHERE (DATEDIFF(hour, GETDATE(), Activities.lastAction) &lt; 1)"></asp:SqlDataSource>

</asp:Content>
