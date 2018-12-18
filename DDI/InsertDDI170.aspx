<%@ Page Title="DDI: Data Entry" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="InsertDDI170.aspx.cs" Inherits="EFT_Proj.DDI.InsertDDI170" %>

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

        $(document).ready(function () {
            $('#tbCompanyId').limit('10', '#SpanComID');
            $('#tbCompanyName').limit('16', '#SpanComName');
            $('#tbDescription').limit('10', '#SpanDesc');
            $('#tbDiscData').limit('20', '#SpanDiscData');
            $('#tbRcvAccountNum').limit('17', '#clAC');
            $('#tbRcvId').limit('15', '#clRecvID');
            $('#tbPaymentInfo').limit('80', '#clPmtInfo');
            //$('#tbRcvName').limit('22', '#clRecvName');

            var val = $('#SenderAccTracer').val();
            console.log(val);
            if (val == 1) {
                $('#tbSenderAcc').attr('readonly', true);
                $('#FetchSenderInfoBtn').attr('disabled', true);
            }
            else {
                $('#tbSenderAcc').attr('readonly', false);
                $('#FetchSenderInfoBtn').removeAttr('disabled');
            }

        });

        function loadSenderInfo() {
            var accountNumber = $("#tbSenderAcc").val();
            var currency = $("#ddlCurrency").val();

            if (accountNumber) {
                $.ajax({
                    type: "POST",
                    url: "InsertDDI170.aspx/GetSenderInfoByAccNum",
                    data: JSON.stringify({ "accountNum": accountNumber, "currencyCode": currency }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    cache: false,
                    success: function (response) {
                        if (response.d) {
                            var stringyfyData = $.parseJSON(response.d);
                            if (!$.isEmptyObject(stringyfyData)) {
                                $('#tbSenderName').val(stringyfyData.SenderName);
                                $('#lblAvailableBalance').text('Balance: ' + stringyfyData.SenderBalance);
                                $('#tbSenderEmail').text(stringyfyData.SenderEmail);
                            }
                            else {
                                //$('#tbSenderName').val('');
                                //$('#lblAvailableBalance').text('');
                                //$('#tbSenderEmail').text('');
                                alert("No info found for the Account Number and Company Id.");
                            }
                        }
                        else {
                            //$('#tbSenderName').val('');
                            //$('#lblAvailableBalance').text('');
                            //$('#tbSenderEmail').text('');
                            alert("No info found for the Account Number and Company Id.");
                        }
                    },
                    error: function (response) {
                        //$('#tbSenderName').val('');
                        //$('#lblAvailableBalance').val('');
                        //$('#tbSenderEmail').text('');
                        alert("Problem in fetching Sender info.");
                    }
                });
            }
            else {
                alert("Please Provide an Account Number.");
            }
        }

    </script>

    <style type="text/css">
        .InlineBlock { display: inline-block; }

        #rblFrequency{
            margin-bottom: -8px;
        }

        .aspNetDisabled, input:disabled:hover, input:read-only {
            cursor: not-allowed;
        }

        #lblAvailableBalance {
            color: blue;
            text-align: left;
            font-weight: normal;
            padding-left: inherit;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <%--<input runat="server" type="hidden" id="SenderAccTracer" value="1" />--%>

    <asp:HiddenField ID="SenderAccTracer" Value="0" ClientIDMode="Static" runat="server" />

    <asp:Panel runat="server" ID="BatchInfoPanel">
        <table cellpadding="4" cellspacing="0" width="100%">
            <tr>
                <td style="width: 80%" valign="top">
                    <fieldset class="formBoxGV">
                        <legend>
                            <asp:Label ID="Label1" runat="server" Text="Batch Info"></asp:Label>
                            &nbsp;<asp:Image AlternateText="Help" ID="Image2" ImageUrl="~/media/images/help.png"
                                Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
                        </legend>
                        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                            <asp:Label Text="Error" ID="labelError" runat="server" Font-Bold="True"></asp:Label>
                        </asp:Panel>
                        <table style="width: 100%" cellpadding="4" cellspacing="0" class="dataEntryTable">
                            <tr class="evenRow">
                                <td>
                                    <asp:DropDownList ID="ddlCurrency" runat="server" Font-Names="Segoe UI" Font-Size="9pt">
                                    </asp:DropDownList>
                                    &nbsp;&nbsp; Payment Type&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="eftApplicationType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListServiceClass_SelectedIndexChanged">
                                </asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="DropDownListServiceClass" runat="server" AutoPostBack="true" Enabled="false">
                                    <%--<asp:ListItem Text="Credit" Value="220"></asp:ListItem>--%>
                                    <asp:ListItem Text="Debit" Value="225"></asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>

                            <tr class="oddRow">
                                <td>Company Id ( <span id="SpanComID">10</span>) &nbsp;&nbsp;
                                <asp:TextBox ID="tbCompanyId" Width="100px" ToolTip="Max length 10" runat="server"
                                    CssClass="textBox" MaxLength="10" Text=""></asp:TextBox>
                                </td>
                                <td>Company Name ( <span id="SpanComName">16</span>) &nbsp;&nbsp;
                                <asp:TextBox ID="tbCompanyName" Width="120px" ToolTip="Max length 16" runat="server"
                                    CssClass="textBox" MaxLength="16"></asp:TextBox>
                                </td>
                            </tr>

                            <tr class="evenRow">
                                <td>Entry Desc ( <span id="SpanDesc">10</span>) &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="tbDescription" ToolTip="Your description of the transaction. This may be printed on the receivers’ bank statement by the Receiving Financial Institution. (i.e. Payroll)"
                                    runat="server" CssClass="textBox" MaxLength="10"></asp:TextBox>
                                </td>
                                <td>Discretionary Data ( <span id="SpanDiscData">20</span>)
                                <asp:TextBox ID="tbDiscData" ToolTip="For your company’s internal use, if desired. No specific format is required. "
                                    runat="server" CssClass="textBox" Width="200px" MaxLength="20"></asp:TextBox>(optional)
                                </td>
                            </tr>

                            <tr class="oddRow">
                                <td colspan="2"><span class="InlineBlock" style="padding-bottom: 8px">Frequency&nbsp;&nbsp;</span>
                                    <asp:RadioButtonList ID="rblFrequency" CssClass="InlineBlock" runat="server" RepeatDirection="Horizontal">
                                    </asp:RadioButtonList>
                                </td>
                            </tr>

                            <tr class="evenRow">
                                <td>Effective Date&nbsp;&nbsp;&nbsp;
	                                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                            TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>
                                    <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                                </td>



                                <td>Valid Till Date&nbsp;&nbsp;&nbsp;
	                                <asp:TextBox ID="tbsettTillDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image5"
                                            TargetControlID="tbsettTillDate" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>
                                    <asp:Image ID="Image5" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                                </td>
                            </tr>

                            <tr class="oddRow">
                                <td>Batch ID:
                                <asp:Label ID="LabelSelectedBatchID" runat="server" Font-Bold="true" Text="0"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp; Items:
                                <asp:Label ID="LabelItemCount" Font-Bold="true" runat="server" Text="0"></asp:Label>
                                </td>
                                <td>&nbsp;&nbsp;
                                </td>
                            </tr>

                            <tr class="evenRow">
                                <td colspan="4">
                                    <asp:Button ID="CreateBatchBtn" runat="server" Text="Create Batch" CssClass="buttonStyle"
                                        OnClick="btCreateBatch_Click" OnClientClick="loading()" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel runat="server" ID="SenderReceiverInfoPanel" Enabled="false">

        <fieldset class="formBoxGV">
            <legend>
                <asp:Label ID="Label4" runat="server" Text="Sender Info"></asp:Label>
                &nbsp;<asp:Image AlternateText="Help" ID="Image4" ImageUrl="~/media/images/help.png"
                    Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
            </legend>
            <table width="100%" class="dataEntryTable" cellpadding="4" cellspacing="0">
                <tr class="evenRow">
                    <td colspan="2">Optional Fields
                    </td>
                    <td colspan="2">&nbsp;
                    </td>
                </tr>
                <tr class="oddRow">
                    <td>
                        <asp:Label runat="server" ID="lbMaxSenderAcc" Text="0"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbSenderAcc" Width="220px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                        &nbsp;
                    <asp:Button runat="server" ID="FetchSenderInfoBtn" OnClientClick="loadSenderInfo(); return false;" Text="Fetch Sender Info" class="buttonStyle" />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lbMaxSenderName" Text="0"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="tbSenderName" Width="220px" runat="server" CssClass="textBox" MaxLength="0"></asp:TextBox>
                    </td>
                </tr>
                <tr class="evenRow">
                    <td>Payment Info ( <span id="clPmtInfo"></span>)
                    </td>
                    <td>
                        <asp:TextBox ID="tbPaymentInfo" runat="server" Width="220px" CssClass="textBox"></asp:TextBox>
                    </td>

                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="tbSenderEmail" runat="server" Width="220px" CssClass="textBox" MaxLength="100"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </fieldset>

        <fieldset class="formBoxGV">
            <legend>
                <asp:Label ID="Label2" runat="server" Text="Receiver Info"></asp:Label>
                &nbsp;<asp:Image AlternateText="Help" ID="Image3" ImageUrl="~/media/images/help.png"
                    Width="18px" runat="server" ToolTip="(5) = 5 chars left. Optional fields may be blank" />
            </legend>
            <table width="100%" class="dataEntryTable" cellpadding="4" cellspacing="0">
                <tr class="oddRow">
                    <td>Recv Branch RT
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:DropDownList CssClass="dropDown" AutoPostBack="true" Width="250px" ID="DropDownListBank"
                                    runat="server" OnSelectedIndexChanged="DropDownListBank_SelectedIndexChanged" />
                                &nbsp; Branch:&nbsp;
                            <asp:DropDownList Width="220px" CssClass="dropDown" DataTextField="NameAndRt" DataValueField="RoutingNo"
                                ID="DropDownListBranch" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownListBranch_SelectedIndexChanged" />
                                <asp:Label ID="labelDist" runat="server" Text=""></asp:Label>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownListBank" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="DropDownListBranch" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td>Trx Code
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTransectionType" runat="server" CssClass="dropDown" Width="220">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr class="evenRow">
                    <td colspan="1">Recv A/C ( <span id="clAC"></span>)
                    </td>
                    <td id="ReceiverAccColumn">
                        <asp:TextBox ID="tbRcvAccountNum" Width="220px" runat="server" MaxLength="17" CssClass="textBox"></asp:TextBox>
                    </td>
                    <td>Amount
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="tbAmount" Width="220px" runat="server" onblur="javascript:return OnFocusOutForm()"
                            CssClass="textBox" MaxLength="13"></asp:TextBox>
                        <asp:Label ID="lblAvailableBalance" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="labelAmountWord" runat="server" Font-Size="12px" ForeColor="#0B647D"></asp:Label>
                    </td>
                </tr>
                <tr class="oddRow">
                    <td>Receiver ID ( <span id="clRecvID"></span>)
                    </td>
                    <td>
                        <asp:TextBox ID="tbRcvId" runat="server" Width="220px" CssClass="textBox" MaxLength="15"></asp:TextBox>
                    </td>
                    <td>Receiver Name
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="tbRcvName" Width="220px" runat="server" CssClass="textBox" MaxLength="22"></asp:TextBox>
                        &nbsp; CCD=22 ,CIE=15 ,CTX=16, PPD=22
                    </td>
                </tr>

                <tr class="evenRow">
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="tbReceiverEmail" runat="server" Width="220px" CssClass="textBox" MaxLength="100"></asp:TextBox>
                    </td>
                </tr>

                <tr class="evenRow">
                    <td colspan="4">
                        <asp:Button ID="btCreateItem" runat="server" Text="Add to Batch" CssClass="buttonStyle"
                            OnClick="btCreateItem_Click" OnClientClick="loading()" />

                        <asp:Panel runat="server" ID="updateBtnsPanel" Visible="false">
                            <asp:Button ID="btUpdateItem" runat="server" Text="Update to Batch" CssClass="buttonStyle"
                                OnClick="btnUpdateItem_Click" OnClientClick="loading()" />
                            &nbsp;

                        <asp:Button ID="btnCancelUpdateItem" runat="server" Text="Cancel Update" CssClass="buttonStyle"
                            OnClick="btnCancelUpdateItem_Click" OnClientClick="loading()" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr class="evenRow">
                    <td colspan="4">
                        <asp:Panel runat="server" ID="PanelDeleteItem" CssClass="messageBox" Visible="False">
                            <asp:HiddenField ID="DeletedItemId" runat="server" />
                            <asp:Label Text="This item will be deleted from this batch. Are you sure?" ID="labelDeleteItem"
                                runat="server"></asp:Label>
                            &nbsp;
                        <asp:Button ID="ButtonDeleteItemYes" runat="server" CssClass="buttonStyle70" Text="Yes"
                            OnClick="ButtonDeleteItemYes_Click" />
                            &nbsp;
                        <asp:Button ID="ButtonDeleteItemNo" runat="server" CssClass="buttonStyle70" Text="No"
                            OnClick="ButtonDeleteItemNo_Click" />
                        </asp:Panel>

                        <asp:Panel runat="server" ID="PanelEditItem" CssClass="messageBox" Visible="False">
                            <asp:HiddenField ID="EditItemId" runat="server" />
                            <asp:Label Text="Are you sure want to edit?" ID="labelEditItem"
                                runat="server"></asp:Label>
                            &nbsp;
                        <asp:Button ID="ButtonEditItemYes" runat="server" CssClass="buttonStyle70" Text="Yes"
                            OnClick="ButtonEditItemYes_Click" />
                            &nbsp;
                        <asp:Button ID="ButtonEditItemNo" runat="server" CssClass="buttonStyle70" Text="No"
                            OnClick="ButtonEditItemNo_Click" />
                        </asp:Panel>

                        <asp:GridView ID="gridviewItems" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" DataKeyNames="DDIOutId"
                            OnRowDeleting="gridviewItems_RowDeleting" OnRowCommand="gridviewItems_RowCommand" ShowFooter="True" OnRowDataBound="gridviewItems_RowDataBound">
                            <Columns>
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
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="GridItemEditBtn" runat="server" Text="Edit" CommandName="gridviewItems_RowCommand" CommandArgument='<%# Eval("DDIOutId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
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
                    <td colspan="4"></td>
                </tr>
            </table>
            <asp:Button ID="ButtonCloseBatch2" runat="server" CssClass="buttonStyle" Text="Close Batch"
                OnClick="ButtonYes_Click" OnClientClick="return ConfirmAndLoading('This Batch will be sent to checker. Are you sure?')" Visible="False" />
            &nbsp;
        <asp:Button ID="ButtonCancelBatch" runat="server" CssClass="buttonStyle" Text="Cancel Batch"
            OnClick="ButtonCancel_Click" OnClientClick="return ConfirmAndLoading('Batch will be deleted. Are you sure?')" Visible="False" />
        </fieldset>
    </asp:Panel>

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
