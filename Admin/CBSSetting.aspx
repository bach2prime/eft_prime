<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CBSSetting.aspx.cs" Inherits="EFT_Proj.Admin.CBSSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table cellpadding="0" cellspacing="20">
            <tr class="evenRow">
                <td colspan="2">
                    <asp:Panel runat="server" ID="messagePnl" CssClass="messageBox" Visible="false">
                        <asp:Label Text="" ID="messageLbl" runat="server"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr class="evenRow">
                <td></td>
                <td>
                    <asp:Label Width="150px" Text="Part 1" ID="part1Lbl" runat="server" style="text-align: center;"></asp:Label>
                    <asp:Label Width="150px" Text="Part 2" ID="part2Lbl" runat="server" style="text-align: center;"></asp:Label>
                </td>
            </tr>
            <tr class="evenRow">
                <td>Inputer Password
                </td>
                <td>
                    <asp:TextBox ID="InputerPass1" Width="150px"  runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="InputerPass2" Width="150px" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="InputerPassBtn" OnClick="InputerPassBtn_Click" Text="Set Password" CssClass="buttonStyle"
                        runat="server" />
                </td>
            </tr>
            <tr class="evenRow">
                <td>Authorizer Password
                </td>
                <td>

                    <asp:TextBox ID="AuthorizerPass1" Width="150px" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="AuthorizerPass2" Width="150px" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="AuthorizerPassBtn" OnClick="AuthorizerPassBtn_Click" Text="Set Password" CssClass="buttonStyle"
                        runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>