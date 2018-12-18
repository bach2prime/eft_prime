<%@ Page Title="Inward: Download Return" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DownloadReturns.aspx.cs" Inherits="EFT_Proj.Inward.DownloadReturns" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="downloadICE" runat="server">
        <ContentTemplate>
            <%--<cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                TargetControlID="fileDate" Format="dd/MM/yyyy">
            </cc1:CalendarExtender>--%>
            <h3>
                Download EFT Files</h3>
            <%--Date:<asp:TextBox ID="fileDate" runat="server" Width="80px"></asp:TextBox>
            <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
            &nbsp;&nbsp;&nbsp; --%>
            Count:
            <asp:TextBox ID="TextBoxFileCount" Text="10" Width="30px" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Button ID="ButtonNewFile" CssClass="buttonStyle" runat="server" Text="New Files"
                OnClick="ButtonNewFile_Click" />
            <hr />
            <table width="100%" cellpadding="5" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="labelFileList" runat="server" CssClass="aspLabel" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="ButtonParseFiles" runat="server" CssClass="buttonStyle" 
                            OnClick="ButtonParseFiles_Click" Text="Parse Files" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
