<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Monitor.aspx.cs" Inherits="EFT_Proj.Outward.Monitor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="padding: 0px; border: 1px solid #f0f0f0;">
        <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
            cellpadding="5">
            <tr>
                <td>
                    Type<br />
                    <asp:DropDownList ID="ddlType" Width="100px" runat="server" Font-Names="Arial" Font-Size="9pt">
                        <asp:ListItem Value="0">Outward</asp:ListItem>
                        <asp:ListItem Value="10">Inward</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp; Date&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                        TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    &nbsp; to&nbsp;
                    <asp:TextBox ID="tbDateTo" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image2"
                        TargetControlID="tbDateTo" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Image ID="Image2" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRefresh" runat="server" Text="Load" CssClass="buttonStyle" OnClick="BtnRefreshClick"
                        OnClientClick="loading()" />&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </div>
    <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
            <td>
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:Panel runat="server" ID="outwardPanel">
                    <asp:GridView ID="gvBatchList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                        ForeColor="#333333" GridLines="None" Width="100%" OnRowDataBound="gvBatchList_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                            <asp:BoundField DataField="BatchOutId" HeaderText="ID" />
                            <asp:BoundField DataField="BatchNumberOut" HeaderText="Batch No">
                                <ItemStyle HorizontalAlign="Left" Width="16%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                            <asp:BoundField DataField="EffectiveEntryDate" DataFormatString="{0:dd MMM yy}" HeaderText="Settlement Date" />
                            <asp:BoundField DataField="FileNameBatch" HeaderText="File Name" ItemStyle-Wrap="False">
                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Locked" HeaderText="Locked" />
                            <asp:BoundField DataField="UserName" HeaderText="User" />
                            <asp:BoundField DataField="Secc" HeaderText="Secc" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href="ShowLog.aspx?id=<%# Eval("BatchOutId") %>" target="_blank">Show Log</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle CssClass="SelectedRowStyle" />
                        <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                        <RowStyle CssClass="RowStyle" />
                        <EditRowStyle CssClass="EditRowStyle" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel runat="server" ID="inwardPanel">
                    <asp:GridView ID="gridviewTxList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                        <Columns>
                            <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                            <asp:BoundField DataField="SettlementDate" HeaderText="Settlement Date" DataFormatString="{0:dd MMM yyyy}" />
                            <asp:BoundField DataField="EdrInId" HeaderText="ID" />
                            <asp:BoundField DataField="TraceNumber" HeaderText="Trace No" />
                            <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                            <asp:BoundField DataField="ItemTypeStr" HeaderText="Type" />
                            <asp:BoundField DataField="OrigBankName" HeaderText="From" />
                            <asp:BoundField DataField="AmountCr" HeaderText="AmountCr" />
                            <asp:BoundField DataField="AmountDr" HeaderText="AmountDr" />
                            <asp:BoundField DataField="DfiAccountNumber" HeaderText="A/C" />
                            <asp:BoundField DataField="CompanyEntryDesc" HeaderText="Entry Desc" />
                        </Columns>
                        <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                        <SelectedRowStyle CssClass="SelectedRowStyle" />
                        <HeaderStyle CssClass="HeaderStyleDark" />
                        <RowStyle CssClass="RowStyle" />
                        <EditRowStyle CssClass="EditRowStyle" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <div id="load" style="visibility: hidden">
        <div id="progressBackgroundFilter">
        </div>
        <div id="processMessage">
            <div style="margin: auto; width: 40px">
                <img alt="Busy..." width="32px" src="../media/images/loader.gif" />
            </div>
        </div>
    </div>
</asp:Content>
