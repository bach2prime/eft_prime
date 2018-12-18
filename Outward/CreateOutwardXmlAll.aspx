<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CreateOutwardXmlAll.aspx.cs" Inherits="EFT_Proj.Outward.CreateOutwardXmlAll" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function showFinalizeBatchDialog(batchId) {
            var url = '/Outward/ProcessFinalizedBatch.aspx?batchId=' + batchId;
            var r = window.showModalDialog(url, [], "dialogwidth: 950px; dialogheight: 850px; resizable: yes; dialogHide:yes; center:yes;");

            if (r == "cancel" || r == null) {
                javascript: __doPostBack('ctl00$MainContent$PostBack', '');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 0px; border: 1px solid #f0f0f0;">
        <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
            cellpadding="5">
            <tr>
                <td>
                    <b>Batches Ready for File Generation</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max
                    <asp:TextBox runat="server" ID="txtCount" Text="50" Width="50px" />
                    &nbsp;
                    <asp:Button ID="btnRefresh" runat="server" Text="Reload" CssClass="buttonStyle" OnClick="btnRefresh_Click"
                        OnClientClick="loading()" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnGenerateXml" runat="server" Text="Generate Xml" CssClass="buttonStyle"
                        OnClientClick="loading()" OnClick="btnGenerateXml_Click" />&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:Label Text="0 Outward Files" Font-Bold="True" ID="lbXmlCount" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSendAll" runat="server" Text="Send All" CssClass="buttonStyle"
                        OnClientClick="loading()" onclick="btnSendAll_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnFtp" runat="server" Text="Test FTP" CssClass="buttonStyle" OnClick="btnFtp_Click"
                        OnClientClick="loading()" />
                </td>
            </tr>
        </table>
    </div>
    <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
            <td>
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                    <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:GridView ID="gvBatchList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                    ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                        <asp:BoundField DataField="BatchOutId" HeaderText="Batch ID" />
                        <asp:BoundField DataField="BatchNumberOut" HeaderText="Batch No">                        
                            <ItemStyle HorizontalAlign="Left" Width="16%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CurrencyStr" HeaderText="Currency"/>
                        <asp:BoundField DataField="Secc" HeaderText="Secc" />
                        <asp:BoundField DataField="EffectiveEntryDate" DataFormatString="{0:dd MMM yy}" HeaderText="Settlement Date" />
                        <%--<asp:BoundField DataField="FileNameBatch" HeaderText="File Name" ItemStyle-Wrap="False">
                            <ItemStyle HorizontalAlign="Center" Width="20%" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--<asp:BoundField DataField="StatusStr" HeaderText="Status" />--%>
                        <%-- <asp:TemplateField ItemStyle-Wrap="False">
                            <ItemStyle HorizontalAlign="Center" Width="20%" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lockbt" runat="server" OnClientClick="loading()" OnClick="GenerateOutwardXML">Generate XML</asp:LinkButton>
                                <asp:HiddenField ID="hdBatchOutId" runat="server" Value='<%# Eval("BatchOutId") %>' />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="SendToPBM" OnClientClick="loading()">Send to PBM</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="javascript:showFinalizeBatchDialog('<%# Eval("BatchOutId") %>')">Finalize</a>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
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
    <div style="display: none">
        <asp:LinkButton ID="PostBack" runat="server" OnClick="refreshList">Refresh</asp:LinkButton>
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
