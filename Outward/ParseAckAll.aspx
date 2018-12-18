<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ParseAckAll.aspx.cs" Inherits="EFT_Proj.Outward.ParseAckAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function showFinalizeBatchDialog(batchId) {
            var url = '/Outward/ProcessFinalizedBatch.aspx?batchId=' + batchId;
            var r = window.showModalDialog(url, [], "dialogwidth: 950px; dialogheight: 850px; resizable: yes; dialogHide:yes; center:yes;");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 0px; border: 1px solid #f0f0f0;">
        <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
            cellpadding="5">
            <tr>
                <td>
                    <asp:Label Text="0" ID="labelCount" Font-Bold="True" runat="server" />
                    <b>&nbsp;Batches to Process</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max
                    <asp:TextBox runat="server" ID="txtCount" Text="50" Width="50px" />
                    &nbsp;
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnParseAck" runat="server" Text="Process Ack" CssClass="buttonStyle"
                        OnClientClick="loading()" OnClick="btnProcessAckClick" />&nbsp;&nbsp;&nbsp;
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
                    ForeColor="#333333" GridLines="None" Width="70%">
                    <Columns>
                        <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                        <asp:BoundField DataField="BatchOutId" HeaderText="Batch ID" />
                        <asp:BoundField DataField="BatchNumberOut" HeaderText="Batch No">                        
                            <ItemStyle HorizontalAlign="Left" Width="16%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CurrencyStr" HeaderText="Currency"/>
                        <asp:BoundField DataField="EffectiveEntryDate" DataFormatString="{0:dd MMM yy}" HeaderText="Settlement Date" />
                        <asp:BoundField DataField="FileNameBatch" HeaderText="File Name" ItemStyle-Wrap="False">
                            <ItemStyle HorizontalAlign="Center" Width="20%" />
                        </asp:BoundField>
                        <%--<asp:BoundField DataField="Ack" HeaderText="ACK" />--%>
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="javascript:showFinalizeBatchDialog('<%# Eval("BatchOutId") %>')"><%# Eval("Ack") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
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
