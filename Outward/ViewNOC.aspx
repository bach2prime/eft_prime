<%@ Page Title="Outward: View NOC" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ViewNOC.aspx.cs" Inherits="EFT_Proj.Outward.ViewNOC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function showNOC(chkno) {          
        var url = 'ViewNOCProcess.aspx?edrId=' + chkno;
        var checkId = { chkno: chkno };

        var r = window.showModalDialog(url, [], "dialogwidth: 824px; dialogheight: 768px; resizable: yes; dialogHide:yes");

        if (r == "cancel" || r == null) {
            //javascript: __doPostBack('ctl00$MainContent$PostBack', '');
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <div id="divEFTItemList" runat="server">
        <cc2:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image1"
            TargetControlID="tbsettDate" Format="dd/MM/yyyy">
        </cc2:CalendarExtender>
        Business Date: (Please Select Last Business Date)&nbsp;
        <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
        <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
        &nbsp;&nbsp;
        <asp:Button ID="ButtonTxList" CssClass="buttonStyle" runat="server" Text="Transactions"
            OnClick="ButtonTxList_Click" />
        <hr />
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>
        <h4>
            NOC Items</h4>
        <asp:GridView ID="gridviewNoCList" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
            <Columns>                
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="javascript:showNOC('<%# Eval("EdrOutId") %>')">Details</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="FilenameItem" HeaderText="File" />--%>
                <%--<asp:BoundField DataField="ItemTypeStr" HeaderText="Type" />--%>
                <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                <asp:BoundField DataField="TraceNumber" HeaderText="Trace No" />
                <%--<asp:BoundField DataField="SettlementDate" HeaderText="Settlement Date" DataFormatString="{0:dd MMM yyyy}" />--%>
                <asp:BoundField DataField="OrigBankName" HeaderText="From" />
                <%--<asp:BoundField DataField="CompanyName" HeaderText="Company" />--%>
                <%--<asp:BoundField DataField="AmountCr" HeaderText="AmountCr" />
                <asp:BoundField DataField="AmountDr" HeaderText="AmountDr" />--%>
                <asp:BoundField DataField="DfiAccountNumber" HeaderText="A/C" />
                <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                <asp:BoundField DataField="StatusStr" HeaderText="Status" />
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
