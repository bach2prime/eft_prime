<%@ Page Title="EFT Outward: Excel" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="OutwardEftExcel.aspx.cs" Inherits="EFT_Proj.Outward.OutwardEftExcel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td style="width: 80%" valign="top">
                <fieldset class="formBoxGV">
                    <legend>
                        <asp:Label ID="Label4" runat="server" Text="Select Excel File"></asp:Label>
                    </legend>
                    <asp:DropDownList ID="ddlCurrency" runat="server" Font-Names="Segoe UI" Font-Size="9pt">
                    </asp:DropDownList>
                    <asp:FileUpload ID="FileUploadExcel" runat="server" Width="307px" />
                    <asp:Button ID="btParseXlsFile" runat="server" Text="Parse File" CssClass="buttonStyle"
                        OnClick="btParseXlsFile_Click" OnClientClick="loading()" />
                    <span style="width: 120px; margin-left: 100px"><a href="../media/sample.xls">Sample
                        Excel File</a> </span>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td style="width: 80%" valign="top">
                <fieldset class="formBoxGV">
                    <legend>
                        <asp:Label ID="Label1" runat="server" Text="Batch Info"></asp:Label>
                        &nbsp;<asp:Image AlternateText="Help" ID="Image2" ImageUrl="~/media/images/help.png"
                            Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
                    </legend>
                    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                    </asp:Panel>
                    <table style="width: 100%" cellpadding="4" cellspacing="0" class="dataEntryTable">
                        <tr class="evenRow">
                            <td>
                                Payment Type:
                                <%--<asp:DropDownList ID="eftApplicationType" runat="server" AutoPostBack="false">
                                </asp:DropDownList>--%>
                                <asp:Label ID="lbEftApplicationType" runat="server"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp; Service Class:
                                <asp:Label ID="lbServiceClass" runat="server"></asp:Label>
                                <%--<asp:DropDownList ID="DropDownListServiceClass" runat="server">
                                    <asp:ListItem Text="Credit" Value="220"></asp:ListItem>
                                    <asp:ListItem Text="Debit" Value="225"></asp:ListItem>
                                    <asp:ListItem Text="Mixed" Value="200"></asp:ListItem>
                                </asp:DropDownList>--%>
                            </td>
                            <td>
                                Effective Entry Date&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                Company Id ( <span id="SpanComID">10</span>)
                                <script type="text/javascript">
                                    //$('#tbCompanyId').limit('10', '#SpanComID');
                                </script>
                                &nbsp;&nbsp;
                                <asp:TextBox CssClass="textBox" ID="tbCompanyId" Width="100px" ToolTip="Max length 10"
                                    runat="server"></asp:TextBox>
                                &nbsp;
                                <%--<asp:LinkButton ID="ButtonCustomer" runat="server" OnClick="ButtonCustomer_Click">Details</asp:LinkButton>--%>
                            </td>
                            <td>
                                Company Name ( <span id="SpanComName">16</span>)
                                <script type="text/javascript">
                                    //$('#tbCompanyName').limit('16', '#SpanComName');
                                </script>
                                &nbsp;&nbsp;
                                <asp:TextBox ID="tbCompanyName" Width="120px" ToolTip="Max length 16" runat="server"
                                    CssClass="textBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td>
                                Entry Desc ( <span id="SpanDesc">10</span>)
                                <script type="text/javascript">
                                    //$('#tbDescription').limit('10', '#SpanDesc');
                                </script>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="tbDescription" ToolTip="Your description of the transaction. This may be printed on the receivers’ bank statement by the Receiving Financial Institution. (i.e. Payroll)"
                                    runat="server" CssClass="textBox"></asp:TextBox>
                            </td>
                            <td>
                                Discretionary Data ( <span id="SpanDiscData">20</span>)
                                <script type="text/javascript">
                                    //$('#tbDiscData').limit('20', '#SpanDiscData');
                                </script>
                                <asp:TextBox ID="tbDiscData" ToolTip="For your company’s internal use, if desired. No specific format is required. "
                                    runat="server" CssClass="textBox" Width="200px"></asp:TextBox>(optional)
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                               <%-- Batch ID:
                                <asp:Label ID="LabelSelectedBatchID__" runat="server" Font-Bold="true" Text="0"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp; Items:
                                <asp:Label ID="LabelItemCount" Font-Bold="true" runat="server" Text="0"></asp:Label>--%>
                                <asp:Label ID="LabelCurrency" Font-Bold="true" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <fieldset class="formBoxGV">
        <legend>
            <asp:Label ID="Label2" runat="server" Text="Item List"></asp:Label>
            &nbsp;<asp:Image AlternateText="Help" ID="Image3" ImageUrl="~/media/images/help.png"
                Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
        </legend>
        <table width="100%" class="dataEntryTable" cellpadding="4" cellspacing="0">
            <tr class="evenRow">
                <td>
                    <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" OnRowDataBound="gridviewItems_RowDataBound"
                        ShowFooter="True">
                        <Columns>
                            <%--<asp:BoundField DataField="EdrOutId" HeaderText="Item ID" />
                            <asp:BoundField DataField="TraceNumber" HeaderText="Trace Number" ItemStyle-Wrap="False" />--%>
                            <asp:BoundField DataField="ReceivingBankRt" HeaderText="Bank" />
                            <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                            <asp:BoundField DataField="DfiAccountNumber" HeaderText="Account" />
                            <asp:BoundField DataField="AmountDr" HeaderText="Debit">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AmountCr" HeaderText="Credit">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ReceiverId" HeaderText="Receiver ID" />
                            <asp:BoundField DataField="ReceiverName" HeaderText="Receiver Name" />
                            <asp:BoundField DataField="SenderName" HeaderText="Sender Name" />
                            <asp:BoundField DataField="SenderAcc" HeaderText="Sender Acc" />
                            <%--<asp:BoundField DataField="AdviceNo" HeaderText="Advice No" />--%>
                            <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                        </Columns>
                        <FooterStyle BackColor="#6FA7D1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                        <SelectedRowStyle CssClass="SelectedRowStyle" />
                        <HeaderStyle CssClass="HeaderStyleDark" />
                        <RowStyle CssClass="RowStyle" />
                        <EditRowStyle CssClass="EditRowStyle" />
                        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr class="evenRow">
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="evenRow">
                <td>
                    <asp:Button ID="BtInsertItems" runat="server" Text="Insert Items" CssClass="buttonStyle"
                        OnClick="ButtonYes_Click" OnClientClick="return ConfirmAndLoading('This Batch will be sent to checker. Are you sure?');" />
                </td>
            </tr>
        </table>
        <%--<asp:Button ID="ButtonCloseBatch" runat="server" CssClass="buttonStyle" Text="Close Batch"
            OnClick="ButtonCloseBatch_Click" />--%>
        <%--<asp:Panel runat="server" ID="PanelConfirmation" CssClass="messageBox">
            <asp:Label Text="This Batch will be sent to checker. Are you sure?" ID="label3" runat="server"></asp:Label>
            &nbsp;
            <asp:Button ID="ButtonYes" runat="server" CssClass="buttonStyle70" Text="Yes" OnClick="ButtonYes_Click" OnClientClick="loading()" />
            &nbsp;
            <asp:Button ID="ButtonNo" runat="server" CssClass="buttonStyle70" Text="No" OnClick="ButtonNo_Click" OnClientClick="loading()" />
        </asp:Panel>--%>
    </fieldset>
    <div>
        <br />
        <div id="load" style="visibility: hidden">
            <div id="progressBackgroundFilter">
            </div>
            <div id="processMessage">
                <div style="margin: auto; width: 120px">
                    <img alt="Busy..." width="120px" src="../media/images/103.gif" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
