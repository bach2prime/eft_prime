<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckIRItemProcess170.aspx.cs"
    Inherits="EFT_Proj.Inward.CheckIRItemProcess170" %>

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
                    <td width="33%">
                        <asp:Label ID="batchno" runat="server" Text="Batch No" Font-Size="14px"></asp:Label>
                        <span style="margin-left: 40px">
                            <asp:Label ID="chequecount" runat="server" Text="Label"></asp:Label></span>
                    </td>
                    <td>
                        <span style="padding-left: 40px; color: red; font-weight: bold">Advice No:</span>
                        <asp:TextBox ID="tbAdviceNo" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <asp:Label ID="LabelItemType" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="33%" align="left">
                        <asp:Label ID="Label3" runat="server" Text="Trace Number" Font-Size="14px"></asp:Label>
                        :&nbsp;&nbsp;
                        <asp:Label ID="LabelTraceNumber" runat="server" Font-Bold="True" Font-Underline="False"></asp:Label>
                    </td>
                    <td align="left" style="">
                    </td>
                </tr>
                <tr>
                    <td align="left" width="33%">
                        <asp:Label ID="Label4" runat="server" Font-Size="14px" Text="Original Trace Number:"
                            Visible="False"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Label ID="LabelOriginalTraceNumber" runat="server" Font-Bold="True" Font-Underline="False"
                            Visible="False"></asp:Label>
                    </td>
                    <td align="left" style="">
                    </td>
                </tr>
                <tr>
                    <td align="left" width="33%">
                        <asp:Label ID="Label5" runat="server" Font-Size="14px" Text="T24 TxID:"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Label ID="LabelT24TxID" runat="server" Font-Bold="True" Font-Underline="False"></asp:Label>
                    </td>
                    <td align="left" style="">
                    </td>
                </tr>
            </table>
            <div class="main">
                <h3>
                    Transaction Details</h3>
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
                <%--<table id="tableOriginalItem" style="width: 100%;" cellspacing="0" cellpadding="5"
                    runat="server" visible="True">
                    <tr>
                        <td style="width: 50%;">
                            <b>Original Item</b>
                        </td>
                        <td>
                            <b>Maker Return</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gridviewReturnGenerated" runat="server" AutoGenerateColumns="False"
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
                        <td style="margin-left: 40px">
                            <asp:GridView ID="gridviewParent" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#151515" GridLines="None" HorizontalAlign="Left" ShowHeader="false"
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
                    </tr>
                </table>--%>
                <p runat="server" id="ReturnReasonDD" visible="false">
                    <asp:Label ID="Label1" runat="server" Text="Return Reason"></asp:Label>
                    <asp:DropDownList ID="comboRejectReasons" runat="server" DataTextField="Message" AutoPostBack="True"
                        DataValueField="Code" OnSelectedIndexChanged="comboRejectReasons_OnSelectedIndexChanged">
                    </asp:DropDownList>
                </p>
                <p runat="server" ID="FieldErrors" Visible="False">
                    Field Errors:: Return Contains:
                    <br/><asp:CheckBox ID="CheckBox1" runat="server" Text="01 : Incorrect DFI Account Number" />
                    <br/><asp:CheckBox ID="CheckBox2" runat="server" Text="02 : Incorrect Original Entry Trace Number" />
                    <br/><asp:CheckBox ID="CheckBox3" runat="server" Text="03 : Incorrect Taka Amount" />
                    <br/><asp:CheckBox ID="CheckBox4" runat="server" Text="04 : Incorrect Individual Identification Number/Identification Number" />
                    <br/><asp:CheckBox ID="CheckBox5" runat="server" Text="05 : Incorrect Transaction Code" />
                    <br/><asp:CheckBox ID="CheckBox6" runat="server" Text="06 : Incorrect Company Identificatio" />
                    <br/><asp:CheckBox ID="CheckBox7" runat="server" Text="07 : An Invalid Effective Entry Date" />
                </p>
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="False">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
                <p style="clear: both; text-align: center;">
                    <asp:Button ID="ProcessCBS" runat="server" Visible="false" CssClass="buttonStyle redfont" Text="Process CBS"
                        OnClick="ProcessCBS_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:Button ID="Return" runat="server" Visible="false" CssClass="buttonStyle redfont" Text="Return"
                        OnClick="ProcessEdrItem" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <button class="buttonStyle" id="cancel" type="button" onclick="window.returnValue ='cancel'; window.close();">
                        Close</button>
                </p>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
