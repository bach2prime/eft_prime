<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Advice.aspx.cs" Inherits="EFT_Proj.Admin.Advice" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
                    <td style="text-align: left; width: 40px;">
                        <asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/media/images/cal2.png" />
                        &nbsp;&nbsp;
                    </td>
                    <td style="text-align: right; width: 200px;">
                        <asp:Button ID="btnGenReport" runat="server" CssClass="buttonStyle" Text="Advice"
                            OnClick="btnGenReport_Click" />
                    </td>
                    <td style="width: auto">
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
                                OnRowDataBound="gridviewItems_RowDataBound" ViewStateMode="Enabled" ShowFooter="True">
                                <Columns>
                                    <asp:BoundField DataField="ZoneName" HeaderText="From" />
                                    <asp:BoundField DataField="Code" HeaderText="To" />
                                    <asp:BoundField DataField="NetAmount" HeaderText="Net Amount" />
                                    <asp:TemplateField ItemStyle-Wrap="False">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lockbt" runat="server" OnClick="PrintAdvice">Print Advice</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#6FA7D1" Font-Bold="True" ForeColor="White" />
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
</asp:Content>
