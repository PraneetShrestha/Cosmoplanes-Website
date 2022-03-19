<%@ Page Title="Users" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Asssignment1A.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <style type="text/css">
        .card {
            max-width: 18rem;
            text-align: center;
            border-style: hidden;
            padding-top: 10px;
            background-color: inherit;
        }

        .card-body {
            background-color: lightgray;
        }

        .row {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <header>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4 ">Users</h1>
                <p class="lead ">All our valued users</p>
            </div>
        </div>
    </header>

    <div class="container" id="container">
        <div class="row" id="row">
            <asp:Repeater ID="UserRepeater" runat="server" DataSourceID="UserSDS">
                <ItemTemplate>
                    <div class="col-md-3 container card" id="UserCard">
                        <div class="card-body ">
                            <div class="col-md">
                                <a href="UserDetails.aspx?userName=<%# Eval("UserName") %>" target="_blank">
                                    <h4 class="text-center card-title"><%# Eval("UserName") %></h4>
                                    <img runat="server" alt='<%# Eval("UserName") %>' src='<%# Eval("ProfilePicture") %>' style="width: 100%" class="img-thumbnail" />
                                </a>
                                <p>Points <%# Eval("Points") %></p>
                                <p>Friends <%# Eval("Friends") %></p>
                                <p>Fans <%# Eval("Fans")%></p>
                                <p>
                                    Fanned <%# Eval("Fanned") %>
                                </p>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <asp:SqlDataSource ID="UserSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProfilePicture], [UserName], [Points], [Friends], [Fans], [Fanned], [UserId] FROM [UserAccounts]" DeleteCommand="DELETE FROM [UserAccounts] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [UserAccounts] ([ProfilePicture], [UserName], [Points], [Friends], [Fans], [Fanned], [UserId]) VALUES (@ProfilePicture, @UserName, @Points, @Friends, @Fans, @Fanned, @UserId)" UpdateCommand="UPDATE [UserAccounts] SET [ProfilePicture] = @ProfilePicture, [UserName] = @UserName, [Points] = @Points, [Friends] = @Friends, [Fans] = @Fans, [Fanned] = @Fanned WHERE [UserId] = @UserId">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProfilePicture" Type="Object" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Points" Type="Int32" />
            <asp:Parameter Name="Friends" Type="Int32" />
            <asp:Parameter Name="Fans" Type="Int32" />
            <asp:Parameter Name="Fanned" Type="Int32" />
            <asp:Parameter Name="UserId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProfilePicture" Type="Object" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Points" Type="Int32" />
            <asp:Parameter Name="Friends" Type="Int32" />
            <asp:Parameter Name="Fans" Type="Int32" />
            <asp:Parameter Name="Fanned" Type="Int32" />
            <asp:Parameter Name="UserId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

 
</asp:Content>
