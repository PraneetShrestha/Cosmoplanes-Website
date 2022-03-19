<%@ Page Title="Cosmoplance Home" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Asssignment1A.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <style>
        .card {
            text-align: center;
            border-style: hidden;
            padding-top: 10px;
            background-color: inherit;
        }

        .card-body {
            background-color: lightgray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <header class="d-none d-sm-block" style="background-color: lightskyblue;">
        <div class="text-center">
            <div id="carouselSlides" class="carousel-slide " data-ride="carousel">
                <div class="carousel-inner" data-interval="100">
                    <div class="carousel-item active">
                        <img src="Images/Header.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/images1.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/images2.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/images3.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/images4.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/images5.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/images6.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/images7.jpg" class="d-block w-100 h-100" alt="Cosmos">
                    </div>
                </div>
            </div>
        </div>
    </header>
    <header>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4 text-center">Cosmoplanes</h1>
                <p class="lead">Social Media and Market Place</p>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="Users.aspx" target="_blank">
                    <h2 class="text-center">Top Users</h2>
                </a>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="UserRepeater" runat="server" DataSourceID="UserSDS">
                <ItemTemplate>
                    <div class="col-md-3 card">
                        <div class="col-md-10 col-md-offset-1 text-center card-body">
                            <a href="UserDetails.aspx?userName=<%# Eval("UserName") %>" target="_blank">

                                <h4 class="text-center"><%# Eval("UserName") %></h4>
                                <img runat="server" alt='<%# Eval("UserName") %>' src='<%# Eval("ProfilePicture") %>' style="width: 100%" class="img-thumbnail" />
                            </a>
                            <p>Points <%# Eval("Points") %></p>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>


    <asp:SqlDataSource ID="UserSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [UserAccounts] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [UserAccounts] ([UserId], [UserName], [Points], [Fans], [Fanned], [Friends], [ProfilePicture]) VALUES (@UserId, @UserName, @Points, @Fans, @Fanned, @Friends, @ProfilePicture)" SelectCommand="SELECT TOP 4 * FROM [UserAccounts]" UpdateCommand="UPDATE [UserAccounts] SET [UserName] = @UserName, [Points] = @Points, [Fans] = @Fans, [Fanned] = @Fanned, [Friends] = @Friends, [ProfilePicture] = @ProfilePicture WHERE [UserId] = @UserId">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Points" Type="Int32" />
            <asp:Parameter Name="Fans" Type="Int32" />
            <asp:Parameter Name="Fanned" Type="Int32" />
            <asp:Parameter Name="Friends" Type="Int32" />
            <asp:Parameter Name="ProfilePicture" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Points" Type="Int32" />
            <asp:Parameter Name="Fans" Type="Int32" />
            <asp:Parameter Name="Fanned" Type="Int32" />
            <asp:Parameter Name="Friends" Type="Int32" />
            <asp:Parameter Name="ProfilePicture" Type="Object" />
            <asp:Parameter Name="UserId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="StoreItems.aspx" target="_blank">
                    <h2 class="text-center">Market Place</h2>
                </a>

            </div>
        </div>

        <div class="row">
            <asp:Repeater ID="StoreItemRepeater" runat="server" DataSourceID="StoreItemsSDS">
                <ItemTemplate>
                    <div class="col-md-4 card">

                        <div class="col-md-10 col-md-offset-1 card-body">
                            <a href="StoreItemsDetail.aspx?itemId=<%# Eval("ItemId") %>" target="_blank">

                                <h4 class="text-center"><%# Eval("itemName") %></h4>
                                <img runat="server" alt='<%# Eval("itemName") %>' src='<%# Eval("itemImage") %>' style="width: 100%" class="img-thumbnail" />
                            </a>
                            <p><%#Convert.ToString(Eval("itemDescription")).Length> 60 ?Convert.ToString(Eval("itemDescription")).Substring(0, 60) + "..." : Eval("itemDescription")%></p>
                            <p>Price : $ <%# Eval("itemPrice") %></p>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <p></p>

        </div>
    </div>



    <asp:SqlDataSource ID="storeitemssds" runat="server" ConnectionString="<%$ connectionstrings:connectionstring %>" DeleteCommand="delete from [storeitems] where [itemid] = @itemid" InsertCommand="insert into [storeitems] ([itemid], [itemname], [itemdescription], [itemprice], [itemtype], [itemimage]) values (@itemid, @itemname, @itemdescription, @itemprice, @itemtype, @itemimage)" SelectCommand="select TOP 3 * from [storeitems]" UpdateCommand="update [storeitems] set [itemname] = @itemname, [itemdescription] = @itemdescription, [itemprice] = @itemprice, [itemtype] = @itemtype, [itemimage] = @itemimage where [itemid] = @itemid">
        <DeleteParameters>
            <asp:Parameter Name="itemid" Type="int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="itemid" Type="int32" />
            <asp:Parameter Name="itemname" Type="string" />
            <asp:Parameter Name="itemdescription" Type="string" />
            <asp:Parameter Name="itemprice" Type="double" />
            <asp:Parameter Name="itemtype" Type="string" />
            <asp:Parameter Name="itemimage" Type="object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="itemname" Type="string" />
            <asp:Parameter Name="itemdescription" Type="string" />
            <asp:Parameter Name="itemprice" Type="double" />
            <asp:Parameter Name="itemtype" Type="string" />
            <asp:Parameter Name="itemimage" Type="object" />
            <asp:Parameter Name="itemid" Type="int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="Auctions.aspx" target="_blank">
                    <h2 class="text-center">Auctions</h2>
                </a>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="auctionrepeater" runat="server" DataSourceID="auctionsds">
                <ItemTemplate>
                    <div class="col-md-4 card">
                        <div class="col-md-10 col-md-offset-1 card-body">
                            <a href="AuctionDetails.aspx?itemId=<%# Eval("bidItemId") %>" target="_self">
                                <h4 class="text-center"><%# Eval("biditemtitle") %></h4>

                                <img runat="server" alt='<%# Eval("biditemtitle") %>' src='<%# Eval("photo") %>' style="width: 100%" class="img-thumbnail" />
                            </a>
                            <p><%#Convert.ToString(Eval("biditemdescription")).Length> 60 ?Convert.ToString(Eval("biditemdescription")).Substring(0, 60) + "..." : Eval("biditemdescription")%></p>
                            <p>price : $ <%# Eval("price") %></p>
                            <p>rating : <%# Eval("rating") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <asp:SqlDataSource ID="auctionsds" runat="server" ConnectionString="<%$ connectionstrings:connectionstring %>" DeleteCommand="delete from [auctionitem] where [biditemid] = @biditemid" InsertCommand="insert into [auctionitem] ([biditemid], [biditemtitle], [biditemdescription], [price], [location], [seller], [posteddate], [rating], [photo]) values (@biditemid, @biditemtitle, @biditemdescription, @price, @location, @seller, @posteddate, @rating, @photo)" SelectCommand="select TOP 3 * from [auctionitem]" UpdateCommand="update [auctionitem] set [biditemtitle] = @biditemtitle, [biditemdescription] = @biditemdescription, [price] = @price, [location] = @location, [seller] = @seller, [posteddate] = @posteddate, [rating] = @rating, [photo] = @photo where [biditemid] = @biditemid">
        <DeleteParameters>
            <asp:Parameter Name="biditemid" Type="int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="biditemid" Type="int32" />
            <asp:Parameter Name="biditemtitle" Type="string" />
            <asp:Parameter Name="biditemdescription" Type="string" />
            <asp:Parameter Name="price" Type="double" />
            <asp:Parameter Name="location" Type="string" />
            <asp:Parameter Name="seller" Type="string" />
            <asp:Parameter Name="posteddate" Type="string" />
            <asp:Parameter Name="rating" Type="int32" />
            <asp:Parameter Name="photo" Type="object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="biditemtitle" Type="string" />
            <asp:Parameter Name="biditemdescription" Type="string" />
            <asp:Parameter Name="price" Type="double" />
            <asp:Parameter Name="location" Type="string" />
            <asp:Parameter Name="seller" Type="string" />
            <asp:Parameter Name="posteddate" Type="string" />
            <asp:Parameter Name="rating" Type="int32" />
            <asp:Parameter Name="photo" Type="object" />
            <asp:Parameter Name="biditemid" Type="int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="Articles.aspx" target="_blank">
                    <h2 class="text-center">Articles</h2>
                </a>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="articlerepeater" runat="server" DataSourceID="articlesds">
                <ItemTemplate>
                    <div class="col-md-4 card">
                        <div class="col-md-10 col-md-offset-1 card-body">
                            <a href="ArticlesDetail.aspx?articleId=<%# Eval("ArticleId") %>" target="_blank">

                                <h4 class="text-center"><%# Eval("title") %></h4>
                            </a>
                            <p><%#Convert.ToString(Eval("articletext")).Length> 60 ?Convert.ToString(Eval("articletext")).Substring(0, 60) + "..." : Eval("articletext")%></p>
                            <p>author : <%# Eval("author") %></p>
                            <p>rating : <%# Eval("rating") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:SqlDataSource ID="articlesds" runat="server" ConnectionString="<%$ connectionstrings:connectionstring %>" DeleteCommand="delete from [article] where [articleid] = @articleid" InsertCommand="insert into [article] ([articleid], [title], [articletext], [category], [dateadded], [author], [rating]) values (@articleid, @title, @articletext, @category, @dateadded, @author, @rating)" SelectCommand="select TOP 3 * from [article]" UpdateCommand="update [article] set [title] = @title, [articletext] = @articletext, [category] = @category, [dateadded] = @dateadded, [author] = @author, [rating] = @rating where [articleid] = @articleid">
        <DeleteParameters>
            <asp:Parameter Name="articleid" Type="int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="articleid" Type="int32" />
            <asp:Parameter Name="title" Type="string" />
            <asp:Parameter Name="articletext" Type="string" />
            <asp:Parameter Name="category" Type="string" />
            <asp:Parameter Name="dateadded" Type="string" />
            <asp:Parameter Name="author" Type="string" />
            <asp:Parameter Name="rating" Type="int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="string" />
            <asp:Parameter Name="articletext" Type="string" />
            <asp:Parameter Name="category" Type="string" />
            <asp:Parameter Name="dateadded" Type="string" />
            <asp:Parameter Name="author" Type="string" />
            <asp:Parameter Name="rating" Type="int32" />
            <asp:Parameter Name="articleid" Type="int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
