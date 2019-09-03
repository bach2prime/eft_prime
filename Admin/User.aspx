<%@ Page Title="EFT | User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="User.aspx.cs" Inherits="EFT_Proj.Admin.User" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td colspan="2">
                Branch&nbsp;&nbsp;
                <asp:DropDownList CssClass="dropDown" ID="DropDownListBranch" AppendDataBoundItems="true"
                    runat="server">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                User ID, Name or Employee ID
                <asp:TextBox CssClass="textBox" ID="txtNameSearch" runat="server" TabIndex="2" Width="140px"></asp:TextBox>
                <asp:Button ID="ButtonGetUser" CssClass="buttonStyle" runat="server" Text="Get Users"
                    OnClick="ButtonGetUser_Click" />
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <b>Add / Edit User</b><hr />
            </td>
            <td>
                <b>
                    <asp:Label ID="LabelBranch" runat="server" Text="User"></asp:Label>
                </b>
                <hr />
            </td>
        </tr>
        <tr>
            <td style="width: 60%" valign="top">
                <table cellpadding="5" cellspacing="0" width="90%">
                    <tr>
                        <td class="rightAlign">
                            ID
                        </td>
                        <td>
                            <asp:Label ID="LabelUserID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            User Name
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="TextBoxName" runat="server" TabIndex="2" Width="140px"></asp:TextBox>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="rightAlign">
                            Password
                            
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" TextMode="Password" ID="txtPass" runat="server" TabIndex="2"
                                Width="140px"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="rightAlign">
                            Full Name
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtFullName" runat="server" TabIndex="2" Width="200px"
                                MaxLength="99"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Email
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtEmail" runat="server" TabIndex="2" Width="200px"
                                MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Phone No
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtPhoneNo" runat="server" TabIndex="2" Width="140px"
                                MaxLength="20"></asp:TextBox>
                            &nbsp;optional
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Employee ID
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtEmployee" runat="server" TabIndex="2" Width="140px"
                                MaxLength="20"></asp:TextBox>
                            &nbsp;optional
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="rightAlign">
                            Role
                        </td>
                        <td>
                            <asp:DropDownList CssClass="dropDown" AppendDataBoundItems="true" ID="ddlRole" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Active
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxActive" Text="Check if Active" runat="server" />
                        </td>
                    </tr>
                     <tr>
                        <td class="rightAlign">BDT Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitBdt" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitBdt" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitBdt" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">USD Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitUsd" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitUsd" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitUsd" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">EUR Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitEur" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitEur" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitEur" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">JPY Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitJpy" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitJpy" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitJpy" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">GBP Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitGbp" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitGbp" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitGbp" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">CAD Limit
                        </td>
                        <td>Make
                            <asp:TextBox CssClass="textBox" ID="txtMakeLimitCad" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Check
                            <asp:TextBox CssClass="textBox" ID="txtCheckLimitCad" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                            Send
                            <asp:TextBox CssClass="textBox" ID="txtSendLimitCad" runat="server" Width="80px"
                                MaxLength="20">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 20px;" colspan="2">
                            <asp:Button CssClass="buttonStyle" ID="btnAddUser" runat="server" TabIndex="4" Text="Add / Update"
                                OnClick="btnAddUser_Click" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnClear" runat="server" TabIndex="5" Text="Clear"
                                OnClick="btnClear_Click" />  &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnUnlock" runat="server" TabIndex="5" Text="Unlock"
                                OnClick="btnUnlock_Click" />&nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnReset" runat="server" TabIndex="5" Text="Reset Pass"
                                OnClick="btnReset_Click" />
                            <br />
                            <br />
                            <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                                <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%" valign="top">
                <asp:GridView ID="gridviewActive" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" OnSelectedIndexChanging="gridviewActive_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                        <asp:BoundField DataField="BranchNameExt" HeaderText="Branch" />
                        <asp:BoundField DataField="Name" HeaderText="User Name" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="EmployeeId" HeaderText="Employee ID" />
                        <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" />
                        <asp:BoundField DataField="ActivityStatus" HeaderText="Status 0=Active" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdUserID" runat="server" Value='<%# Eval("UserID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" />
                    <SelectedRowStyle CssClass="SelectedRowStyle" />
                    <HeaderStyle CssClass="HeaderStyleDark" />
                    <RowStyle CssClass="RowStyle" />
                    <EditRowStyle CssClass="EditRowStyle" />
                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h2>
        User Report</h2>
    <table cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td colspan="2">
                Branch&nbsp;&nbsp;
                <asp:DropDownList CssClass="dropDown" ID="ddlBranchReport" AppendDataBoundItems="true"
                    runat="server">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonUserReport" CssClass="buttonStyle" runat="server" Text="Get Report"
                    OnClick="ButtonUserReport_Click" />
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                    Width="100%" Visible="False" BackColor="White" Height="469px" ShowZoomControl="False">
                    <LocalReport ReportPath="">
                    </LocalReport>
                </rsweb:ReportViewer>
            </td>
        </tr>
    </table>
</asp:Content>
