<%@ Page Title="EFT" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="EFT_Proj.About" Culture="bn-BD" UICulture="bn-BD" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .LinkBox
        {
            float: left;
            width: 300px;
            padding: 15px;
        }
        
        .Link
        {
            padding: 10px 20px;
            background: #eee;
        }
    </style>
    <div style="padding: 0 20px 20px;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 50%">
                    <h2>
                        <asp:Label ID="lblHeader" runat="server" Text=""></asp:Label>
                    </h2>
                </td>
                <td>
                    <asp:RadioButtonList ID="radioDate" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                        OnSelectedIndexChanged="RadioDate_SelectedIndexChanged">
                        <asp:ListItem Value="0" Selected="true">Last Working Date</asp:ListItem>
                        <asp:ListItem Value="1">Today</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td align="right" valign="middle">
                    <a href="Message/ViewMessage.aspx" style="text-decoration: none;">
                        <img src="media/images/mail.png" width="24px" border="none" />&nbsp;
                        <%--Messages Today--%>
                        <asp:Label ID="lbMessage" runat="server" ForeColor="#04549D" Font-Size="18px" Style="font-weight: 700"></asp:Label>
                    </a>
                </td>
            </tr>
        </table>
        <%--<div>
            <div class="LinkBox">
                <a class="Link" href="Report/Report.aspx">Report</a>
                <a class="Link" href="Report/Report.aspx">Report</a>
            </div>
        </div>--%>
        <br style="clear: both" />
        <%--<asp:Label ID="menu_" runat="server" ForeColor="#04549D"></asp:Label>--%>
        
            <%-- <table style="margin-left: 0px; width: 600px;" cellpadding="10px">
                <tr>                   
                    <td>
                        <div>
                            <asp:DropDownList ID="ddlCurrency" runat="server" Font-Names="Segoe UI" Font-Size="9pt"
                                AutoPostBack="True" OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;
                            <asp:DropDownList ID="ddlSession" runat="server" Font-Names="Segoe UI" Font-Size="9pt"
                                AutoPostBack="True" OnSelectedIndexChanged="ddlSession_OnSelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
            </table>
            <br />--%>
            <table style="width: 100%; margin-bottom: 20px; font-size:0.9em">
                <tr>
                    <td runat="server" id="Bdt1Summary" style="width: 33%;">
                        <table style="margin-left: 0px; background-color: #bef0ca; width: 100%" cellpadding="5px">
                            <tr>
                                <td style="font-weight: normal; font-size: 1.6em; color: #555">
                                    <asp:Label runat="server" Text="" ID="LabelNetDateBdt"></asp:Label>
                                </td>
                                <td align="right">
                                    <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                    <a href="/Report/Report.aspx" style="font-size: 1.8em; text-decoration: none">
                                        <asp:Label runat="server" Text="0" ID="LabelNetAmountBdt"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView Style="margin-left: 0px; width: 100%" ID="gridviewItemsBdt" runat="server"
                            AutoGenerateColumns="False" CellPadding="2" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="" />
                                <asp:BoundField HeaderText="Credit Items" DataField="CrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Credit Amount" DataField="CrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                    </td>
                    <td runat="server" id="Bdt2Summary" style="width: 33%">
                        <table style="margin-left: 0px; background-color: #b3f9ac; width: 100%" cellpadding="5px">
                            <tr>
                                <td style="font-weight: normal; font-size: 1.6em; color: #555">
                                    <asp:Label runat="server" Text="" ID="LabelNetDateBdt2"></asp:Label>
                                </td>
                                <td align="right">
                                    <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                    <a href="/Report/Report.aspx" style="font-size: 1.8em; text-decoration: none">
                                        <asp:Label runat="server" Text="0" ID="LabelNetAmountBdt2"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView Style="margin-left: 0px; width: 100%" ID="gridviewItemsBdt2" runat="server"
                            AutoGenerateColumns="False" CellPadding="2" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="" />
                                <asp:BoundField HeaderText="Credit Items" DataField="CrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Credit Amount" DataField="CrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                    </td>
                    <td style="width: 33%" valign="top">
                        <asp:PlaceHolder runat="server" ID="phAdminSummary">
                            <table style="margin-left: 0px; background-color: #f0f0f0; width: 100%" cellpadding="5px">
                                <tr>
                                    <td style="font-weight: normal; font-size: 1.8em; color: #555">
                                        <asp:Label runat="server" Text="Attention" ID="Label1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <%--  <div style="margin-left: 0px; width: 100%; padding: 1px 0px 7px 15px; background-color: #f0f0f0">
                            <h2>
                                Pending Tasks</h2>
                        </div>--%>
                            <table cellpadding="0px" cellspacing="0px" style="width: 100%;">
                                <tr>
                                    <td class="RowStyleWhite" style="text-align: left">
                                        Outward Batch Ready for Sending
                                    </td>
                                    <td class="big RowStyleWhite">
                                        <a href="/Outward/CreateOutwardXmlAll.aspx">
                                            <asp:Label Text="0" ID="labelPendingXml" runat="server" />
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="RowStyleWhite" style="text-align: left">
                                        Outward Return Ready for Sending
                                    </td>
                                    <td class="big RowStyleWhite">
                                        <a href="/Inward/ReturnItem.aspx">
                                            <asp:Label Text="0" ID="labelPendingReturn" runat="server" /></a>
                                    </td>
                                </tr> 
                                <tr>
                                    <td class="RowStyleWhite" style="text-align: left">
                                        Inward/In Ret Parsing Error
                                    </td>
                                    <td class="big RowStyleWhite">
                                        <a href="/Admin/ActionLog.aspx">
                                            <asp:Label Text="0" ID="labelParsingError" runat="server" /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="RowStyleWhite" style="text-align: left">
                                        User/In-Out Repair Operation
                                    </td>
                                    <td class="big RowStyleWhite">
                                        <a href="/Admin/User.aspx">
                                            <asp:Label Text="0" ID="labelRepair" runat="server" /></a>
                                    </td>
                                </tr>
                            </table>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" ID="phBranchSummary">
                             <table style="margin-left: 0px; background-color: #f0f0f0; width: 100%" cellpadding="5px">
                                <tr>
                                    <td style="font-weight: normal; font-size: 1.8em; color: #555">
                                        <asp:Label runat="server" Text="Pending..." ID="Label2"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="10px" cellspacing="0px" style="width: 100%;">
                                <tr>
                                    <td class="RowStyleWhite" style="text-align: left">
                                        Outward Not Sent
                                    </td>
                                    <td class="big RowStyleWhite">
                                        <asp:Label Text="0" ID="labelOutNotSent" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="RowStyleWhite" style="text-align: left">
                                        Outward Return Not Sent
                                    </td>
                                    <td class="big RowStyleWhite">
                                        <asp:Label Text="0" ID="labelOutRetNotSent" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td runat="server" id="UsdSummary" style="width: 33%;">
                        <table style="margin-left: 0px; background-color: #fed3d3; width: 100%" cellpadding="5px">
                            <tr>
                                <td style="font-weight: normal; font-size: 1.6em; color: #555">
                                    <asp:Label runat="server" Text="" ID="LabelNetDateUsd"></asp:Label>
                                </td>
                                <td align="right">
                                    <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                    <a href="/Report/Report.aspx" style="font-size: 1.8em; text-decoration: none">
                                        <asp:Label runat="server" Text="0" ID="LabelNetAmountUsd"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView Style="margin-left: 0px; width: 100%" ID="gridviewItemsUsd" runat="server"
                            AutoGenerateColumns="False" CellPadding="2" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="" />
                                <asp:BoundField HeaderText="Credit Items" DataField="CrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Credit Amount" DataField="CrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                    </td>
                    <td runat="server" id="GbpSummary" style="width: 33%">
                        <table style="margin-left: 0px; background-color: #f9f4d7; width: 100%" cellpadding="5px">
                            <tr>
                                <td style="font-weight: normal; font-size: 1.6em; color: #555">
                                    <asp:Label runat="server" Text="" ID="dateGbp"></asp:Label>
                                </td>
                                <td align="right">
                                    <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                    <a href="/Report/Report.aspx" style="font-size: 1.8em; text-decoration: none">
                                        <asp:Label runat="server" Text="0" ID="netGbp"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView Style="margin-left: 0px; width: 100%" ID="gridviewgbp" runat="server"
                            AutoGenerateColumns="False" CellPadding="2" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="" />
                                <asp:BoundField HeaderText="Credit Items" DataField="CrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Credit Amount" DataField="CrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                    </td>
                    <td runat="server" id="EurSummary" style="width: 33%;">
                        <table style="margin-left: 0px; background-color: #bfdaf7; width: 100%" cellpadding="5px">
                            <tr>
                                <td style="font-weight: normal; font-size: 1.6em; color: #555">
                                    <asp:Label runat="server" Text="" ID="dateEur"></asp:Label>
                                </td>
                                <td align="right">
                                    <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                    <a href="/Report/Report.aspx" style="font-size: 1.8em; text-decoration: none">
                                        <asp:Label runat="server" Text="0" ID="netEur"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView Style="margin-left: 0px; width: 100%" ID="gridviewEur" runat="server"
                            AutoGenerateColumns="False" CellPadding="2" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="" />
                                <asp:BoundField HeaderText="Credit Items" DataField="CrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Credit Amount" DataField="CrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td runat="server" id="JpySummary" style="width: 33%">
                        <table style="margin-left: 0px; background-color: #fae5d1; width: 100%" cellpadding="5px">
                            <tr>
                                <td style="font-weight: normal; font-size: 1.6em; color: #555">
                                    <asp:Label runat="server" Text="" ID="dateJpy"></asp:Label>
                                </td>
                                <td align="right">
                                    <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                    <a href="/Report/Report.aspx" style="font-size: 1.8em; text-decoration: none">
                                        <asp:Label runat="server" Text="0" ID="netJpy"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView Style="margin-left: 0px; width: 100%" ID="gridviewJpy" runat="server"
                            AutoGenerateColumns="False" CellPadding="2" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="" />
                                <asp:BoundField HeaderText="Credit Items" DataField="CrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Credit Amount" DataField="CrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                    </td>
                    <td runat="server" id="CadSummary" style="width: 33%;">
                        <table style="margin-left: 0px; background-color: #fbddf7; width: 100%" cellpadding="5px">
                            <tr>
                                <td style="font-weight: normal; font-size: 1.6em; color: #555">
                                    <asp:Label runat="server" Text="" ID="dateCad"></asp:Label>
                                </td>
                                <td align="right">
                                    <%--style="font-weight: bold; font-size: 150%; color: red">--%>
                                    <a href="/Report/Report.aspx" style="font-size: 1.8em; text-decoration: none">
                                        <asp:Label runat="server" Text="0" ID="netCad"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView Style="margin-left: 0px; width: 100%" ID="gridviewCad" runat="server"
                            AutoGenerateColumns="False" CellPadding="2" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="Type" HeaderText="" />
                                <asp:BoundField HeaderText="Credit Items" DataField="CrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Credit Amount" DataField="CrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit Items" DataField="DrCount"></asp:BoundField>
                                <asp:BoundField HeaderText="Debit Amount" DataField="DrAmount" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td valign="top" style="padding-left: 0px">
                    </td>
                </tr>
            </table>
        
        <%--<table>
            <tr>
                <td valign="top">
                    <asp:PlaceHolder runat="server" ID="phRetproblem" Visible="false">
                        <h3>
                            Outward Return Problem</h3>
                        <asp:GridView Style="margin-left: 0px; font-size: .9em" ID="gvOutRet" runat="server"
                            AutoGenerateColumns="False" CellPadding="15" ForeColor="#444444" GridLines="None"
                            ViewStateMode="Enabled" ShowFooter="false">
                            <Columns>
                                <asp:BoundField DataField="BranchName" HeaderText="Branch" />
                                <asp:BoundField HeaderText="Orig Date" DataFormatString="{0:dd-MM-yyyy}" DataField="ParentSettDate">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Orig Trace No" DataField="ParentTraceNo"></asp:BoundField>
                                
                                <asp:BoundField HeaderText="Credit" DataField="AmountCr" DataFormatString="{0:N}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Debit " DataField="AmountDr" DataFormatString="{0:N}">
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="HeaderStyleWhite" HorizontalAlign="Left" />
                            <RowStyle CssClass="RowStyleWhite" />
                            <AlternatingRowStyle CssClass="AlterRowStyleWhite" />
                        </asp:GridView>
                        <br />
                        <a href="/Inward/ReturnItem.aspx">Send Outward Return</a> </asp:PlaceHolder>
                </td>
                <td>
                </td>
            </tr>
        </table>--%>
        <br />
        <%--<asp:GridView Style="margin-left: 0px; width: 80%" ID="gridviewItems" runat="server"
            AutoGenerateColumns="False" CellPadding="7" ForeColor="#666666" GridLines="None"
            ViewStateMode="Enabled" ShowFooter="false">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField HeaderText="Type" DataField="TypeStr">
                    <ItemStyle ForeColor="#04549D" />
                </asp:BoundField>
                <asp:BoundField DataField="ActionTime" DataFormatString="{0:dd MMM yyyy HH:mm}" HeaderText="Time">
                    <ItemStyle Width="18%" />
                </asp:BoundField>
                <asp:BoundField DataField="Details" HtmlEncode="false" HeaderText="Details">
                    <ItemStyle Width="60%" ForeColor="#444444" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="HeaderStyleDarkSimple" HorizontalAlign="Left" />
            <RowStyle CssClass="RowStyle_" />
            <AlternatingRowStyle CssClass="AlternatingRowStyleSimple" />
        </asp:GridView>--%>
        <br />
    </div>
    <script>
        var a = document.getElementById("lblHeader");
        a.innerHTML = a.innerHTML.replace("Mr.", "");
    </script>
</asp:Content>
