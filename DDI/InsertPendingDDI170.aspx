<%@ Page Title="DDI: Pending" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="InsertPendingDDI170.aspx.cs" Inherits="EFT_Proj.DDI.InsertPendingDDI170" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #PendingItemCountLbl {
            font-size: large;
            font-weight: bold;
            color: blue;
        }
    </style>

    <script type="text/javascript">
        function ShowConfirmation() {
            if (window.confirm('Are you willing to insert the pending items?')) {
                loading();
                return true;
            }
            return false;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>

    <div style="width: 100%">
        <fieldset id="Fieldset1" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="Label2" runat="server" Text="Pending DDI Items"></asp:Label>
            </legend>
            
            <table cellpadding="10">
                <tr>
                    <td>
                        <asp:DropDownList ID="DDBranchPending" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                            AppendDataBoundItems="true">
                        </asp:DropDownList>
                    </td>
                    <td>Pending Count : &nbsp;
                        <asp:Label runat="server" ID="PendingItemCountLbl" Text="" />
                    </td>

                    <td>
                        <asp:Button CssClass="buttonStyle" ID="PendingItemBtn" runat="server" Text="Get Pending Items"
                            OnClientClick="loading()" OnClick="PendingItemBtn_Click" />

                        &nbsp;&nbsp;

                        <asp:Button CssClass="buttonStyle" ID="DDIItemInsertBtn" runat="server" Text="Insert Pending DDI"
                            OnClientClick="if(!ShowConfirmation()) return false;" OnClick="DDIItemInsertBtn_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>

        <br />

        <fieldset id="freeBatches" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="LabelBank" runat="server" Text="Pending Items"></asp:Label></legend>

            <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="DDIBatchOutIdFK" HeaderText="DDI Batch Id" />
                    <asp:BoundField DataField="DDIOutId" HeaderText="Item ID" />
                    <asp:BoundField DataField="TraceNumber" HeaderText="Trace Number" ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                    <asp:BoundField DataField="AccountFrom" HeaderText="Sender A/C" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                    <asp:BoundField DataField="DfiAccountNumber" HeaderText="Recv A/C" />
                    <asp:BoundField DataField="ReceivingBankRt" HeaderText="Bank" />
                    <asp:BoundField DataField="ReceiverId" HeaderText="Receiver ID" />
                    <asp:BoundField DataField="ReceiverName" HeaderText="Receiver Name" />
                    <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                    <asp:BoundField DataField="AdviceNo" HeaderText="Advice No" />
                </Columns>
                <FooterStyle BackColor="#6FA7D1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                <SelectedRowStyle CssClass="SelectedRowStyle" />
                <HeaderStyle CssClass="HeaderStyleDark" />
                <RowStyle CssClass="RowStyle" />
                <EditRowStyle CssClass="EditRowStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            </asp:GridView>
        </fieldset>
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
