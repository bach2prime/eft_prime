<%@ Page Title="Inward: Download" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Download170.aspx.cs" Inherits="EFT_Proj.Inward.Download170" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="downloadICE" runat="server">
        <ContentTemplate>
            <div style="padding: 0px; border: 1px solid #f0f0f0;">
                <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
                    cellpadding="5">
                    <tr>
                        <td>
                            <b>Download EFT Files</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Count:
                            <asp:TextBox ID="TextBoxFileCount" Text="10" Width="30px" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="ButtonNewFile" CssClass="buttonStyle" runat="server" Text="New Files"
                                OnClick="ButtonNewFile_Click" />
                        </td>
                         <td>
                            <asp:CheckBox ID="CheckBoxBlockDuplicateTrace" Text="Block Duplicate Trace No" Checked="False" runat="server" />
                        </td>
                        <td style="width: 30%;">
                            <a href="../Admin/Holiday.aspx" style="color: red">Holiday Management</a>
                            <%--<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="downloadICE" DynamicLayout="false"
                                runat="server" DisplayAfter="0">
                                <ProgressTemplate>
                                    <img src="../media/images/ajax-loader.gif" width="20px" alt="Loading..." />
                                </ProgressTemplate>
                            </asp:UpdateProgress>--%>
                        </td>
                    </tr>
                </table>
            </div>
            <table width="100%" cellpadding="5" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="labelFileList" runat="server" CssClass="aspLabel" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="ButtonParseFiles" runat="server" CssClass="buttonStyle" OnClick="ButtonParseFiles_Click"
                            Text="Parse Files" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%;" valign="top">
                        <asp:GridView Style="text-align: left" ID="gridviewFileList" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name">
                                    <ItemStyle Width="50%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="Length" HeaderText="Size" />
                                <asp:BoundField DataField="CreationTime" HeaderText="Creation Time" />
                            </Columns>
                            <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle CssClass="SelectedRowStyle" />
                            <HeaderStyle CssClass="HeaderStyleDark" />
                            <RowStyle CssClass="RowStyle" />
                            <EditRowStyle CssClass="EditRowStyle" />
                            <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:GridView ID="gvLoadResult" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#151515" GridLines="None" Style="text-align: left" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="fileName" HeaderText="File">
                                    <ItemStyle Width="40%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="info" HeaderText="Result" HtmlEncode="false" />
                            </Columns>
                            <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle CssClass="SelectedRowStyle" />
                            <HeaderStyle CssClass="HeaderStyleDark" />
                            <RowStyle CssClass="RowStyle" />
                            <EditRowStyle CssClass="EditRowStyle" />
                            <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:UpdateProgress AssociatedUpdatePanelID="downloadICE" ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div id="progressBackgroundFilter">
                    </div>
                    <div id="processMessage">
                        <div style="margin: auto; width: 120px">
                            <img alt="Busy..." width="120px" src="../media/images/103.gif" />
                        </div>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
