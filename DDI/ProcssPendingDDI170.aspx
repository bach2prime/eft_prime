<%@ Page Title="DDI: Process" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ProcssPendingDDI170.aspx.cs" Inherits="EFT_Proj.DDI.ProcssPendingDDI170" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function ShowConfirmation() {
            if (window.confirm('Are you willing to proccss the selected items for CBS?')) {
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

    <div style="width: 100%">
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
            <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
        </asp:Panel>

        <fieldset id="freeBatches" runat="server" class="formBoxGV">
            <legend>
                <asp:Label ID="LabelBank" runat="server" Text="Ready Items"></asp:Label></legend>
            <table cellpadding="10">
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                            AppendDataBoundItems="true">
                        </asp:DropDownList>
                    </td>
                    <td>Settlement Date &nbsp;&nbsp;
                        <asp:TextBox ID="sendingDateFrom" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                            TargetControlID="sendingDateFrom" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                        <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    </td>
                    <td>- &nbsp;&nbsp;
                        <asp:TextBox ID="sendingDateTo" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image2"
                            TargetControlID="sendingDateTo" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                        <asp:Image ID="Image2" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    </td>

                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Settlement Return Date &nbsp;&nbsp;
                        <asp:TextBox ID="settlementDateFrom" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" PopupButtonID="Image3"
                            TargetControlID="settlementDateFrom" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                        <asp:Image ID="Image3" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    </td>
                    <td>- &nbsp;&nbsp;
                        <asp:TextBox ID="settlementDateTo" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender4" runat="server" PopupButtonID="Image4"
                            TargetControlID="settlementDateTo" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                        <asp:Image ID="Image4" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    </td>

                    <td>
                        <asp:Button CssClass="buttonStyle" ID="ButtonGetBatches" runat="server" Text="Get DDI"
                            OnClientClick="loading()" OnClick="LoadDDIItemsClick" />
                    </td>
                </tr>
            </table>

            <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" ShowFooter="True"
                OnRowDataBound="gridviewItems_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemStyle Width="20px" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRow" runat="server" AutoPostBack="true" OnCheckedChanged="chkRow_CheckedChanged" />
                            <asp:HiddenField ID="hdEdrOutId" runat="server" Value='<%# Eval("EdrOutId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BatchOutIdFK" HeaderText="Batch Id" />
                    <asp:BoundField DataField="EdrOutId" HeaderText="Item ID" />
                    <asp:BoundField DataField="FtNo" HeaderText="CBS Ref" />
                    <asp:BoundField DataField="TraceNumber" HeaderText="Trace Number" />
                    <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                    <asp:BoundField DataField="AccountFrom" HeaderText="Sender A/C" />
                    <asp:BoundField DataField="AmountDr" HeaderText="Debit" />
                    <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                    <asp:BoundField DataField="DfiAccountNumber" HeaderText="Recv A/C" />
                    <asp:BoundField DataField="RecvBankName" HeaderText="Bank" />
                    <asp:BoundField DataField="RecvBranchName" HeaderText="Branch" />
                    <asp:BoundField DataField="ReceiverId" HeaderText="Receiver ID" />
                    <asp:BoundField DataField="ReceiverName" HeaderText="Receiver Name" ItemStyle-Width="50px" ItemStyle-Wrap="False" />
                    <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                    <asp:BoundField DataField="ErrorMsg" HeaderText="Error Message" />
                    <%--<asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdEdrOutIdCBS" runat="server" Value='<%# Eval("EdrOutId") %>' />
                            <asp:LinkButton runat="server" OnClientClick="return window.confirm('Are you willing to proccss the selected item for CBS?');" 
                                OnClick="ProcessCbsForItem_clicked">Process CBS</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
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

            <asp:RadioButton ID="RadioButton2" Checked="true" runat="server" Text="None" GroupName="Software"
                AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
            <asp:RadioButton ID="RadioButton1" runat="server" Text="All" GroupName="Software"
                AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="CallCbsForBatchItems" OnClientClick="if(!ShowConfirmation()) return false;"
                runat="server" CssClass="buttonStyle" Text="Process CBS" OnClick="CallCbsForEdrItems_Click" />
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
