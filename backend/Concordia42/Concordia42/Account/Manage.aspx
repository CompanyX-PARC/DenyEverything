<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Concordia42.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="span7 text-center">
    <h2><%: Title %></h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="main col-md-10 col-sm-offset-2 text-center">
            <div class="form-horizontal">
                
                <hr />
                <div class="form-group" runat="server" id="PasswordDiv">
                    <div class="col-md-10">
                        <asp:Button ID="PasswordButton" runat="server" Text="Change Password" OnClick="PasswordButton_Click" CssClass="btn-primary btn btn-block"/>
                    </div>
                </div>
                 <div class="form-group" runat="server" id="ManageDiv">
                    <div class="col-md-10">
                         <asp:Button ID="ManageButton" runat="server" Text="Edit Profile" OnClick="ManageButton_Click" CssClass="btn-primary btn btn-block"/>
                    </div>
                </div>
                
                

                <%-- Role based content begins here --%>
                <asp:LoginView runat="server" ViewStateMode="Disabled" ID="LoginViewControl">
                    <RoleGroups>
                        <asp:RoleGroup Roles="admin">
                            <ContentTemplate>
                                <div class="form-group" runat="server" id="AdminDiv1">
                                   <div class="col-md-10"> 
                                        <asp:Button ID="Button1" runat="server" Text="View Users" OnClick="Button1_Click" CssClass="btn-primary btn btn-block"/>
                                    </div>
                                </div>
                                <div class="form-group" runat="server" id="AdminDiv2">
                                   <div class="col-md-10">
                                        <asp:Button ID="Button2" runat="server" Text="Create Account" OnClick="Button2_Click" CssClass="btn-primary btn btn-block"/>
                                    </div>
                                </div>
                                <div class="form-group" runat="server" id="AdminDiv3">
                                    <div class="col-md-10">
                                        <asp:Button ID="Button3" runat="server" Text="Register User" OnClick="Button3_Click" CssClass="btn-primary btn btn-block"/>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:RoleGroup>

                        <asp:RoleGroup Roles="assistant">
                            <ContentTemplate>
                                <div class="form-group" runat="server" id="AssistantDiv">
                                    <div class="col-md-10">
                                        <asp:Button ID="Button4" runat="server" Text="Create User" OnClick="Button2_Click" CssClass="btn-primary btn btn-block" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:RoleGroup>

                        <asp:RoleGroup Roles="leader">
                            <ContentTemplate>
                                
                            </ContentTemplate>
                        </asp:RoleGroup>
                
                        <asp:RoleGroup Roles="student,verified">
                            <ContentTemplate>
                                
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
            </div>
        </div>
    </div>
    
</asp:Content>
