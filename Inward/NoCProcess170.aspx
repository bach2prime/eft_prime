<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoCProcess170.aspx.cs" Inherits="EFT_Proj.Inward.NoCProcess170" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Details</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UPCheckItem" runat="server">
        <ContentTemplate>
            <div style="padding: 10px; width: 600px; margin: auto;">
                <h3 style="margin-top: 0px;">
                    Notification of Change</h3>
                <asp:HiddenField ID="edrInId" runat="server" />
                <asp:HiddenField ID="roleTypeControl" runat="server" />
                <div style="width: 100%; margin: auto;">
                    <table width="100%">
                        <tr>
                            <td align="right" width="200">
                                NOC Code
                            </td>
                            <td>
                                <asp:DropDownList ID="comboNoC" runat="server" DataTextField="Message" DataValueField="Code"
                                    Width="100%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Correction Data (Max Length 30)
                            </td>
                            <td>
                                <asp:TextBox ID="textCorrectedData" MaxLength="30" runat="server" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="False">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
                <p style="clear: both; text-align: center;">
                    <%--<asp:Button ID="Previous" runat="server" Text="Previous" CssClass="buttonStyle" OnClick="ProcessEdrItem" />
            <asp:Button ID="Next" runat="server" Text="Next" CssClass="buttonStyle" OnClick="ProcessEdrItem" />--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="SendNoC" runat="server" CssClass="buttonStyle" OnClick="ProcessEdrItem"
                        Text="Generate NOC" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <button id="cancel" class="buttonStyle" onclick=" window.returnValue ='cancel';window.close() "
                        type="button">
                        Close
                    </button>
                </p>
                </p>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
