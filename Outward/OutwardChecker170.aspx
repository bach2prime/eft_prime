<%@ Page Title="EFT Outward: Checker" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="OutwardChecker170.aspx.cs" Inherits="EFT_Proj.Outward.OutwardChecker170" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%">
        <fieldset id="freeBatches" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="LabelBank" runat="server" Text="Ready Batches"></asp:Label></legend>
            <table cellpadding="10">
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                            AppendDataBoundItems="true">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button CssClass="buttonStyle" ID="ButtonGetBatches" runat="server" Text="Get Batches"
                            OnClientClick="loading()" OnClick="LoadBatchesClick" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gridviewOpenBatches" runat="server" AutoGenerateColumns="False"
                CellPadding="4" ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                <Columns>
                    <asp:BoundField DataField="BatchOutId" HeaderText="Batch ID" />
                    <asp:BoundField DataField="BatchNumberOut" HeaderText="Batch No" />
                    <asp:BoundField DataField="CurrencyStr" HeaderText="Currency" />
                    <asp:BoundField DataField="UserName" HeaderText="Last User" />
                    <asp:BoundField DataField="Locked" HeaderText="Locked" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdBatchID" runat="server" Value='<%# Eval("BatchOutId") %>' />
                            <asp:LinkButton ID="lockbt" runat="server" OnClick="LockBatchForChecker">Lock Batch</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                <SelectedRowStyle CssClass="SelectedRowStyle" />
                <HeaderStyle CssClass="HeaderStyleDark" />
                <RowStyle CssClass="RowStyle" />
                <EditRowStyle CssClass="EditRowStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
        </fieldset>
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>
        <fieldset id="itemList" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="Label1" runat="server" Text="Batch Details"></asp:Label></legend>
            <table style="width: 100%" cellpadding="4" cellspacing="0" class="dataEntryTable">
                <tr class="evenRow">
                    <td>Batch ID:
                        <asp:Label ID="LabelBatchID" runat="server" Font-Bold="true" Text="0"></asp:Label>
                        &nbsp;&nbsp;&nbsp; Batch No:
                        <asp:Label ID="LabelBatchNumber" runat="server" Font-Bold="true" Text="0"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                    </td>
                    <td>Payment Type:
                        <asp:Label ID="LabelType" runat="server" Text=""></asp:Label>
                    </td>
                    <td>Company Id:
                        <asp:Label ID="LabelCompanyId" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr class="evenRow">
                    <td>Company Name:
                        <asp:Label ID="LabelCompName" runat="server" Text=""></asp:Label>
                    </td>
                    <td>Entry Desc:
                        <br />
                        <asp:Label ID="LabelEntryDesc" runat="server" Text=""></asp:Label>
                    </td>
                    <td>Discretionary Data:
                        <br />
                        <asp:Label ID="LabelDiscData" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr class="evenRow" style="font-weight: bold;">
                    <td>Item Count:
                        <asp:Label ID="LabelItemCount" runat="server" Text="0"></asp:Label>
                    </td>
                    <td>Credit:
                        <asp:Label ID="LabelCredit" runat="server" Text="0"></asp:Label>
                        <asp:Label ID="LabelCreditCurrency" runat="server" Text=""></asp:Label>
                    </td>
                    <td>Debit:
                        <asp:Label ID="LabelDebit" runat="server" Text="0"></asp:Label>
                        <asp:Label ID="LabelDebitCurrency" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#151515" GridLines="None" Width="95%" ViewStateMode="Enabled" ShowFooter="false"
                AllowPaging="true" OnRowDataBound="gridviewItems_RowDataBound" PageSize="100"
                OnPageIndexChanging="gridviewItems_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="EdrOutId" HeaderText="Item ID" />
                    <asp:BoundField DataField="TraceNumber" HeaderText="Trace Number" />
                    <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                    <asp:BoundField DataField="AccountFrom" HeaderText="Sender A/C" />
                    <asp:BoundField DataField="AmountDr" HeaderText="Debit" />
                    <asp:BoundField DataField="AmountCr" HeaderText="Credit" />
                    <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                    <asp:BoundField DataField="DfiAccountNumber" HeaderText="Recv A/C" />
                    <asp:BoundField DataField="RecvBankName" HeaderText="Bank" />
                    <asp:BoundField DataField="RecvBranchName" HeaderText="Branch" />
                    <asp:BoundField DataField="ReceiverId" HeaderText="Receiver ID" />
                    <asp:BoundField DataField="ReceiverName" HeaderText="Receiver Name" ItemStyle-Width="50px"
                        ItemStyle-Wrap="False" />
                    <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                    <asp:TemplateField HeaderText="">
                        <ItemStyle Width="180px" />
                        <ItemTemplate>
                            <asp:HiddenField ID="hdEdrOutId" runat="server" Value='<%# Eval("EdrOutId") %>' />
                            <%--<asp:LinkButton ID="LinkButtonRm" runat="server" OnClick="UpdateItem">Remake</asp:LinkButton>--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButtonRej" runat="server" ForeColor="Red" OnClientClick="return window.confirm('This item will be deleted from this batch. Are you sure?');"
                                OnClick="ButtonDeleteItemYes_Click">Delete </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#6FA7D1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                <SelectedRowStyle CssClass="SelectedRowStyle" />
                <HeaderStyle CssClass="HeaderStyleDark" />
                <RowStyle CssClass="RowStyle" />
                <EditRowStyle CssClass="EditRowStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
            <br />
            <asp:Button ID="ButtonProcessItems" OnClientClick="return window.confirm('These items will be sent to CBS. Are you sure?');"
                runat="server" CssClass="buttonStyle" Text="Send to CBS" OnClick="ButtonProcessItems_Click" />
            &nbsp;
            <asp:Button ID="ButtonUpdateBatch" OnClientClick="return window.confirm('This Batch will be finalized. Are you sure?');"
                runat="server" CssClass="buttonStyle" Text="Checking Done" OnClick="ButtonYes_Click" />
            &nbsp;<asp:Button ID="ButtonUnlockBatch" runat="server" CssClass="buttonStyle" Visible="false"
                Text="Unlock Batch" OnClick="ButtonUnlockBatch_Click" />
        </fieldset>
    </div>
</asp:Content>
