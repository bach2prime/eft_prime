<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Unlock.aspx.cs" Inherits="EFT_Proj.Outward.Unlock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h4>
        Locked Batches<span style="color: Red;"> Please be careful before unlocking a batch!</span></h4>
    <asp:GridView ID="gridviewOpenBatches" runat="server" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
        <Columns>
            <asp:BoundField DataField="BatchOutId" HeaderText="Batch ID" />
            <asp:BoundField DataField="BatchNumberOut" HeaderText="Batch No" />
            <asp:BoundField DataField="UserName" HeaderText="Last User" />
            <asp:BoundField DataField="StatusStr" HeaderText="Status" />
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:HiddenField ID="hdBatchID" runat="server" Value='<%# Eval("BatchOutId") %>' />
                    <asp:LinkButton ID="lockbt" runat="server" OnClick="UnlockBatch">Unlock Batch</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
        <SelectedRowStyle CssClass="SelectedRowStyle" />
        <HeaderStyle CssClass="HeaderStyleDark" />
        <RowStyle CssClass="RowStyle" />
        <EditRowStyle CssClass="EditRowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    </asp:GridView>
    <br />
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Result" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
</asp:Content>
