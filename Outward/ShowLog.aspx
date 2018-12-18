<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ShowLog.aspx.cs" Inherits="EFT_Proj.Outward.ShowLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="" Font-Size="16px"></asp:Label>
    <asp:GridView Style="text-align: left" ID="gridviewItems" runat="server" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#151515" GridLines="None" HorizontalAlign="Left" Width="100%"
        ViewStateMode="Enabled" ShowFooter="false">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:BoundField HeaderText="Type" DataField="TypeStr">
                <ItemStyle ForeColor="Blue" />
            </asp:BoundField>
            <asp:BoundField HeaderText="User" DataField="UserName">
                <ItemStyle ForeColor="Green" />
            </asp:BoundField>
            <asp:BoundField DataField="ActionTime" DataFormatString="{0:dd MMM yyyy HH:mm}" HeaderText="Time">
                <ItemStyle Width="18%" />
            </asp:BoundField>
            <asp:BoundField DataField="Details" HtmlEncode="false" HeaderText="Details">
                <ItemStyle Width="70%" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    </asp:GridView>
</asp:Content>
