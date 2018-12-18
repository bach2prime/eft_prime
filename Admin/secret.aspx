<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="secret.aspx.cs"
    Inherits="EFT_Proj.Admin.secret" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Site Management</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form runat="server">
    <div class="shadow" style="width: 500px; padding: 15px; margin: 30px auto;">
        <table>
            <tr>
                <td>
                    <h3>
                        Manage Site</h3>
                    <br />
                    Message (Max 200 chars)<br />
                    <asp:TextBox ID="TextBoxMesage" runat="server" Width="300px"></asp:TextBox>&nbsp;&nbsp;
                    <asp:Button ID="btnStartStop" CssClass="buttonStyle" runat="server" Text="" OnClick="btnStartStop_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div style="padding: 20px;">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">UPDATE</asp:LinkButton>
    </div>
    </form>
</body>
