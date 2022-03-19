<%@ Page Title="Item Details" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="StoreItemsDetail.aspx.cs" Inherits="Asssignment1A.StoreItemsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <asp:FormView ID="FVItems" runat="server" DataKeyNames="ItemId" DataSourceID="StoreItemsSDS">
                    <EditItemTemplate>
                        ItemId:
            <asp:Label ID="ItemIdLabel1" runat="server" Text='<%# Eval("ItemId") %>' />
                        <br />
                        itemName:
            <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                        <br />
                        itemDescription:
            <asp:TextBox ID="itemDescriptionTextBox" runat="server" Text='<%# Bind("itemDescription") %>' />
                        <br />
                        itemPrice:
            <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                        <br />
                        itemType:
            <asp:TextBox ID="itemTypeTextBox" runat="server" Text='<%# Bind("itemType") %>' />
                        <br />
                        itemImage:
            <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ItemId:
            <asp:TextBox ID="ItemIdTextBox" runat="server" Text='<%# Bind("ItemId") %>' />
                        <br />
                        itemName:
            <asp:TextBox ID="itemNameTextBox" runat="server" Text='<%# Bind("itemName") %>' />
                        <br />
                        itemDescription:
            <asp:TextBox ID="itemDescriptionTextBox" runat="server" Text='<%# Bind("itemDescription") %>' />
                        <br />
                        itemPrice:
            <asp:TextBox ID="itemPriceTextBox" runat="server" Text='<%# Bind("itemPrice") %>' />
                        <br />
                        itemType:
            <asp:TextBox ID="itemTypeTextBox" runat="server" Text='<%# Bind("itemType") %>' />
                        <br />
                        itemImage:
            <asp:TextBox ID="itemImageTextBox" runat="server" Text='<%# Bind("itemImage") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <legend>
                            <h2><asp:Label ID="itemNameLabel" runat="server" Text='<%# Bind("itemName") %>' /></h2>
                        </legend>
                        <asp:Image ID="ItemImage" runat="server" ImageUrl='<%# Eval("itemImage") %>' CssClass="img-fluid" />
                            
                        <div class="form-group">
                            <label>Description: </label>
                            <asp:Label ID="itemDescriptionLabel" runat="server" Text='<%# Bind("itemDescription") %>' />
                        </div>
                        <div class="form-group">
                            <label>Price: </label>
                            <asp:Label ID="itemPriceLabel" runat="server" Text='<%#Convert.ToDecimal(Eval("itemPrice")).ToString("c") %>' />
                        </div>
                        <div class="form-group">
                            <label>Type: </label>
                            <asp:Label ID="itemTypeLabel" runat="server" Text='<%# Bind("itemType") %>' />
                        </div>
                        <asp:LinkButton ID="EditButton" CssClass="btn btn-secondary" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" CssClass="btn btn-primary" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="StoreItemsSDS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [StoreItems] WHERE [ItemId] = @original_ItemId AND [itemName] = @original_itemName AND [itemDescription] = @original_itemDescription AND [itemPrice] = @original_itemPrice AND (([itemType] = @original_itemType) OR ([itemType] IS NULL AND @original_itemType IS NULL)) AND (([itemImage] = @original_itemImage) OR ([itemImage] IS NULL AND @original_itemImage IS NULL))" InsertCommand="INSERT INTO [StoreItems] ([ItemId], [itemName], [itemDescription], [itemPrice], [itemType], [itemImage]) VALUES (@ItemId, @itemName, @itemDescription, @itemPrice, @itemType, @itemImage)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [StoreItems] WHERE ([ItemId] = @ItemId)" UpdateCommand="UPDATE [StoreItems] SET [itemName] = @itemName, [itemDescription] = @itemDescription, [itemPrice] = @itemPrice, [itemType] = @itemType, [itemImage] = @itemImage WHERE [ItemId] = @original_ItemId AND [itemName] = @original_itemName AND [itemDescription] = @original_itemDescription AND [itemPrice] = @original_itemPrice AND (([itemType] = @original_itemType) OR ([itemType] IS NULL AND @original_itemType IS NULL)) AND (([itemImage] = @original_itemImage) OR ([itemImage] IS NULL AND @original_itemImage IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ItemId" Type="Int32" />
            <asp:Parameter Name="original_itemName" Type="String" />
            <asp:Parameter Name="original_itemDescription" Type="String" />
            <asp:Parameter Name="original_itemPrice" Type="Double" />
            <asp:Parameter Name="original_itemType" Type="String" />
            <asp:Parameter Name="original_itemImage" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemId" Type="Int32" />
            <asp:Parameter Name="itemName" Type="String" />
            <asp:Parameter Name="itemDescription" Type="String" />
            <asp:Parameter Name="itemPrice" Type="Double" />
            <asp:Parameter Name="itemType" Type="String" />
            <asp:Parameter Name="itemImage" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ItemId" QueryStringField="itemId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="itemName" Type="String" />
            <asp:Parameter Name="itemDescription" Type="String" />
            <asp:Parameter Name="itemPrice" Type="Double" />
            <asp:Parameter Name="itemType" Type="String" />
            <asp:Parameter Name="itemImage" Type="String" />
            <asp:Parameter Name="original_ItemId" Type="Int32" />
            <asp:Parameter Name="original_itemName" Type="String" />
            <asp:Parameter Name="original_itemDescription" Type="String" />
            <asp:Parameter Name="original_itemPrice" Type="Double" />
            <asp:Parameter Name="original_itemType" Type="String" />
            <asp:Parameter Name="original_itemImage" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
