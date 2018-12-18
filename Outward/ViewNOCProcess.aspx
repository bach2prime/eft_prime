<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewNOCProcess.aspx.cs"
    Inherits="EFT_Proj.Outward.ViewNOCProcess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Details</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/jquery-1.4.1.min.js" />
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UPCheckItem" runat="server">
        <ContentTemplate>
            <input type="hidden" id="cheque_id" runat="server" value="" />
            <table style="width: 100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="LabelItemType" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="NOC Trace Number : ID" Font-Size="14px"></asp:Label>
                    </td>
                    <td align="left" style="">
                        <asp:Label ID="LabelTraceNumber" runat="server" Font-Bold="True" Font-Underline="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Font-Size="14px" Text="Original Trace Number : ID"></asp:Label>
                    </td>
                    <td align="left" style="">
                        <asp:Label ID="LabelOriginalTraceNumber" runat="server" Font-Bold="True" Font-Underline="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <div class="main">
                <h3>
                    Original Item Details</h3>
                <table style="width: 100%;" cellspacing="0" cellpadding="5">
                    <tr>
                        <td style="width: 50%;">
                            <b>Receiver Details</b>
                        </td>
                        <td>
                            <b>Originator Details</b>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:GridView Style="text-align: left" ID="gridviewReceiver" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#151515" GridLines="None" ShowHeader="false" HorizontalAlign="Left"
                                Width="100%" ViewStateMode="Enabled">
                                <Columns>
                                    <asp:BoundField DataField="Name">
                                        <ItemStyle Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Value">
                                        <ItemStyle />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                                <RowStyle CssClass="RowStyle" />
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                            </asp:GridView>
                        </td>
                        <td valign="top" style="margin-left: 40px">
                            <asp:GridView Style="text-align: left" ID="gridviewOriginator" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#151515" GridLines="None" ShowHeader="false" HorizontalAlign="Left"
                                Width="100%" ViewStateMode="Enabled">
                                <Columns>
                                    <asp:BoundField DataField="Name">
                                        <ItemStyle Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Value">
                                        <ItemStyle />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                                <RowStyle CssClass="RowStyle" />
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <table id="tableNOC" style="width: 100%;" cellspacing="0" cellpadding="5" runat="server">
                    <tr>
                        <td style="width: 50%;">
                            <h3>
                                NOC Details</h3>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%;">
                            <asp:GridView ID="gridviewNOCGenerated" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#151515" GridLines="None" HorizontalAlign="Left" ShowHeader="false"
                                Style="text-align: left" ViewStateMode="Enabled" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Name">
                                        <ItemStyle Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Value">
                                        <ItemStyle />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                                <RowStyle CssClass="RowStyle" />
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                            </asp:GridView>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <br />
                        <input style="" type="button" class="buttonStyle" value="Print" onclick="window.print()" />
                        </td>
                    </tr>
                </table>
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="False">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
