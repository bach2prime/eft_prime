<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CheckSingleItem.aspx.cs" Inherits="EFT_Proj.Inward.CheckSingleItem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <div id="divSearchBox" runat="server" visible="True">
        <p>
            <asp:Label ID="Label1" runat="server" Text="Trace No"></asp:Label>
            <asp:TextBox ID="textTraceNo" runat="server"></asp:TextBox>
            Settlement Date:&nbsp;
            <asp:TextBox ID="textSettlementDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                TargetControlID="textSettlementDate" Format="dd/MM/yyyy">
            </cc1:CalendarExtender>
            <asp:Button ID="buttonSearch" CssClass="buttonStyle" runat="server" Text="Search"
                OnClick="buttonSearch_Click" />
            <hr />
        </p>
        <h4>
            Inward Items and Inward Dishonored Returns</h4>
        <asp:GridView ID="gridviewTxList" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" DataKeyNames="EdrInId">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="javascript:showCheckItemDetails('<%# Eval("EdrInId") %>','edrin')">Process</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EdrInId" HeaderText="ID" />
                <asp:BoundField DataField="ItemTypeStr" HeaderText="Type" />
                <asp:BoundField DataField="TraceNumber" HeaderText="Trace No" />
                <%--<asp:BoundField DataField="SettlementDate" HeaderText="Settlement Date" DataFormatString="{0:dd MMM yyyy}" />--%>
                <asp:BoundField DataField="OrigBank" HeaderText="From" />
                <%--<asp:BoundField DataField="CompanyName" HeaderText="Company" />--%>
                <asp:BoundField DataField="AmountCr" HeaderText="AmountCr" />
                <asp:BoundField DataField="AmountDr" HeaderText="AmountDr" />
                <asp:BoundField DataField="DfiAccountNumber" HeaderText="A/C" />
                <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                <asp:BoundField DataField="StatusStr" HeaderText="Status" />
            </Columns>
            <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            <HeaderStyle CssClass="HeaderStyleDark" />
            <RowStyle CssClass="RowStyle" />
            <EditRowStyle CssClass="EditRowStyle" />
            <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        </asp:GridView>
    </div>
    <div style="display: none">
        <asp:LinkButton ID="PostBack" runat="server" OnClick="refreshList">Refresh</asp:LinkButton>
    </div>
</asp:Content>
