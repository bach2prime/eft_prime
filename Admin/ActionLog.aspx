<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ActionLog.aspx.cs" Inherits="EFT_Proj.Admin.ActionLogPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 100%; padding-top: 5px;">
                <div style="padding: 0px; border: 1px solid #f0f0f0;">
                    <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
                        cellpadding="5">
                        <tr>
                            <td style="text-align: right; width: 150px;">
                                Date&nbsp;&nbsp;
                                <asp:TextBox ID="tbFromDate" runat="server" CssClass="textBox" Width="75px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    Format="dd/MM/yyyy" TargetControlID="tbFromDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td style="text-align: left; width: 140px;">
                                <asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/media/images/cal2.png" />
                                &nbsp;&nbsp;To&nbsp;&nbsp;
                                <asp:TextBox ID="tbToDate" runat="server" CssClass="textBox" Width="75px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image2"
                                    Format="dd/MM/yyyy" TargetControlID="tbToDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td style="text-align: left; width: 30px;">
                                <asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/media/images/cal2.png" />
                            </td>
                            <td>
                                Branch
                                <asp:DropDownList ID="ddlBranch" runat="server" AppendDataBoundItems="true" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                User
                                <asp:DropDownList ID="ddlUser" runat="server" AppendDataBoundItems="true">
                                </asp:DropDownList>
                            </td>
                            <td>
                                Type&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="ddlType" runat="server" AppendDataBoundItems="true" DataTextField="name"
                                    DataValueField="value">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: right;">
                                <asp:Button ID="btnGenReport" runat="server" CssClass="buttonStyle" Text="Log" OnClick="btnGenReport_Click" />
                            </td>
                            <td style="width: 10%">
                                <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" DynamicLayout="false"
                                    runat="server" DisplayAfter="0">
                                    <ProgressTemplate>
                                        <img src="../media/images/ajax-loader.gif" width="20px" alt="Loading..." />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Panel ID="panel" runat="server">
                    <div style="padding: 2px; background-color: #fff; margin-top: 5px; border: 1px solid #f0f0f0;">
                        <b>
                            <asp:Label ID="label" runat="server"></asp:Label></b>
                        <table width="100%" cellpadding="0" cellspacing="25">
                            <tr>
                                <td style="border: 0px solid #c5c5c0; background-color: #fff;" valign="top">
                                    <asp:GridView Style="text-align: left" ID="gridviewItems" runat="server" AutoGenerateColumns="False"
                                        CellPadding="4" ForeColor="#151515" GridLines="None" HorizontalAlign="Left" Width="100%"
                                        ViewStateMode="Enabled" ShowFooter="false">
                                        <Columns>
                                            <asp:BoundField DataField="Id" HeaderText="ID" />
                                            <asp:BoundField HeaderText="Type" DataField="TypeStr">
                                                <ItemStyle ForeColor="Blue" />
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="User" DataField="UserName">
                                                <ItemStyle ForeColor="Green" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ActionTime" DataFormatString="{0:dd MMM yyyy HH:mm}" HeaderText="Time">
                                                <ItemStyle Width="18%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Details" HtmlEncode="false" HeaderText="Details">
                                                <ItemStyle Width="70%" />
                                            </asp:BoundField>
                                        </Columns>
                                        <HeaderStyle CssClass="HeaderStyleDark" HorizontalAlign="Left" />
                                        <RowStyle CssClass="RowStyle" />
                                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
