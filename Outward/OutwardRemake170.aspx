<%@ Page Title="EFT Outward: Remake" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="OutwardRemake170.aspx.cs" Inherits="EFT_Proj.Outward.OutwardRemake170" %>

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
    <script type="text/javascript">

        function showPopUp() {

            var a = new Array;
            a[0] = 1;
            a[1] = 4;

            var url = 'GetRoutingNo.aspx';
            var r = window.showModalDialog(url, a, "dialogwidth: 780px; dialogheight:150px; resizable: yes; dialogHide:yes");
            //var formid = document.getElementsByTagName("form");
            //if (r != null) {
            //  window.location.reload(true);
            //}
            document.getElementById("tbReceiveBankBranch").value = r;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset id="freeBatches" runat="server" class="formBoxGV">
        <legend>
            <asp:Label ID="LabelBank" runat="server" Text="Batches to Remake"></asp:Label></legend>
        <asp:GridView ID="gridviewOpenBatches" runat="server" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
            <Columns>
                <asp:BoundField DataField="BatchOutId" HeaderText="Batch ID" />
                <asp:BoundField DataField="BatchNumberOut" HeaderText="Batch No" />
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
                <td>
                    Batch ID:
                    <asp:Label ID="LabelBatchID" runat="server" Font-Bold="true" Text="0"></asp:Label>
                    &nbsp;&nbsp;&nbsp; Batch No:
                    <asp:Label ID="LabelBatchNumber" runat="server" Font-Bold="true" Text="0"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    Payment Type:
                    <asp:Label ID="LabelType" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    Company Id:
                    <asp:Label ID="LabelCompanyId" runat="server" Text=""></asp:Label>
                    <%--( <span id="SpanComID"></span>):
                        <asp:TextBox ID="tbCompanyId" Width="100px" ToolTip="Max length 10" runat="server"
                        CssClass="textBox"></asp:TextBox>
                    <script type="text/javascript">
                        $('#tbCompanyId').limit('10', '#SpanComID');
                    </script>--%>
                </td>
            </tr>
            <tr class="evenRow">
                <td>
                    Company Name:
                    <asp:Label ID="LabelCompanyName" runat="server" Text=""></asp:Label>
                    <%--( <span id="SpanComName"></span>):
                    <asp:TextBox ID="tbCompanyName" Width="120px" ToolTip="Max length 16" runat="server"
                        CssClass="textBox"></asp:TextBox>
                    <script type="text/javascript">
                        $('#tbCompanyName').limit('16', '#SpanComName');
                    </script>--%>
                </td>
                <td>
                    Entry Desc ( <span id="SpanDesc"></span>) :
                    <asp:TextBox ID="tbDescription" ToolTip="Your description of the transaction. This may be printed on the receivers’ bank statement by the Receiving Financial Institution. (i.e. Payroll)"
                        runat="server" CssClass="textBox"></asp:TextBox>
                    <script type="text/javascript">
                        $('#tbDescription').limit('10', '#SpanDesc');
                    </script>
                </td>
                <td>
                    Discretionary Data (optional) ( <span id="SpanDiscData"></span>) :
                    <asp:TextBox ID="tbDiscData" ToolTip="For your company’s internal use, if desired. No specific format is required. "
                        runat="server" CssClass="textBox" Width="200px"></asp:TextBox>
                    <script type="text/javascript">
                        $('#tbDiscData').limit('20', '#SpanDiscData');
                    </script>
                    <br />
                </td>
            </tr>
            <tr class="evenRow">
                <td colspan="1">
                    <asp:Button ID="ButtonAddUpdateBatch" runat="server" CssClass="buttonStyle" Text="Update Details"
                        OnClick="ButtonAddUpdateBatch_Click" />
                </td>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
            <Columns>
                <asp:BoundField DataField="EdrOutId" HeaderText="Item ID" />
                <asp:BoundField DataField="TraceNumber" HeaderText="Trace Number" ItemStyle-Wrap="False" />
                <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                <asp:BoundField DataField="AccountFrom" HeaderText="Sender A/C" />
                <asp:BoundField DataField="AmountDr" HeaderText="Debit" />
                <asp:BoundField DataField="AmountCr" HeaderText="Credit" />
                <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                <asp:BoundField DataField="DfiAccountNumber" HeaderText="Recv A/C" />
                <asp:BoundField DataField="ReceivingBankRt" HeaderText="Bank" />
                <asp:BoundField DataField="ReceiverId" HeaderText="Receiver ID" />
                <asp:BoundField DataField="ReceiverName" HeaderText="Receiver Name" />
                <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:HiddenField ID="hdEdrOutId" runat="server" Value='<%# Eval("EdrOutId") %>' />
                        <asp:LinkButton ID="LinkButtonRm" runat="server" OnClick="EditItem">Edit Item</asp:LinkButton>
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
        <br />
        <fieldset id="FsRemakeForm" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="Label4" runat="server" Text="Item Info"></asp:Label>
                &nbsp;<asp:Image AlternateText="Help" ID="Image3" ImageUrl="~/media/images/help.png"
                    Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
            </legend>
            <table width="98%" class="dataEntryTable" cellpadding="2" cellspacing="0">
                <tr class="oddRow">
                    <td>
                        ID:
                        <asp:Label ID="labelItemID" runat="server" Font-Size="12px" Text="0"></asp:Label>
                    </td>
                    <td>
                        Trace:
                        <asp:Label ID="labelTrace" runat="server" Font-Size="12px" Text="0"></asp:Label>
                    </td>
                    <td>
                        &nbsp;Recv Bank
                    </td>
                    <td>
                        <asp:TextBox ID="tbReceiveBankBranch" Width="220px" ToolTip="" runat="server" CssClass="textBox"></asp:TextBox>
                        &nbsp;<input type="button" onclick="showPopUp();" value="..." />
                        &nbsp;Trx Type
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlTransectionType" Width="180px" runat="server" CssClass="dropDown">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr class="evenRow">
                    <td>
                        Recv A/C ( <span id="clAC"></span>)
                    </td>
                    <td>
                        <asp:TextBox ID="tbRcvAccountNum" runat="server" MaxLength="17" CssClass="textBox"></asp:TextBox>
                    </td>
                    <td>
                        Amount
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="tbAmount" runat="server" onblur="javascript:return OnFocusOutForm()"
                            CssClass="textBox"></asp:TextBox>
                        &nbsp;
                        <asp:Label ID="labelAmountWord" runat="server" Font-Size="12px" Text=""></asp:Label>
                    </td>
                </tr>
                <tr class="oddRow">
                    <td>
                        Receiver ID ( <span id="clRecvID"></span>)
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="tbRcvId" MaxLength="15" runat="server" CssClass="textBox"></asp:TextBox>
                    </td>
                    <td>
                        Receiver Name
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="tbRcvName" runat="server" Width="280px" MaxLength="22" CssClass="textBox"></asp:TextBox>
                        &nbsp; CCD=22 ,CIE=15 ,CTX=16, PPD=22
                    </td>
                </tr>
                <tr class="evenRow">
                    <td>
                        Payment Info ( <span id="clPmtInfo"></span>)
                    </td>
                    <td colspan="5">
                        <asp:TextBox ID="tbPaymentInfo" runat="server" Width="450px" CssClass="textBox"></asp:TextBox>
                        &nbsp; Optional. Details Info of payment.
                    </td>
                </tr>
                <tr class="oddRow">
                <td>
                    Sender A/C (
                    <asp:Label runat="server" ID="lbMaxSenderAcc" Text="0"></asp:Label>
                    )
                </td>
                <td colspan="1">
                    <asp:Label ID="LabelSenderAcc" runat="server" Text=""></asp:Label>
                    <%--<asp:TextBox ID="tbSenderAcc" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>--%>
                </td>
                <td>
                    Sender Name (
                    <asp:Label runat="server" ID="lbMaxSenderName" Text="0"></asp:Label>
                    )
                </td>
                <td colspan="2">
                    <asp:Label ID="LabelSenderName" runat="server" Text=""></asp:Label>
                    <%--<asp:TextBox ID="tbSenderName" Width="400px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>--%>
                </td>
            </tr>
                <tr class="evenRow">
                    <td colspan="6">
                        <asp:Button ID="btUpdateItem" runat="server" Text="Update Item" CssClass="buttonStyle"
                            OnClick="btUpdateItem_Click" />
                        &nbsp;
                        <asp:Button ID="btClose" runat="server" Text="Close" CssClass="buttonStyle" OnClick="btClose_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
        <br />
        <asp:Button ID="ButtonUpdateBatch" runat="server" CssClass="buttonStyle" Text="Remake Done"
            OnClick="ButtonUpdateBatch_Click" />
        &nbsp;<asp:Button ID="ButtonUnlockBatch" runat="server" CssClass="buttonStyle" Text="Unlock Batch"
            Visible="false" OnClick="ButtonUnlockBatch_Click" />
        <asp:Panel runat="server" ID="PanelConfirmation" CssClass="messageBox">
            <asp:Label Text="This Batch will be Sent to Checker. Are you sure?" ID="label2" runat="server"></asp:Label>
            &nbsp;
            <asp:Button ID="ButtonYes" runat="server" CssClass="buttonStyle70" Text="Yes" OnClick="ButtonYes_Click" />
            &nbsp;
            <asp:Button ID="ButtonNo" runat="server" CssClass="buttonStyle70" Text="No" OnClick="ButtonNo_Click" />
        </asp:Panel>
    </fieldset>
</asp:Content>
