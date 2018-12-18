<%@ Page Title="EFT Outward: Excel" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="OutwardEftExcel140.aspx.cs" Inherits="EFT_Proj.Outward.OutwardEftExcel140" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/UserInterface.js"></script>
    <script type="text/javascript" src="../Scripts/amount.js"></script>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.limit-1.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#nextSigCard").click(function (e) {
                var curIndex = $("#curImgIndex").val();
                curIndex = 1 + parseInt(curIndex);

                var stringFormat = $("#hdImageUrlTemplate").val();
                var imgUrl = String.format(stringFormat, curIndex);

                $("#curImgIndex").val(curIndex);
                $("#cbsImage").attr("src", imgUrl);

                e.preventDefault();
            });

            $("#prevSigCard").click(function (e) {
                var curIndex = $("#curImgIndex").val();

                if (curIndex !== "1") {
                    curIndex = parseInt(curIndex) - 1;

                    var stringFormat = $("#hdImageUrlTemplate").val();
                    var imgUrl = String.format(stringFormat, curIndex);

                    $("#curImgIndex").val(curIndex);
                    $("#cbsImage").attr("src", imgUrl);
                }
                e.preventDefault();
            });
        });

        function OnFocusOutForm(event) {
            document.getElementById("labelAmountWord").innerHTML = toWord(document.getElementById("tbAmount").value);
        }

    </script>

    <style type="text/css">
        .aspNetDisabled, input:disabled:hover {
            cursor: not-allowed;
        }

        .OutputDataCls {
            font-weight: bold;
        }
    </style>
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
                    &nbsp;
                    <asp:DropDownList ID="ddInsertionType" runat="server" Font-Names="Segoe UI" Font-Size="9pt">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:FileUpload ID="FileUploadExcel" runat="server" Width="307px" />
                    &nbsp;
                    <asp:Button ID="btParseXlsFile" runat="server" Text="Parse File" CssClass="buttonStyle"
                        OnClick="btParseXlsFile_Click" OnClientClick="loading()" />
                    &nbsp;
                    <asp:Button ID="btValidateXlsFile" runat="server" Text="Validate File" CssClass="buttonStyle"
                        OnClick="btnValidateXlsFile_Click" OnClientClick="loading()" />
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
                                <asp:Label CssClass="OutputDataCls" ID="lbEftApplicationType" runat="server" />
                                &nbsp;&nbsp;&nbsp;&nbsp; Service Class:
                                <asp:Label CssClass="OutputDataCls" ID="lbServiceClass" runat="server" />
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
                                &nbsp;&nbsp;
                                <asp:Label CssClass="OutputDataCls" ID="tbCompanyId" runat="server" />
                            </td>
                            <td>
                                Company Name ( <span id="SpanComName">16</span>)
                                &nbsp;&nbsp;
                                <asp:Label CssClass="OutputDataCls" ID="tbCompanyName" runat="server" />
                            </td>
                        </tr>
                        <tr class="evenRow">
                            <td>
                                Entry Desc ( <span id="SpanDesc">10</span>)
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label CssClass="OutputDataCls" ID="tbDescription" runat="server" />
                            </td>
                            <td>
                                Discretionary Data ( <span id="SpanDiscData">20</span>)
                                &nbsp;&nbsp;
                                <asp:Label CssClass="OutputDataCls" ID="tbDiscData" runat="server" />(optional)
                            </td>
                        </tr>
                        <tr class="oddRow">
                            <td>
                                <asp:Label ID="LabelCurrency" Font-Bold="true" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="SenderBalance" Font-Bold="true" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label runat="server" ID="LblSignature" Text="" />
                <div style="padding:5px 0px; width:50%">
                    <asp:Image runat="server" ID="cbsImage" AlternateText="Signature not available" ToolTip="Cheque Front Image"
                        BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Height="200px" Width="100%"></asp:Image>
                    <div>
                        <a href="#" id="prevSigCard">Prev</a> 
                        <a href="#" id="nextSigCard" style="padding-left:90px">Next</a>
                        <input type="hidden" id="curImgIndex" value="1" />
                        <asp:HiddenField runat="server" ID="hdImageUrlTemplate" />
                    </div>
                </div>
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
                        ShowFooter="True" OnRowCommand="gridviewItems_RowCommand">
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
                            <asp:BoundField DataField="SenderName" HeaderText="Sender Name (Excel)" />
                            <asp:BoundField DataField="SenderNameCBS" HeaderText="Sender Name (CBS)" />
                            <asp:BoundField DataField="SenderAcc" HeaderText="Sender Acc" />
                            <asp:BoundField DataField="SenderBalance" HeaderText="Balance" />
                            <%--<asp:BoundField DataField="AdviceNo" HeaderText="Advice No" />--%>
                            <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Signature" CommandName="gridviewItems_RowCommand" CommandArgument='<%# Eval("SenderAcc")%>' />
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
                    &nbsp;
                    <asp:Button ID="BtnCancelItems" runat="server" Text="Cancel Batch" CssClass="buttonStyle"
                        OnClick="BtnCancelItems_Click" OnClientClick="return ConfirmAndLoading('This Batch will be canceled. Are you sure?');" />
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
