<%@ Page Title="EFT:Inward Repair" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RepairIn.aspx.cs" Inherits="EFT_Proj.Inward.RepairIn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    Search Inward Items by ID&nbsp;
    <asp:TextBox ID="TextItemIdFind" runat="server"></asp:TextBox>
    &nbsp;
    <asp:Button ID="ButtonFind" CssClass="buttonStyle" runat="server" Text="Search" OnClick="ButtonFind_Click" />
    <h3>
        Batch Info</h3>
    <table width="70%" cellpadding="5" cellspacing="0">
        <tr class="rowAlter">
            <td>
                ID :
                <asp:Label ID="LabelItemId" runat="server" Text=""></asp:Label>
            </td>
            <td>
                Trace No: <b>
                    <asp:Label ID="LabelTraceNo" runat="server" Text=""></asp:Label></b>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Amount:
                <asp:Label ID="LabelAmount" runat="server" Text=""></asp:Label>
            </td>
            <td>
                A/C:&nbsp; 
                <asp:Label ID="LabelAcc" runat="server" Text=""></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr class="rowAlter">
            <td>
                Name: </td>
            <td>
                <asp:Label ID="LabelName" runat="server" Text=""></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Effective Date
            </td>
            <td>
                <asp:Label ID="LabelEffectiveDate" runat="server" Text=""></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="rowAlter">
            <td>
                Settlement Date
            </td>
            <td>
                <asp:TextBox ID="TextSettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                <asp:Image ID="Image2" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="Image2"
                    TargetControlID="TextSettDate">
                </cc1:CalendarExtender>
            </td>
            <td>
                <asp:Button ID="ButtonSettDate" CssClass="buttonStyle" runat="server" Text="Change"
                    OnClick="ButtonChange_Click" />
            </td>
        </tr>
       <%-- <tr>
            <td>
                Benef Branch
            </td>
            <td>
                <asp:DropDownList ID="ddlBenefBranch" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="ButtonBenefBranch" CssClass="buttonStyle" runat="server" Text="Change"
                    OnClick="ButtonChange_Click" />
            </td>
        </tr>--%>
        <tr class="rowAlter">
            <td>
                Oper. Branch
            </td>
            <td>
                <asp:DropDownList ID="ddlOperBranch" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="ButtonOperBranch" CssClass="buttonStyle" runat="server" Text="Change"
                    OnClick="ButtonChange_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Status
            </td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="ButtonStatus" CssClass="buttonStyle" runat="server" Text="Change"
                    OnClick="ButtonChange_Click" />
            </td>
        </tr>
        <tr class="rowAlter">
            <td>
                File Name
            </td>
            <td>
                <asp:Label ID="LabelFileName" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Button ID="ButtonDeleteReturn" CssClass="buttonStyle" runat="server" 
                    Text="Delete Return" onclick="ButtonDeleteReturn_Click"
                     />
            </td>
        </tr>
        <%--<tr>
            <td>
                Change Branch</td>
            <td>
                <asp:DropDownList ID="ddlBenefBranchChange" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="ButtonBenefBranchChange" CssClass="buttonStyle" runat="server" Text="Change"
                    OnClick="ButtonChange_Click" />
            </td>
        </tr>--%>
        <tr class="rowAlter">
            <td colspan="2">
                <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                    <asp:Label Text="Result" ID="labelError" runat="server"></asp:Label>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
