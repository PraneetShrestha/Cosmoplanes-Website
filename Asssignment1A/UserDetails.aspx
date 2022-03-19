<%@ Page Title="User Details" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="Asssignment1A.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md">
                <asp:FormView ID="FVUser" runat="server" DataKeyNames="UserId" DataSourceID="UserSDS">
                    <EditItemTemplate>
                        UserId:
                            <asp:Label ID="UserIdLabel1" runat="server" Text='<%# Eval("UserId") %>' />
                        <br />
                        User Name:
                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                        <br />
                        Points:
                            <asp:TextBox ID="PointsTextBox" runat="server" Text='<%# Bind("Points") %>' />
                        <br />
                        Fans:
                            <asp:TextBox ID="FansTextBox" runat="server" Text='<%# Bind("Fans") %>' />
                        <br />
                        Fanned:
                            <asp:TextBox ID="FannedTextBox" runat="server" Text='<%# Bind("Fanned") %>' />
                        <br />
                        Friends:
                            <asp:TextBox ID="FriendsTextBox" runat="server" Text='<%# Bind("Friends") %>' />
                        <br />
                        ProfilePicture:
                            <asp:Label ID="ProfilePictureLabel" runat="server" Text='<%# Bind("ProfilePicture") %>' />
                        <br />

                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        UserId:
                            <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                        <br />
                        User Name:
                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                        <br />
                        Points:
                            <asp:TextBox ID="PointsTextBox" runat="server" Text='<%# Bind("Points") %>' />
                        <br />
                        Fans:
                            <asp:TextBox ID="FansTextBox" runat="server" Text='<%# Bind("Fans") %>' />
                        <br />
                        Fanned:
                            <asp:TextBox ID="FannedTextBox" runat="server" Text='<%# Bind("Fanned") %>' />
                        <br />
                        Friends:
                            <asp:TextBox ID="FriendsTextBox" runat="server" Text='<%# Bind("Friends") %>' />
                        <br />
                        ProfilePicture:
                            <asp:TextBox ID="ProfilePictureTextBox" runat="server" Text='<%# Bind("ProfilePicture") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="form-group">
                            <asp:Label ID="ProfilePictureLB" runat="server" Text="Profile Picture" />
                            <br />
                            <asp:Image ID="UserProfilePicture" runat="server" ImageUrl='<%# Eval("ProfilePicture") %>' /><br />
                        </div>
                        </div>
                        <legend>UserId: <%# Convert.ToInt32(Eval("UserId")).ToString("D4") %>
                        </legend>
                        <br />
                        <div class="form-group">
                            User Name:
                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                        </div>
                        <div class="form-group">
                            Points:
                            <asp:Label ID="PointsLabel" runat="server" Text='<%# Bind("Points") %>' />
                        </div>
                        <br />
                        <div class="form-group">
                            Fans:
                            <asp:Label ID="FansLabel" runat="server" Text='<%# Bind("Fans") %>' />
                            <br />
                            Fanned:
                            <asp:Label ID="FannedLabel" runat="server" Text='<%# Bind("Fanned") %>' />
                        </div>
                        <br />
                        <div class="form-group">
                            Friends:
                            <asp:Label ID="FriendsLabel" runat="server" Text='<%# Bind("Friends") %>' />
                        </div>
                        <br />

                        Articles Written:<br />

                        <asp:Repeater runat="server" DataSourceID="ArticlesSDS" ID="RepeaterArticles">
                            <ItemTemplate>
                                <a href="ArticlesDetail.aspx?articleId=<%# Eval("ArticleId") %>" target="_blank">
                                    <asp:Label ID="ArticlesLabel" runat="server"><%# Eval("Title") %><br /></asp:Label>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-secondary" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-primary" CausesValidation="False" CommandName="New" Text="New" />

                    </ItemTemplate>
                </asp:FormView>
            </div>


        </div>
    </div>
    <asp:SqlDataSource ID="UserSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [UserAccounts] WHERE [UserId] = @original_UserId AND [UserName] = @original_UserName AND [Points] = @original_Points AND [Fans] = @original_Fans AND [Fanned] = @original_Fanned AND [Friends] = @original_Friends AND (([ProfilePicture] = @original_ProfilePicture) OR ([ProfilePicture] IS NULL AND @original_ProfilePicture IS NULL))" InsertCommand="INSERT INTO [UserAccounts] ([UserId], [UserName], [Points], [Fans], [Fanned], [Friends], [ProfilePicture]) VALUES (@UserId, @UserName, @Points, @Fans, @Fanned, @Friends, @ProfilePicture)" SelectCommand="SELECT * FROM [UserAccounts] WHERE ([UserName] = @UserName)" UpdateCommand="UPDATE [UserAccounts] SET [UserName] = @UserName, [Points] = @Points, [Fans] = @Fans, [Fanned] = @Fanned, [Friends] = @Friends, [ProfilePicture] = @ProfilePicture WHERE [UserId] = @original_UserId AND [UserName] = @original_UserName AND [Points] = @original_Points AND [Fans] = @original_Fans AND [Fanned] = @original_Fanned AND [Friends] = @original_Friends AND (([ProfilePicture] = @original_ProfilePicture) OR ([ProfilePicture] IS NULL AND @original_ProfilePicture IS NULL))" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_UserId" Type="Int32" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Points" Type="Int32" />
            <asp:Parameter Name="original_Fans" Type="Int32" />
            <asp:Parameter Name="original_Fanned" Type="Int32" />
            <asp:Parameter Name="original_Friends" Type="Int32" />
            <asp:Parameter Name="original_ProfilePicture" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Points" Type="Int32" />
            <asp:Parameter Name="Fans" Type="Int32" />
            <asp:Parameter Name="Fanned" Type="Int32" />
            <asp:Parameter Name="Friends" Type="Int32" />
            <asp:Parameter Name="ProfilePicture" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="UserName" QueryStringField="userName" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Points" Type="Int32" />
            <asp:Parameter Name="Fans" Type="Int32" />
            <asp:Parameter Name="Fanned" Type="Int32" />
            <asp:Parameter Name="Friends" Type="Int32" />
            <asp:Parameter Name="ProfilePicture" Type="String" />
            <asp:Parameter Name="original_UserId" Type="Int32" />
            <asp:Parameter Name="original_UserName" Type="String" />
            <asp:Parameter Name="original_Points" Type="Int32" />
            <asp:Parameter Name="original_Fans" Type="Int32" />
            <asp:Parameter Name="original_Fanned" Type="Int32" />
            <asp:Parameter Name="original_Friends" Type="Int32" />
            <asp:Parameter Name="original_ProfilePicture" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ArticlesSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Article] WHERE ([Author] = @Author)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Author" QueryStringField="userName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
