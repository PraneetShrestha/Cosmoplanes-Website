<%@ Page Title="Auctions" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="Auctions.aspx.cs" Inherits="Asssignment1A.Auctions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <header>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4 ">Cosmoplanes Auctions</h1>
                <p class="lead ">Place your bid on the best items</p>

            </div>
        </div>
    </header>

    <div class="container">
        <asp:GridView ID="GVAuction" runat="server" CssClass="table table-stripped table-hover" AutoGenerateColumns="False" DataKeyNames="bidItemId" DataSourceID="AuctionSDS" CellSpacing="-1" EnableViewState="False" GridLines="None">
            <Columns>
                <asp:TemplateField HeaderText="Item Picture">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a href="AuctionDetails.aspx?itemId=<%# Eval("bidItemId") %>" target="_self">
                            <asp:Image ID="Image1" AlternateText='Click For More Details' CssClass="img-thumbnail" ImageUrl='<%# Eval("photo") %>' runat="server" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="bidItemTitle" HeaderText="Item Name" SortExpression="bidItemTitle" />
                <asp:TemplateField HeaderText="Item Description" SortExpression="bidItemDescription">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("bidItemDescription") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToString(Eval ("bidItemDescription")).Length>70?Convert.ToString(Eval("bidItemDescription")).Substring(0,70)+ "...":Eval("bidItemDescription") %>'>

                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Start Price" SortExpression="price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Convert.ToDecimal(Eval("price")).ToString("c") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="postedDate" HeaderText="Posted Date" SortExpression="postedDate" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="AuctionSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AuctionItem] WHERE [bidItemId] = @bidItemId" InsertCommand="INSERT INTO [AuctionItem] ([bidItemId], [bidItemTitle], [bidItemDescription], [price], [location], [Seller], [postedDate], [rating], [photo]) VALUES (@bidItemId, @bidItemTitle, @bidItemDescription, @price, @location, @Seller, @postedDate, @rating, @photo)" SelectCommand="SELECT * FROM [AuctionItem]" UpdateCommand="UPDATE [AuctionItem] SET [bidItemTitle] = @bidItemTitle, [bidItemDescription] = @bidItemDescription, [price] = @price, [location] = @location, [Seller] = @Seller, [postedDate] = @postedDate, [rating] = @rating, [photo] = @photo WHERE [bidItemId] = @bidItemId">
        <DeleteParameters>
            <asp:Parameter Name="bidItemId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="bidItemId" Type="Int32" />
            <asp:Parameter Name="bidItemTitle" Type="String" />
            <asp:Parameter Name="bidItemDescription" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="Seller" Type="String" />
            <asp:Parameter Name="postedDate" Type="String" />
            <asp:Parameter Name="rating" Type="Int32" />
            <asp:Parameter Name="photo" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="bidItemTitle" Type="String" />
            <asp:Parameter Name="bidItemDescription" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="Seller" Type="String" />
            <asp:Parameter Name="postedDate" Type="String" />
            <asp:Parameter Name="rating" Type="Int32" />
            <asp:Parameter Name="photo" Type="Object" />
            <asp:Parameter Name="bidItemId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <script>
        var rows = document.querySelectorAll('#CPMain_GVAuction tbody tr');
        for (var i = 0; i < rows.length; i++) {
            rows[i].addEventListener('click', function (e) {
                var a = this.querySelector('a');
                a.click();
            });
        }
    </script>
</asp:Content>
