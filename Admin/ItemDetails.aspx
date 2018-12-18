<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="EFT_Proj.Admin.ItemDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Details</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            color: black;
            font-size:14px;
            margin:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>            
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UPCheckItem" runat="server">
        <ContentTemplate>
            <input type="hidden" id="cheque_id" runat="server" value="" />
            <table style="width: 100%; margin-left:15px;">
                <tr>
                    <td>
                        <asp:Label ID="LabelItemType" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="width: 200px">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="window.print();">Print</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="window.close();">Close</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="Label3" runat="server" Text="Trace Number" Font-Size="14px"></asp:Label>
                        &nbsp;:&nbsp;
                        <asp:Label ID="LabelTraceNumber" runat="server" Font-Bold="True" Font-Underline="False"></asp:Label>
                    </td>
                    <td align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="batchno" runat="server" Text="Batch No" Font-Size="14px"></asp:Label>
                    </td>
                </tr>
                
            </table>
            <div class="main">
                <h3>
                    Transaction Details</h3>
                <table style="width: 100%;" cellspacing="0" cellpadding="5">
                    <tr>
                        <td style="margin-left: 40px" valign="top">
                            <b>Originator Details</b>
                            <asp:GridView ID="gridviewOriginator" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" GridLines="None" HorizontalAlign="Left" ShowHeader="false"
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
                                <RowStyle CssClass="RowStylez" />
                                <AlternatingRowStyle CssClass="AlternatingRowStylez" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <b>Receiver Details</b>
                            <asp:GridView ID="gridviewReceiver" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                GridLines="None" HorizontalAlign="Left" ShowHeader="false"
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
                                <RowStyle CssClass="RowStylez" />
                                <AlternatingRowStyle CssClass="AlternatingRowStylez" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel runat="server" ID="panelReturn">
                    <table id="tableReturnEntry" style="width: 100%;" cellspacing="0" cellpadding="5"
                        runat="server" visible="True">
                        <tr>
                            <td style="width: 50%;">
                                <b>Others</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gridviewReturnGenerated" runat="server" AutoGenerateColumns="False"
                                    CellPadding="4" GridLines="None" HorizontalAlign="Left" ShowHeader="false"
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
                                    <RowStyle CssClass="RowStylez" />
                                    <AlternatingRowStyle CssClass="AlternatingRowStylez" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="False">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
                <%--<p runat="server" id="ActionPanel" style="clear: both; text-align: center;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <button class="buttonStylez" style="width: 120px" id="print" type="button" onclick="window.print();">
                        Print</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <button class="buttonStyle" id="cancel" type="button" onclick="window.returnValue ='cancel'; window.close();">
                        Close</button>
                </p>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
