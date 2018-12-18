<%@ Page Title="Inward: Print" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="InwardActivity.aspx.cs" Inherits="EFT_Proj.Inward.InwardActivity" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function handleChange(cb) {
            //alert("Changed, new value = " + cb.checked+' > '+cb.value);
            //if (cb.value == 1) 
            {
                if (cb.checked)
                    $("." + cb.value).parent().show();
                else
                    $("." + cb.value).parent().hide();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="padding: 0px; border: 1px solid #f0f0f0;">
        <table width="100%" style="margin-left: 0px; border: 2px solid #fff; background-color: #f5f5f5;"
            cellpadding="5">
            <tr>
                <td>
                    <b>Inward Operation</b>
                </td>
                <td>
                    Business Date: &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbsettDate" runat="server" CssClass="textBox" Width="80px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                        TargetControlID="tbsettDate" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                    <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/media/images/cal2.png" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button CssClass="buttonStyle" ID="ButtonGetItems" runat="server" Text="Details"
                        OnClick="ButtonGetItems_OnClick" />
                    &nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <input type="checkbox" onclick="handleChange(this)" value="noinward" checked="checked" />
                    No Inward&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" onclick="handleChange(this)" value="printed" checked="checked" />
                    Printed&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" onclick="handleChange(this)" value="notprinted" checked="checked" />
                    Not Printed
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:Label runat="server" ID="output"></asp:Label>
    </div>
</asp:Content>
