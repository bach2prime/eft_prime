<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTPSettings.aspx.cs" Inherits="EFT_Proj.Admin.FTPSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="PanelError" CssClass="messageBox floatleft">
        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
    </asp:Panel>
    <br />
    <div style="width: 75%;">
        <h3>
            Operation Control</h3>
        <span style="float: left;">Inward Make and Report option for Branch Users:</span>
        <asp:RadioButtonList ID="radioInMake" runat="server" RepeatDirection="Horizontal"
            AutoPostBack="True" OnSelectedIndexChanged="RadioInMake_SelectedIndexChanged">
            <asp:ListItem Value="false">Close</asp:ListItem>
            <asp:ListItem Value="true">Open</asp:ListItem>
        </asp:RadioButtonList>
        <br/>
        Outward Return Cut-off Time: (i.e. 15:30)
        <asp:TextBox runat="server" ID ="tbORTime" />
    &nbsp;<asp:Button ID="btnFtpUpdate0" CssClass="buttonStyle" runat="server" Font-Names="Trebuchet MS"
            Font-Size="10pt" Text="Update" OnClick="btnOrTimeUpdate_Click" /> 
            
            <br/>
        Outward Make Cut-off Time: (i.e. 15:30)
        <asp:TextBox runat="server" ID ="tbOutMakeTime" />
    &nbsp;<asp:Button ID="btnOutMakeCutoff" CssClass="buttonStyle" runat="server" Font-Names="Trebuchet MS"
            Font-Size="10pt" Text="Update" OnClick="btnOutMakeCutoff_Click" />
    </div>



    <div style="width: 75%;">
        <h3>
            FTP Test</h3>
        IP Address&nbsp;
        <asp:TextBox ID="txtIPAddress" runat="server" CssClass="textBox"></asp:TextBox>
        &nbsp;( last &#39;/&#39; is needed )<br />
        <br />
        User Name
        <asp:TextBox ID="txtName" runat="server" CssClass="textBox"></asp:TextBox>
        <br />
        <br />
        Password&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" CssClass="textBox"></asp:TextBox>
        <br />
        <br />
        Outward Upload Path
        <asp:TextBox ID="txtUploadOutward" Width="250px" runat="server" CssClass="textBox"></asp:TextBox>
        &nbsp;( last &#39;/&#39; is needed )
        <br />
        <br />
        Outward Return Upload Path
        <asp:TextBox ID="txtUploadOutRet" Width="250px" runat="server" CssClass="textBox"></asp:TextBox>
        &nbsp;( last &#39;/&#39; is needed )
        <br />
        <br />
        <asp:Button ID="btnFtpConnect" CssClass="buttonStyle" runat="server" Font-Names="Trebuchet MS"
            Font-Size="10pt" Text="Test" OnClick="btnFtpConnect_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="btnFtpUpdate" CssClass="buttonStyle" runat="server" Font-Names="Trebuchet MS"
            Font-Size="10pt" Text="Update" OnClick="btnFtpUpdate_Click" />
    </div>
    <br />
    <br />
    <h3>
        Notice</h3>
    <asp:TextBox ID="TextBoxNotice" Width="550px" runat="server" CssClass="textBox"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnStartStop" CssClass="buttonStyle" runat="server" Text="" OnClick="btnStartStop_Click" />
    <br />
    <h3>
        Application Settings</h3>
    <asp:Button ID="btnApp" CssClass="buttonStyle" runat="server" Font-Names="Trebuchet MS"
        Font-Size="10pt" Text="Reload" OnClick="btnApp_Click" />
    &nbsp;( Needed after add/update/delete of Banks, Branches, Transaction Codes, Return
    Reasons etc. )<br />
    <br />
</asp:Content>
