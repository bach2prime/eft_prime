<%@ Page Title="Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Report.aspx.cs" Inherits="EFT_Proj.Report.Report" Culture="bn-BD"
    UICulture="bn-BD" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .ajax__calendar_container
        {
            z-index: 100;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%; padding-top: 0px;">
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server" Font-Bold="True"></asp:Label>
        </asp:Panel>
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
        <div style="padding: 0px; border: 1px solid #f0f0f0;">
            <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
                cellpadding="5">
                <tr>
                    <%--<td style="width: 18%; padding-right: 25px; text-align: right">
                        <asp:Label ID="Label2" runat="server" Text="Select Report" Font-Bold="False"></asp:Label>
                    </td>--%>
                    <td style="padding-right: 5px;">
                        <asp:DropDownList ID="ddlReportName" runat="server" OnSelectedIndexChanged="ddlReportName_SelectedIndexChanged"
                            Font-Names="Segoe UI" Font-Size="8pt" Width="140px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        
                            <asp:DropDownList ID="ddlCurrency" runat="server" Font-Names="Segoe UI" Font-Size="8pt">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlSession" runat="server" Font-Names="Segoe UI" Font-Size="8pt">
                            </asp:DropDownList>
                      
                    </td>
                    <td style="text-align: right">
                        Date:
                        <asp:DropDownList ID="ddlDate" runat="server" AutoPostBack="false" Width="115px"
                            Font-Names="Segoe UI" Font-Size="8pt">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: right">
                        <asp:TextBox ID="tbFromDate" runat="server" CssClass="textBox" Width="75px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                            Format="dd/MM/yyyy" TargetControlID="tbFromDate">
                        </cc1:CalendarExtender>
                        <asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/media/images/cal2.png" />
                    </td>
                    <td style="text-align: left">
                        To
                        <asp:TextBox ID="tbToDate" runat="server" CssClass="textBox" Width="75px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image2"
                            Format="dd/MM/yyyy" TargetControlID="tbToDate">
                        </cc1:CalendarExtender>
                        <asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/media/images/cal2.png" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                            Width="160px" Font-Names="Segoe UI" Font-Size="8pt" AppendDataBoundItems="true">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="btnGenReport" runat="server" CssClass="buttonStyle" Text="Generate"
                            OnClick="btnGenReport_Click" OnClientClick="loading()" />
                    </td>
                    <td>
                        <%--<a href="Summary.aspx" target="_blank">Summary</a>--%>
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding: 2px; background-color: #fff; margin-top: 5px; border: 1px solid #f0f0f0;">
            <table width="100%" cellpadding="0" cellspacing="0" style="padding-left: 0px;">
                <tr>
                    <%--<td style="width: 200px;" valign="top">
                    <div class="userBox" style="min-height: 400px; margin-right: 10px;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="panelDate" runat="server">
                                    <table cellpadding="1" width="100%">
                                        <tr>
                                            <td style="width: 50px; text-align: left;">
                                                <asp:Label ID="labelDate" runat="server" Text="Date "></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Panel ID="panelCustomDate" runat="server" Visible="true">
                                        <table>
                                            <tr>
                                                <td style="width: 40px; text-align: right; padding: 0 10px 0 0;">
                                                    <asp:Label ID="labelFrom" runat="server" Text="Date"></asp:Label>
                                                </td>
                                                <td style="text-align: left; padding: 0 10px 0 0;">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:Panel>
                                <asp:Panel ID="panelBranch" runat="server" Width="100%">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="labelBranch" runat="server" Text="Branch"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                    </div>
                </td>
                    --%>
                    <td style="padding: 10px; border: 0px solid #c5c5c0; background-color: #fff; overflow: auto"
                        valign="top">
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BorderWidth="0px" Font-Names="Verdana"
                            Font-Size="8pt" Width="100%" Visible="true" BackColor="White" Height="469px"
                            ShowZoomControl="False">
                            <LocalReport ReportPath="">
                            </LocalReport>
                        </rsweb:ReportViewer>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server">
            <SelectParameters>
                <asp:Parameter Name="start" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="end" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="getBankList"
            TypeName="ACCS.DAL.Handler.BankController"></asp:ObjectDataSource>--%>
        <div id="load" style="visibility: hidden">
            <div id="progressBackgroundFilter">
            </div>
            <div id="processMessage">
                <div style="margin: auto; width: 120px">
                    <img alt="Busy..." width="120px" src="../media/images/103.gif" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
