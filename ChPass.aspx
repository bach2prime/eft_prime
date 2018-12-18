<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ChPass.aspx.cs" Inherits="EFT_Proj.ChPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 400px; margin: 30px auto; padding: 0px; border: 1px solid #f0f0f0;">
        <table style="width: 100%; margin: 0px; border: 2px solid #fff; background-color: #f9f9f9;"
            cellpadding="3">
            <tr>
                <td colspan="2">
                    <h4>
                        <b>Change Password</b></h4>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    User Name
                </td>
                <td>
                    <asp:Label runat="server" ID="lbusername"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    Current Password
                </td>
                <td>
                    <asp:TextBox CssClass="textBox" ID="TextBoxCurrent" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    New Password
                </td>
                <td>
                    <asp:TextBox CssClass="textBox" ID="TextBoxNew1" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 150px; padding-left: 10px;">
                    Retype New Password
                </td>
                <td>
                    <asp:TextBox CssClass="textBox" ID="TextBoxNew2" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="1">
                    <asp:Button ID="ButtonChange" runat="server" CssClass="buttonStyle70" Text="Change"
                        OnClick="ButtonChange_Click" />
                </td>
            </tr>
        </table>
       
        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="false">
            <asp:Label runat="server" ID="labelResult"></asp:Label>
        </asp:Panel>
        
         <h3>Password Policy</h3>
        <asp:Label runat="server" ID="txtPassPolicy"></asp:Label>
    </div>
   
</asp:Content>
