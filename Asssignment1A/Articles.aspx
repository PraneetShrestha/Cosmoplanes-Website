<%@ Page Title="Articles" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="Asssignment1A.Articles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">

    <asp:GridView ID="GVArticles" runat="server" AutoGenerateColumns="False" CssClass="table table-stripped table-hover" DataKeyNames="ArticleId" DataSourceID="ArticleSDS" GridLines="None">
        
        <Columns>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                 <a href="ArticlesDetail.aspx?articleId=<%# Eval("ArticleId") %>" target="_blank">
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                  </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ArticleText" SortExpression="ArticleText">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ArticleText") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToString(Eval ("ArticleText")).Length>100?Convert.ToString(Eval("ArticleText")).Substring(0,100)+ "...":Eval("ArticleText") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DateAdded" HeaderText="DateAdded" SortExpression="DateAdded" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ArticleSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Article] WHERE [ArticleId] = @ArticleId" InsertCommand="INSERT INTO [Article] ([ArticleId], [Title], [ArticleText], [Category], [DateAdded], [Author], [Rating]) VALUES (@ArticleId, @Title, @ArticleText, @Category, @DateAdded, @Author, @Rating)" SelectCommand="SELECT * FROM [Article]" UpdateCommand="UPDATE [Article] SET [Title] = @Title, [ArticleText] = @ArticleText, [Category] = @Category, [DateAdded] = @DateAdded, [Author] = @Author, [Rating] = @Rating WHERE [ArticleId] = @ArticleId">
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
   <script>
       var rows = document.querySelectorAll('#CPMain_GVArticles tbody tr');
       for (var i = 0; i < rows.length; i++) {
           rows[i].addEventListener('click', function (e) {
               var a = this.querySelector('a');
               a.click();
           });
       }
   </script>

</asp:Content>
