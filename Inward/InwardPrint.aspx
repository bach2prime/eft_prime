<%@ Page Title="Inward: Print" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="InwardPrint.aspx.cs" Inherits="EFT_Proj.Inward.InwardPrint" %>

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
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <div style="padding: 0px; border: 1px solid #f0f0f0;">
        <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
            cellpadding="5">
            <tr>
                <td>
                    <b>Print Inward Items</b>
                </td>
                <td>Business Date: (Please Select Last Business Date)&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                        TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                        AppendDataBoundItems="true">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button CssClass="buttonStyle" ID="ButtonGetItems" runat="server" Text="Get Items"
                        OnClick="ButtonGetItems_Click" OnClientClick="loading()" />
                    &nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </div>
    <fieldset class="printItem" style="width: 900px">
        <legend>
            <asp:Label ID="LabelBranch" runat="server" Text="Print Items"></asp:Label>
        </legend>
        <table cellpadding="15">
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButtonInward" runat="server" OnClick="LinkButtonInward_Click">Inward Items</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonCSV" runat="server" OnClick="LinkButtonInward_Click">CSV Format</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonInwardReturn" runat="server" OnClick="LinkButtonInward_Click">Inward Return</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonInwardDisRet" runat="server" Visible="false" OnClick="LinkButtonInward_Click">Inward Dishonored Returns</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonInConsDisRet" runat="server" Visible="false" OnClick="LinkButtonInward_Click">Inward Contested Dishn Returns</asp:LinkButton>
                </td>
            </tr>
        </table>
        <%--for Meghna Bank--%>
        <div runat="server" id="divMeghna" visible="false">
            <table cellpadding="15">
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButtonCrExcel" runat="server" OnClick="LinkButtonInward_Click">Inward Credit Excel</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButtonDrExcel" runat="server" OnClick="LinkButtonInward_Click">Inward Debit Excel</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>

        <div runat="server" id="divNrbg" visible="false">
            <table cellpadding="15">
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButtonNrbgHeadOff" runat="server" OnClick="LinkButtonInward_Click">CBS File for HO</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButtonNrbgBranch" runat="server" OnClick="LinkButtonInward_Click">CBS file for Branch</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    <br />
    <%--<fieldset class="printItem" style="width: 900px">
        <legend>Advice List </legend>
        <table cellpadding="15">
            <div id="divAdviceList" runat="server">
                
            </div>
        </table>
    </fieldset>--%>
    <br />
    <%--<asp:Button CssClass="buttonStyle" ID="ButtonAllAdvice" runat="server" Text="All Advice"
         OnClientClick="loading()" onclick="ButtonAllAdvice_Click" />--%>
    <br />
    <%--<asp:Button CssClass="buttonStyle" ID="ButtonAllPDF" runat="server" Text="All PDF"
        OnClick="ButtonAllPDF_Click" OnClientClick="loading()" />--%>
    <br />

    <h3>Item List</h3>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Width="900px" Visible="False" BackColor="#e9e9e9" Height="469px" ShowZoomControl="False">
        <LocalReport ReportPath="">
        </LocalReport>
    </rsweb:ReportViewer>
    <hr />
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
