<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CreateMessage.aspx.cs" Inherits="EFT_Proj.Message.CreateMessage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent"    runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            
        </Scripts>
    </asp:ScriptManager>
    <h3>Send Message</h3>
    <p><asp:Label ID="MsgLabel" CssClass="messageLabel" runat="server" ForeColor="Blue" Text="Label" Visible="False"></asp:Label></p>
    
    <table cellspacing="4" >
    <tr>
    <td>Validity</td>
    <td>
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                    TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
                
                <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
    </td>
    </tr>
        <tr>
            <td valign=top>
                Select Branch :
            </td>
            <td>
                <div style="float: left"><asp:ListBox ID="lbBranchList" runat="server"  SelectionMode=Multiple 
                    Width="240px" Rows=10></asp:ListBox></div>
                    <div style="padding-left: 20px;float:left">
                    <span style="font-style: italic;font-size: 10; line-height:1.7em;">
                    You can select multiple branches at a time 
                        <br />
                        using 
                    <b>Ctrl+Mouse Left</b> button Click.<br />
                        <br />
                        Do not select All if you want to send 
                        <br />
                        message to specific branches.</span>
                    </div>
            </td>
        </tr>
        <tr>
            <td>
                Subject :
            </td>
            <td>
                <asp:TextBox ID="tbSubject" runat="server" Width="397px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                    ControlToValidate="tbSubject"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="top">
                Message :
            </td>
            <td valign="top">
                <asp:TextBox ID="tbMessage" Columns="20" runat="server" Height="209px" TextMode="MultiLine"
                    Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                    ControlToValidate="tbMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btSend" runat="server" Text="Send" OnClick="btSend_Click" />
            </td>
        </tr>
    </table>
    
</asp:Content>
