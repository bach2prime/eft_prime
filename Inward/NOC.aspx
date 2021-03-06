﻿<%@ Page Title="Inward: NOC" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NOC.aspx.cs" Inherits="EFT_Proj.Inward.NOC" %>

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
                    NOC Items</h4>
                <asp:GridView ID="gridviewNoCList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="nocbt" runat="server" OnClick="GenerateAndSendNoCXml">Send NOC</asp:LinkButton>
                                <asp:HiddenField ID="nocEdrInId" runat="server" Value='<%# Eval("EdrInId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FilenameItem" HeaderText="File" />
                        <asp:BoundField DataField="ItemTypeStr" HeaderText="Type" />
                        <asp:BoundField DataField="TraceNumber" HeaderText="Trace No" />
                        <%--<asp:BoundField DataField="SettlementDate" HeaderText="Settlement Date" DataFormatString="{0:dd MMM yyyy}" />--%>
                        <asp:BoundField DataField="OrigBank" HeaderText="From" />
                        <%--<asp:BoundField DataField="CompanyName" HeaderText="Company" />--%>
                        <asp:BoundField DataField="AmountCr" HeaderText="AmountCr" />
                        <asp:BoundField DataField="AmountDr" HeaderText="AmountDr" />
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

            <asp:UpdateProgress AssociatedUpdatePanelID="downloadICE" ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div id="progressBackgroundFilter" >
                    </div>
                    <div id="processMessage">
                        <div style="margin: auto; width:40px">
                            <img alt="Busy..." width="32px" src="../media/images/loader.gif" />
                        </div>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
