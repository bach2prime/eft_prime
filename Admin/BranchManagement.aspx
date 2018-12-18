<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="BranchManagement.aspx.cs" Inherits="EFT_Proj.Admin.BranchManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
            <td style="width: 45%">
                <h3>
                    Add New Branch</h3>
            </td>
            <td>
                <h3>
                    List of Our Branches</h3>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table width="95%" cellpadding="5" cellspacing="0">
                    <tr>
                        <td style="padding-top: 10px;" colspan="2">
                            <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                                <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Branch Name
                            <%--<asp:CommandField ShowDeleteButton="True"></asp:CommandField>--%>
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtName" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Short Name
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtNameShort" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Routing No
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtRouting" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Private Code
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtPriCode" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>   
                    <tr>
                        <td class="rightAlign">
                            Settlement Account
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtAccount" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Active?
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxActive" runat="server" Text="Check if Active" />
                        </td>
                    </tr> 
                    <tr>
                        <td class="rightAlign">
                            AD Branch?
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxADBranch" runat="server" Text="Check if AD Branch" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 20px;" colspan="2">
                            <asp:HiddenField ID="hfSelectedBranchID" runat="server" Value="" />
                            <asp:Button CssClass="buttonStyle70" ID="btnAdd" runat="server" TabIndex="4" Text="Add"
                                OnClick="btnAdd_Click" OnClientClick="loading()" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnEdit" runat="server" TabIndex="5" Text="Save"
                                OnClick="btnEdit_Click" OnClientClick="loading()" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnClear" runat="server" TabIndex="5" Text="Clear"
                                OnClick="btnClear_Click" OnClientClick="loading()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                Branch Name Starts with
                <asp:TextBox ID="TxtSearch" Text="a" runat="server" Width="64px"></asp:TextBox>
                &nbsp;
                <asp:Button CssClass="buttonStyle" ID="ButtonSearch" runat="server" TabIndex="5"
                    Text="Search" OnClick="TxtSearch_TextChanged" OnClientClick="loading()" />
                <br />
                <br />
                <asp:GridView ID="gvBranchList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                    ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanging="gvPageList_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                        <asp:BoundField DataField="BranchName" HeaderText="Name" />
                        <asp:BoundField DataField="RoutingNumber" HeaderText="Routing Number" />
                        <asp:BoundField DataField="PrivateBranchCode" HeaderText="Private Code" />
                        <asp:BoundField DataField="BranchShortName" HeaderText="Short Name" />
                        <asp:BoundField DataField="Rowstate" HeaderText="Status 0=active" />
                        <asp:BoundField DataField="IsAdBranch" HeaderText="AD" />
                        <asp:TemplateField HeaderText="">
                            <ItemStyle Width="0%" />
                            <ItemTemplate>
                                <asp:HiddenField ID="hdBranchID" runat="server" Value='<%# Eval("BranchId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F1F1F1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#C0C0C0" Height="15px" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="SelectedRowStyle" />
                    <HeaderStyle CssClass="HeaderStyleDark" />
                    <RowStyle CssClass="RowStyle" />
                    <EditRowStyle CssClass="EditRowStyle" />
                    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <div id="load" style="visibility: hidden">
        <div id="progressBackgroundFilter">
        </div>
        <div id="processMessage">
            <div style="margin: auto; width: 40px">
                <img alt="Busy..." width="32px" src="../media/images/loader.gif" />
            </div>
        </div>
    </div>
</asp:Content>
