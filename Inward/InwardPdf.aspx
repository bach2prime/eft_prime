<%@ Page Title="Inward: PDF" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="InwardPdf.aspx.cs" Inherits="EFT_Proj.Inward.InwardPdf" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/UserInterface.js"></script>
    <script type="text/javascript" src="../Scripts/amount.js"></script>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.limit-1.2.js" type="text/javascript"></script>
    <script type="text/javascript">

        function OnFocusOutForm(event) {
            document.getElementById("labelAmountWord").innerHTML = toWord(document.getElementById("tbAmount").value);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="padding: 0px; border: 1px solid #f0f0f0;">
        <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
            cellpadding="5">
            <tr>
                <td>
                    <b>Print Inward PDF</b>
                </td>
                <td>
                    Business Date: (Please Select Last Business Date)&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                        TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Dispatch No Prefix&nbsp;(not important now)&nbsp;
                    <asp:TextBox ID="txtPrefix" runat="server" CssClass="textBox" Text=""></asp:TextBox>
                    &nbsp;
                    <asp:Button CssClass="buttonStyle" ID="ButtonPrefixUpdate" runat="server" Text="Update"
                        Visible="false" OnClick="ButtonPrefixUpdate_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Dispatch No Starting Value (not important now)&nbsp;&nbsp;
                    <asp:TextBox ID="txtStart" runat="server" CssClass="textBox" Text="1"></asp:TextBox>
                    &nbsp;
                    <asp:Button CssClass="buttonStyle" ID="ButtonSummary" runat="server" Text="Summary"
                        OnClick="ButtonSummary_Click" OnClientClick="loading()" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="overflow: scroll; max-height: 400px;">
                        <asp:GridView ID="gridviewTxList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" EnableViewState="true">
                            <Columns>
                                <asp:BoundField DataField="Code" HeaderText="Region" />
                                <%--<asp:BoundField DataField="NameStr" HeaderText="Dispatch" />--%>
                                <asp:BoundField DataField="RecptCrItem" HeaderText="Item Count" />
                                <asp:BoundField DataField="RecptCrAmount" HeaderText="Credit Amount" />
                                <asp:BoundField DataField="ZoneName" HeaderText="Routing Number" />
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
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button CssClass="buttonStyle" ID="ButtonGeneratePdfs" runat="server" Text="Generate PDFs"
                        OnClick="ButtonGeneratePdfs_Click" OnClientClick="loading()" />
                </td>
            </tr>
        </table>
    </div>
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
