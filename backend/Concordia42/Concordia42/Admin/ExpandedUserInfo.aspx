<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpandedUserInfo.aspx.cs" Inherits="Concordia42.Admin.ExpandedUserInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<h2>User Details</h2>
    <div class="form-group">
        <asp:Button runat="server" Text="Edit" ID="EditButton" CssClass="btn btn-primary" />
        <asp:Button runat="server" Text="Delete" ID="DeleteButton" CssClass="btn btn-danger" OnClick="DeleteButton_Click" />
    </div>
    
    <div class="form-group">
    <asp:SqlDataSource ID="UserSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT AspNetUsers.Email, AspNetUsers.FirstName, AspNetUsers.LastName, AspNetUsers.PhoneNumber, StudentProfiles.Major, StudentProfiles.Minor, StudentProfiles.GradeLevel, StudentProfiles.GradSemester, StudentProfiles.WhySeking, StudentProfiles.NeedHelpWith, StudentProfiles.Gender, StudentProfiles.Ethnicity, StudentProfiles.International, StudentProfiles.CountryOfOrigin, StudentProfiles.HomeLanguages, StudentProfiles.ReceivingServices, StudentProfiles.ReceivingServicesFrom, StudentProfiles.DegreesProgram, StudentProfiles.SmartThinking, StudentProfiles.HearAboutUs FROM AspNetUsers LEFT JOIN StudentProfiles ON AspNetUsers.Id = StudentProfiles.UserId WHERE (AspNetUsers.Email = @BobEmail)">
        <SelectParameters>
            <asp:parameter Name="BobEmail" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource> 

    <asp:ListView ID="ListView1" runat="server" DataSourceID="UserSource">
        <ItemTemplate>
            <table class="table">
                <tr>
                    <th class="col-md-2">Email:</th>
                    <td class="col-md-6"><asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">First Name:</th>
                    <td class="col-md-6"><asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Last Name:</th>
                    <td class="col-md-6"><asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Phone Number:</th>
                    <td class="col-md-6"><asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Major:</th>
                    <td class="col-md-6"><asp:Label ID="MajorLabel" runat="server" Text='<%# Eval("Major") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Minor:</th>
                    <td class="col-md-6"><asp:Label ID="MinorLabel" runat="server" Text='<%# Eval("Minor") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Grade Level:</th>
                    <td class="col-md-6"><asp:Label ID="GradeLevelLabel" runat="server" Text='<%# Eval("GradeLevel") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Graduation Semester:</th>
                    <td class="col-md-6"><asp:Label ID="GradSemesterLabel" runat="server" Text='<%# Eval("GradSemester") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Why Seeking Services:</th>
                    <td class="col-md-6"><asp:Label ID="WhySekingLabel" runat="server" Text='<%# Eval("WhySeking") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Need Help With:</th>
                    <td class="col-md-6"><asp:Label ID="NeedHelpWithLabel" runat="server" Text='<%# Eval("NeedHelpWith") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Gender:</th>
                    <td class="col-md-6"><asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Ethnicity:</th>
                    <td class="col-md-6"><asp:Label ID="EthnicityLabel" runat="server" Text='<%# Eval("Ethnicity") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">International:</th>
                    <td class="col-md-6"><asp:Label ID="InternationalLabel" runat="server" Text='<%# (Boolean.Parse(Eval("International").ToString()) ? "Yes" : "No") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Country Of Origin:</th>
                    <td class="col-md-6"><asp:Label ID="CountryOfOriginLabel" runat="server" Text='<%# Eval("CountryOfOrigin") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Home Languages:</th>
                    <td class="col-md-6"><asp:Label ID="HomeLanguagesLabel" runat="server" Text='<%# Eval("HomeLanguages") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Receiving Other Services:</th>
                    <td class="col-md-6"><asp:Label ID="ReceivingLabel" runat="server" Text='<%# (Boolean.Parse(Eval("ReceivingServices").ToString()) ? "Yes" : "No") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Receiving From:</th>
                    <td class="col-md-6"><asp:Label ID="ReceivingServicesFromLabel" runat="server" Text='<%# Eval("ReceivingServicesFrom") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">DEGREES Program:</th>
                    <td class="col-md-6"><asp:Label ID="DegreesProgramLabel" runat="server" Text='<%# (Boolean.Parse(Eval("DegreesProgram").ToString()) ? "Yes" : "No") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">SmartThinking:</th>
                    <td class="col-md-6"><asp:Label ID="Label1" runat="server" Text='<%# (Boolean.Parse(Eval("SmartThinking").ToString()) ? "Yes" : "No") %>' /></td>
                </tr>

                <tr>
                    <th class="col-md-2">Heard About the PARC:</th>
                    <td class="col-md-6"><asp:Label ID="HearAboutUsLabel" runat="server" Text='<%# Eval("HearAboutUs") %>' /></td>
                </tr>
            </table>
        </ItemTemplate>
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>

  </div>

  <div class="modal fade" id="dialog1" runat="server" visible="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</asp:Content>
