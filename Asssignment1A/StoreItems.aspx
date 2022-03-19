<%@ Page Title="StoreItems" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="StoreItems.aspx.cs" Inherits="Asssignment1A.StoreItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <style type="text/css">
        .card-header {
            text-align: center;
        }

        .card-img-top {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <header>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4 ">Cosmoplanes Market Place</h1>
                <p class="lead ">Best Items at Cheapest Prices</p>

            </div>
        </div>
    </header>
    <div class="container">
        <h4>Select Item Type</h4>
        <nav class="navbar navbar-expand-lg  navbar-primary">
            <asp:Repeater ID="ItemTypeRepeater" runat="server" DataSourceID="StoreItemTypeSDS">
                <ItemTemplate>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="StoreItems.aspx?itemType=<%# Eval("itemType") %>">
                                <%# Eval("itemType") %>      
                            </a>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </nav>
        <header>
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h3>Items Will be Displayed Below</h3>
                </div>
            </div>
        </header>

        <div class="row">
            <asp:Repeater ID="ItemRepeater" runat="server" DataSourceID="StoreItemSDS">
                <ItemTemplate>

                    <div class="col-md-4 card">
                        <a href="StoreItemsDetail.aspx?itemId=<%# Eval("ItemId") %>" target="_blank">
                            <div class="card-header">
                                <h4><%# Eval("itemName") %></h4>
                            </div>
                            <div class="card-img-top">
                                <img runat="server" alt='<%# Eval("itemName") %>' src='<%# Eval("itemImage") %>' style="width: 100%" class="img-thumbnail" />
                            </div>
                        </a>
                        <div class="card-body">
                            <p>
                                <p><%#Convert.ToString(Eval("itemDescription")).Length> 60 ?Convert.ToString(Eval("itemDescription")).Substring(0, 60) + "..." : Eval("itemDescription")%></p>
                                <p>Price : $ <%# Eval("itemPrice") %></p>
                            </p>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
    <asp:SqlDataSource ID="StoreItemTypeSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [StoreItemType]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="StoreItemSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [StoreItems] WHERE [ItemId] = @ItemId" InsertCommand="INSERT INTO [StoreItems] ([ItemId], [itemName], [itemDescription], [itemPrice], [itemType], [itemImage]) VALUES (@ItemId, @itemName, @itemDescription, @itemPrice, @itemType, @itemImage)" SelectCommand="SELECT * FROM [StoreItems] WHERE ([itemType] = @itemType)" UpdateCommand="UPDATE [StoreItems] SET [itemName] = @itemName, [itemDescription] = @itemDescription, [itemPrice] = @itemPrice, [itemType] = @itemType, [itemImage] = @itemImage WHERE [ItemId] = @ItemId">
        <DeleteParameters>
            <asp:Parameter Name="ItemId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemId" Type="Int32" />
            <asp:Parameter Name="itemName" Type="String" />
            <asp:Parameter Name="itemDescription" Type="String" />
            <asp:Parameter Name="itemPrice" Type="Double" />
            <asp:Parameter Name="itemType" Type="String" />
            <asp:Parameter Name="itemImage" Type="Object" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="itemType" QueryStringField="itemType" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="itemName" Type="String" />
            <asp:Parameter Name="itemDescription" Type="String" />
            <asp:Parameter Name="itemPrice" Type="Double" />
            <asp:Parameter Name="itemType" Type="String" />
            <asp:Parameter Name="itemImage" Type="Object" />
            <asp:Parameter Name="ItemId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
