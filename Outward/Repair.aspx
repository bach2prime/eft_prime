<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Repair.aspx.cs" Inherits="EFT_Proj.Outward.Repair" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    Search Outward Batch by ID&nbsp;
    <asp:TextBox ID="TextBatchIdFind" Width="80px" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <!--OR&nbsp;&nbsp;&nbsp; Batch No: <asp:TextBox ID="TextBatchNoFind" Width="190px" runat="server"></asp:TextBox>-->
    &nbsp;<asp:Button ID="ButtonFind" CssClass="buttonStyle" runat="server" Text="Search"
        OnClick="ButtonFind_Click" />
    <table cellpadding="15">
        <tr>
            <td style="width: 50%">
                <h4>
                    Batch Info</h4>
                <table width="100%" cellpadding="5" cellspacing="0">
                    <tr class="rowAlter">
                        <td>
                            ID :
                            <asp:Label ID="LabelBatchId" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="3">
                            Batch No: <b>
                                <asp:Label ID="LabelBatchNo" runat="server" Text=""></asp:Label></b> &nbsp;&nbsp;&nbsp;
                                Items:
                            <b>
                                <asp:Label ID="LabelCount" runat="server" Text=""></asp:Label></b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Status
                        </td>
                        <td>
                            <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlStatus" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="ButtonChangeStatus" CssClass="buttonStyle" runat="server" Text="Change"
                                OnClick="ButtonChangeStatus_Click" />
                        </td>
                    </tr>
                    <tr class="rowAlter">
                        <td>
                            Locked
                        </td>
                        <td>
                            <asp:Label ID="LabelLocked" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="ButtonUnlock" CssClass="buttonStyle" runat="server" Text="Unlock"
                                OnClick="ButtonUnlock_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Effective Date
                        </td>
                        <td>
                            <asp:Label ID="LabelEffectiveDate" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextEffDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                            &nbsp;<cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy"
                                PopupButtonID="Image1" TargetControlID="TextEffDate">
                            </cc1:CalendarExtender>
                            <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                        </td>
                        <td>
                            <asp:Button ID="ButtonEffDate" CssClass="buttonStyle" runat="server" Text="Change"
                                OnClick="ButtonEffDate_Click" />
                        </td>
                    </tr>
                    <tr class="rowAlter">
                        <td>
                            Settlement Date
                        </td>
                        <td>
                            <asp:Label ID="LabelSettDate" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextSettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                            &nbsp;<cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy"
                                PopupButtonID="Image2" TargetControlID="TextSettDate">
                            </cc1:CalendarExtender>
                            <asp:Image ID="Image2" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                            &nbsp; (child)
                        </td>
                        <td>
                            <asp:Button ID="ButtonSettDate" CssClass="buttonStyle" runat="server" Text="Change"
                                OnClick="ButtonSettDate_Click" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            Delete Batch
                        </td>
                        <td>
                            (Enter Secret Code)
                        </td>
                        <td>
                            <asp:TextBox ID="TextSecretBatchId" runat="server" Text=""></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="ButtonDeleteBatch" CssClass="buttonStyle" runat="server" Enabled="false"
                                Text="Delete" OnClick="ButtonDeleteBatch_Click" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            File Name
                        </td>
                        <td>
                            <asp:Label ID="LabelFileName" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="ButtonSettDate0" CssClass="buttonStyle" runat="server" Text="Remove"
                                OnClick="ButtonRemoveFileName_Click" />
                        </td>
                    </tr>
                    <tr class="rowAlter">
                        <td style="color: Red" colspan="2">
                            Delete this Batch
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="ButtonDelete" CssClass="buttonStyle" runat="server" Text="Delete"
                                OnClick="ButtonDelete_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <h4>
                    Locked Batches</h4>
                <asp:GridView ID="gridviewOpenBatches" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled">
                    <Columns>
                        <asp:BoundField DataField="BatchOutId" HeaderText="Batch ID" />
                        <asp:BoundField DataField="BatchNumberOut" HeaderText="Batch No" />
                        <asp:BoundField DataField="UserName" HeaderText="Last User" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdBatchID" runat="server" Value='<%# Eval("BatchOutId") %>' />
                                <asp:LinkButton ID="lockbt" runat="server" OnClick="UnlockBatch">Unlock Batch</asp:LinkButton>
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
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                    <asp:Label Text="Result" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
