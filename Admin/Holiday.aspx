<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Holiday.aspx.cs"
    Inherits="EFT_Proj.Admin.Holiday" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="padding: 20px; width: 500px; float: left">
        <h3>
            Holidays Management</h3>
        <br />
        Year&nbsp;&nbsp;
        <asp:TextBox ID="txtYear" runat="server" Width="80px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnGetHoliday" CssClass="buttonStyle" runat="server" Text="Get Holidays"
            OnClick="btnGetHoliday_Click" />
        <br />
        <br />
        Select Date &nbsp;&nbsp;
        <asp:TextBox ID="txtDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
            TargetControlID="txtDate" Format="dd/MM/yyyy">
        </cc1:CalendarExtender>
        <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
        &nbsp;
        <asp:Button ID="btnAddHoliday" CssClass="buttonStyle" runat="server" Text="Add as Holiday"
            OnClick="btnAddHoliday_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnDelHoliday" CssClass="buttonStyle" runat="server" Text="Delete Holiday"
            OnClick="btnDelHoliday_Click" />
        <br />
        <br />
        <asp:Label ID="lbHolidays" runat="server" Text=""></asp:Label>
    </div>
    <div style="padding: 20px; width: 300px; float: left; border-left: 1px solid #ddd;">
        <h3>
            Weekly Holidays</h3>
        <br />
        <strong>Friday</strong>
        <asp:RadioButtonList ID="RadioFriday" runat="server" RepeatDirection="Horizontal"
            AutoPostBack="True" OnSelectedIndexChanged="RadioFriday_SelectedIndexChanged">
            <asp:ListItem Value="false">Close</asp:ListItem>
            <asp:ListItem Value="true">Open</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <strong>Saturday</strong>
        <asp:RadioButtonList ID="RadioSaturday" runat="server" RepeatDirection="Horizontal"
            AutoPostBack="True" OnSelectedIndexChanged="RadioSaturday_SelectedIndexChanged">
            <asp:ListItem Value="false">Close</asp:ListItem>
            <asp:ListItem Value="true">Open</asp:ListItem>
        </asp:RadioButtonList>
    </div>
</asp:Content>
