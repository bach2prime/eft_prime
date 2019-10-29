<%@ Page Title="Inward: Check" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CheckItemFinal170.aspx.cs" Inherits="EFT_Proj.Inward.CheckItemFinal170" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="../Scripts/Inward/inward.make.js" />
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="downloadICE" runat="server">
        <ContentTemplate>
            <div id="divEFTItemList" runat="server">
                <asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID"
                    AppendDataBoundItems="true">
                    <asp:ListItem Value="0">All Branches</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                <asp:DropDownList ID="ddTransactionType" runat="server">
                </asp:DropDownList>
                &nbsp
                <asp:DropDownList ID="ddlSession" runat="server" Font-Names="Segoe UI" Font-Size="8pt"/>
                &nbsp;
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
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
                    <b>Inward Items for Checker</b>
                    <%--and Inward Dishonored Returns--%></h4>
                <asp:GridView ID="gridviewTxList" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowCustomPaging="True" PageSize="50"
                    ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" OnRowDataBound="gridviewItems_RowDataBound">
                    <Columns>
                        <asp:TemplateField>
                            <ItemStyle Width="15px" />
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="creditMultiChecker" AutoPostBack="true" OnCheckedChanged="chkRow_CheckedChanged" />
                                <asp:HiddenField ID="creditMultiCheckerHidden" runat="server" Value='<%# Eval("EdrInId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                        <asp:BoundField DataField="FtNo" HeaderText="CBS Ref" />
                        <asp:BoundField DataField="EdrInId" HeaderText="ID" />
                        <asp:BoundField DataField="ItemTypeStr" HeaderText="Type" />
                        <asp:BoundField DataField="TraceNumber" HeaderText="Trace No" />
                        <%--<asp:BoundField DataField="SettlementDate" HeaderText="Settlement Date" DataFormatString="{0:dd MMM yyyy}" />--%>
                        <asp:BoundField DataField="OrigBank" HeaderText="From" />
                        <%--<asp:BoundField DataField="CompanyName" HeaderText="Company" />--%>
                        <asp:BoundField DataField="AmountCr" HeaderText="AmountCr" />
                        <asp:BoundField DataField="AmountDr" HeaderText="AmountDr" />
                        <asp:BoundField DataField="CurrencyStr" HeaderText="Currency" />
                        <asp:BoundField DataField="AccountTitle" HeaderText="A/C Title" />
                        <asp:BoundField DataField="DfiAccountNumber" HeaderText="A/C" />
                        <asp:BoundField DataField="TransactionCode" HeaderText="Tx Code" />
                        <asp:BoundField DataField="StatusStr" HeaderText="Status" />
                        <asp:BoundField DataField="ErrorMessage" HeaderText="Error Message" />
                        <asp:TemplateField>
	                        <ItemTemplate>
		                        <a href="CheckItemProcessFinal<%# Eval("BankCode") %>.aspx?edrId=<%# Eval("EdrInId") %>&inout=edrin" target="_blank">Process</a>
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

                <asp:Panel runat="server" id="MultipleCreditHonorSection">
                    <br />

                    <asp:RadioButton ID="RadioButton2" Checked="true" runat="server" Text="None" GroupName="Software"
                        AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />
                     <asp:RadioButton ID="RadioButton1" runat="server" Text="All" GroupName="Software"
                        AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" ID="CreditBulkHonor" CssClass="buttonStyle" OnClientClick="return window.confirm('Are you sure to Honor the selected items?');"
                    OnClick="CreditBulkHonor_Click" Text="Honor" />
                </asp:Panel>
            </div>
            <div style="display: none">
                <asp:LinkButton ID="PostBack" runat="server" OnClick="refreshList">Refresh</asp:LinkButton>
            </div>

            <asp:UpdateProgress AssociatedUpdatePanelID="downloadICE" ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div id="progressBackgroundFilter">
                    </div>
                    <div id="processMessage">
                        <div style="margin: auto; width: 40px">
                            <img alt="Busy..." width="32px" src="../media/images/loader.gif" />
                        </div>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
