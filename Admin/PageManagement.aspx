<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PageManagement.aspx.cs" Inherits="EFT_Proj.Admin.PageManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%" cellpadding="2" cellspacing="2">
        <tr>
            <td style="width: 45%">
                <h3>
                    Create New Page</h3>
            </td>
            <td>
                <h3>
                    List of Pages</h3>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table cellpadding="2" cellspacing="0">
                    <tr>
                        <td class="rightAlign" style="width: 80px;">
                            Parent Page
                        </td>
                        <td>
                            <asp:DropDownList CssClass="dropDown" ID="ddlParentPages" runat="server" AppendDataBoundItems="true"
                                DataTextField="PageName" DataValueField="PageID">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Page Name
                            <%--<asp:Label ID="Label1" runat="server" Text="*" ForeColor="#FF3300" Font-Size="Large"></asp:Label>--%>
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtName" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Page Link
                            <%--<asp:Label ID="Label2" runat="server" Text="*" ForeColor="#FF3300" Font-Size="Large"></asp:Label>--%>
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtLink" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Page Order
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtOrder" runat="server" TabIndex="2" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 20px;" colspan="2">
                            <asp:HiddenField ID="hfSelectedPageID" runat="server" Value="" />
                            <asp:Button CssClass="buttonStyle70" ID="btnAdd" runat="server" TabIndex="4" Text="Add"
                                OnClick="btnAdd_Click" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnEdit" runat="server" TabIndex="5" Text="Save"
                                OnClick="btnEdit_Click" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnClear" runat="server" TabIndex="5" Text="Clear"
                                OnClick="btnClear_Click" />
                            <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                                <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <asp:GridView ID="gvPageList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                    ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanging="gvPageList_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                        <%--<asp:CommandField ShowDeleteButton="True"></asp:CommandField>--%>
                        <asp:BoundField DataField="PageName" HeaderText="Title" />
                        <asp:BoundField DataField="PageLink" HeaderText="Link" />
                        <asp:BoundField DataField="ParentPageName" HeaderText="Parent" />
                        <asp:BoundField DataField="Order" HeaderText="Order" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdPageID" runat="server" Value='<%# Eval("PageID") %>' />
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
</asp:Content>
