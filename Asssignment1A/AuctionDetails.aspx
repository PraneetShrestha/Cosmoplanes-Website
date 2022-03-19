<%@ Page Title="Auction Details" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="AuctionDetails.aspx.cs" Inherits="Asssignment1A.AuctionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="bidItemId" DataSourceID="AuctionSDS">
                    <EditItemTemplate>
                        bidItemId:
            <asp:Label ID="bidItemIdLabel1" runat="server" Text='<%# Eval("bidItemId") %>' />
                        <br />
                        bidItemTitle:
            <asp:TextBox ID="bidItemTitleTextBox" runat="server" Text='<%# Bind("bidItemTitle") %>' />
                        <br />
                        bidItemDescription:
            <asp:TextBox ID="bidItemDescriptionTextBox" runat="server" Text='<%# Bind("bidItemDescription") %>' />
                        <br />
                        price:
            <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        location:
            <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                        <br />
                        Seller:
            <asp:TextBox ID="SellerTextBox" runat="server" Text='<%# Bind("Seller") %>' />
                        <br />
                        postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" Text='<%# Bind("postedDate") %>' />
                        <br />
                        rating:
            <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
                        <br />
                        photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        bidItemId:
            <asp:TextBox ID="bidItemIdTextBox" runat="server" Text='<%# Bind("bidItemId") %>' />
                        <br />
                        bidItemTitle:
            <asp:TextBox ID="bidItemTitleTextBox" runat="server" Text='<%# Bind("bidItemTitle") %>' />
                        <br />
                        bidItemDescription:
            <asp:TextBox ID="bidItemDescriptionTextBox" runat="server" Text='<%# Bind("bidItemDescription") %>' />
                        <br />
                        price:
            <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        location:
            <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
                        <br />
                        Seller:
            <asp:TextBox ID="SellerTextBox" runat="server" Text='<%# Bind("Seller") %>' />
                        <br />
                        postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" Text='<%# Bind("postedDate") %>' />
                        <br />
                        rating:
            <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
                        <br />
                        photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <legend>
                            <h2>
                                <asp:Label ID="bidItemTitleLabel" runat="server" Text='<%# Bind("bidItemTitle") %>' />
                            </h2>
                        </legend>
                        <asp:Image ImageUrl='<%# Eval("photo") %>' ID="itemPicture" runat="server" />



                        <div class="form-group">
                            Description:
            <asp:Label ID="bidItemDescriptionLabel" runat="server" Text='<%# Bind("bidItemDescription") %>' />
                        </div>
                        <div class="form-group">
                            Starting Price:
            <asp:Label ID="priceLabel" runat="server" Text='<%# Convert.ToDecimal(Eval("price")).ToString("c") %>' />
                        </div>
                        <div class="form-group">
                            Location:
            <asp:Label ID="locationLabel" runat="server" Text='<%# Bind("location") %>' />
                        </div>
                        <div class="form-group">
                            Seller:
            <asp:Label ID="SellerLabel" runat="server" Text='<%# Bind("Seller") %>' />
                        </div>
                        <div class="form-group">
                            Posted Date:
            <asp:Label ID="postedDateLabel" runat="server" Text='<%# Bind("postedDate") %>' />
                        </div>
                        <div class="form-group">
                            Rating:
            <asp:Label ID="ratingLabel" runat="server" Text='<%# Bind("rating") %>' />
                        </div>


                        <asp:LinkButton CssClass="btn btn-secondary" ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton CssClass="btn btn-primary" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="AuctionSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AuctionItem] WHERE [bidItemId] = @bidItemId" InsertCommand="INSERT INTO [AuctionItem] ([bidItemId], [bidItemTitle], [bidItemDescription], [price], [location], [Seller], [postedDate], [rating], [photo]) VALUES (@bidItemId, @bidItemTitle, @bidItemDescription, @price, @location, @Seller, @postedDate, @rating, @photo)" SelectCommand="SELECT * FROM [AuctionItem] WHERE ([bidItemId] = @bidItemId)" UpdateCommand="UPDATE [AuctionItem] SET [bidItemTitle] = @bidItemTitle, [bidItemDescription] = @bidItemDescription, [price] = @price, [location] = @location, [Seller] = @Seller, [postedDate] = @postedDate, [rating] = @rating, [photo] = @photo WHERE [bidItemId] = @bidItemId">
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
            <asp:Parameter Name="photo" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="bidItemId" QueryStringField="itemId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="bidItemTitle" Type="String" />
            <asp:Parameter Name="bidItemDescription" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="Seller" Type="String" />
            <asp:Parameter Name="postedDate" Type="String" />
            <asp:Parameter Name="rating" Type="Int32" />
            <asp:Parameter Name="photo" Type="String" />
            <asp:Parameter Name="bidItemId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
