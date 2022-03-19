<%@ Page Title="Articles Detail" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="ArticlesDetail.aspx.cs" Inherits="Asssignment1A.ArticlesDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-md">
                <asp:FormView ID="FVArticles" DataSourceID="ArticleSDS" runat="server">
                    <ItemTemplate>
                        <h2 class="text-center"><%# Eval("Title") %></h2>
                        <p><%# Eval("ArticleText") %></p>
                        <div class="form-group">
                            <label>Author :</label>
                            <a href="UserDetails.aspx?userName=<%# Eval("Author") %>" target="_blank"><%# Eval("Author") %></a>
                        </div>
                        <div class="form-group">
                            <label>Date Posted :</label>
                            <%# Eval("DateAdded") %>
                        </div>
                        <div class="form-group">
                            <label>Category :</label>
                            <%# Eval("Category") %>
                        </div>
                        <div class="form-group">
                            <label>Rating :</label>
                            <%# Eval("Rating") %>
                        </div>
                    </ItemTemplate>
                </asp:FormView>

            </div>
        </div>

    </div>
    <asp:SqlDataSource ID="ArticleSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Article] WHERE [ArticleId] = @ArticleId" InsertCommand="INSERT INTO [Article] ([ArticleId], [Title], [ArticleText], [Category], [DateAdded], [Author], [Rating]) VALUES (@ArticleId, @Title, @ArticleText, @Category, @DateAdded, @Author, @Rating)" SelectCommand="SELECT * FROM [Article] WHERE ([ArticleId] = @ArticleId)" UpdateCommand="UPDATE [Article] SET [Title] = @Title, [ArticleText] = @ArticleText, [Category] = @Category, [DateAdded] = @DateAdded, [Author] = @Author, [Rating] = @Rating WHERE [ArticleId] = @ArticleId">
        <DeleteParameters>
            <asp:Parameter Name="ArticleId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ArticleId" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="ArticleText" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="DateAdded" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleId" QueryStringField="articleId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="ArticleText" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="DateAdded" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
            <asp:Parameter Name="ArticleId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
