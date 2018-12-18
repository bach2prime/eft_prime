<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EFT_Proj.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>EFT : Login</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="media/images/favicon.ico">
</head>
<body>
    <form runat="server" autocomplete="off">
    <style>
        .shadow2
        {
            -moz-box-shadow: 2px 2px 10px 4px #BBBBBB;
            -webkit-box-shadow: 2px 2px 10px 4px #BBBBBB;
            box-shadow: 3px 3px 4px #BB0000; /* For IE 8 */
            -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#999')"; /* For IE 5.5 - 7 */
            filter: progid:DXImageTransform.Microsoft.Shadow(Strength=4, Direction=135, Color='#999');
        }
    </style>
    <div style="margin: 30px auto 10px; width: 800px; border: 0px solid #ccc; text-align:center" >
        <img src="/media/images/bank.jpg" width="300px" style="margin: 0px auto;" />
    </div>
    <div style="margin: 10px auto 60px; width: 800px; border: 0px solid #ccc;" class="shadow">
        <div style="border: 0px solid #fff">
            <table cellpadding="10" cellspacing="0" width="100%" style="background-color: #fff;">
                <tr style="/*background: url('../media/images/headerL.png') repeat-x scroll 0 0 #fff;*/
                    
                    background: url('/media/images/grid_header.png') repeat-x scroll 50% 50% #5C9CCC;
                    font-variant: small-caps; color: white">
                    <td colspan="2" style="font-size: 20px; text-align:center" valign="middle" >
                    
                        &nbsp;&nbsp;&nbsp;Electronic Fund Transfer
                        <asp:Label ID="labelBankName" Text="" runat="server" Visible="false"></asp:Label>
                        <%--Shahjalal Islami Bank Ltd.--%>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" style="width: 40%; padding: 0px 20px 20px 30px">
                        <asp:Panel Font-Bold="true" ForeColor="Red" ID="NotHead" runat="server">
                            Notice
                            <img src="media/images/pin.png" width="20px" /><br />
                            <br />
                        </asp:Panel>
                        <asp:Label ID="Notice" Text="" runat="server"></asp:Label>
                    </td>
                    <td valign="top" style="padding: 0 0 50px 70px; border-left: 0px solid #ccc;">
                        <%--<h3>
                    <b>Welcome to electronic Fund Transfer</b>
                </h3>
                <h4>
                    Please Login using your Name and Password. Contact IT division if needed.</h4>--%>
                        <br />
                        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false"
                            OnAuthenticate="LoginUser_Authenticate">
                            <LayoutTemplate>
                                <div class="homeBox">
                                    <fieldset class="login" style="">
                                        <legend>EFT Login</legend>
                                        <asp:ValidationSummary CssClass="messageBox" ID="LoginUserValidationSummary" runat="server"
                                            ValidationGroup="LoginUserValidationGroup" />
                                        <p>
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username</asp:Label>
                                            <asp:TextBox ID="UserName" runat="server" CssClass="textBox" Width="200px" AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                            <asp:TextBox ID="Password" runat="server" CssClass="textBox" TextMode="Password" AutoCompleteType="Disabled" autocomplete="off"
                                                Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:Button ID="LoginButton" CssClass="buttonStyle70" runat="server" CommandName="Login"
                                                Text="Log In" ValidationGroup="LoginUserValidationGroup" Font-Bold="False" />
                                        </p>
                                        <span class="failureNotification" style="font-size: 12px;">
                                            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                        </span>
                                    </fieldset>
                                </div>
                            </LayoutTemplate>
                        </asp:Login>
                        <p style="text-align: center">
                            <asp:Label ID="LabelMessage" runat="server" Font-Bold="False" Font-Size="12pt" Font-Underline="False"
                                ForeColor="#FF3300"></asp:Label>
                        </p>
                    </td>
                </tr>
                <tr style="background-color: #E8F5FF">
                    <td colspan="2" style="font-size: 12px; text-align: center;" valign="middle">
                        <b>&nbsp;&nbsp; &nbsp;<a href="http://www.commlinkinfotech.com/" target="_blank">Commlink
                            Info Tech Ltd.</a> </b>&nbsp;&nbsp;&nbsp; <a href="mailto:eft@commlinkinfotech.com"
                                target="_blank">eft@commlinkinfotech.com</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
