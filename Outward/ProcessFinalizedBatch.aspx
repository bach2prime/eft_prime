<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcessFinalizedBatch.aspx.cs"
    Inherits="EFT_Proj.Outward.ProcessFinalizedBatch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Details</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <style>
        body
        {
            padding: 10px;
        }
    </style>
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
            <div style="width: 450px; float: left">
                <table width="100%" cellpadding="6">
                    <tr class="rowAlter">
                        <td width="33%" align="right">
                            <asp:Label ID="batchno" runat="server" Text="Batch No:" Font-Size="14px"></asp:Label>
                        </td>
                        <td>
                            <asp:HiddenField ID="hfBatchId" runat="server" />
                            <asp:Label ID="labelBatchNo" runat="server" Text="" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="33%">
                            <span style="color:Red"> Select Business Date:</span>
                        </td>
                        <td>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                            <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                        </td>
                    </tr>
                    <tr class="rowAlter">
                        <td align="right" width="33%">
                            Filename:
                        </td>
                        <td>
                            <asp:Label ID="labelFilename" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="33%">
                            Operation Date:
                        </td>
                        <td>
                            <asp:Label ID="labelOperationDate" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr class="rowAlter">
                        <td align="right" width="33%">
                            Secc:
                        </td>
                        <td>
                            <asp:Label ID="labelSecc" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="33%">
                            Created By:
                        </td>
                        <td>
                            <asp:Label ID="labelUsername" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr class="rowAlter">
                        <td align="right" width="33%">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="PanelError" runat="server" CssClass="messageBox" Visible="False">
                    <asp:Label ID="labelError" runat="server" Text="Error"></asp:Label>
                </asp:Panel>
                <p style="text-align: center;">
                    <%--<asp:Button ID="Previous" runat="server" Text="Previous" CssClass="buttonStyle" OnClick="ProcessEdrItem" />
            <asp:Button ID="Next" runat="server" Text="Next" CssClass="buttonStyle" OnClick="ProcessEdrItem" />--%>
                    <%--<asp:Button ID="buttonFinalize" runat="server" CssClass="buttonStyle" Style="color: Green;"
                        Text="Finalize" OnClick="buttonFinalize_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <asp:Button ID="buttonRemake" runat="server" CssClass="buttonStyle" Style="color: Red;"
                        Text="Remake" OnClick="buttonRemake_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="buttonStyle" id="cancel" type="button" onclick="window.returnValue ='cancel'; window.close();">
                        Close</button>
                </p>
                <br />
                <b style="color: Red">Note</b><br />
                <ul>
                    <li><b>&lt;FileRejectStatus&gt;</b> is <b>1 or 2</b> if Error Occurs </li>
                    <li>See <b>&lt;RejectReasonDescription&gt;</b> </li>
                    <li>If OK then close the window and click 'Process Ack'</li>
                    <li>If Error occurs then send to Remake</li>
                </ul>
            </div>
            <div style="float: left; padding-left: 20px; width: 400px;">
                <b>Acknowledgement</b><br />
                <asp:Label ID="ack" runat="server" Text="ack"></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
