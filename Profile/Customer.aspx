<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Customer.aspx.cs" Inherits="EFT_Proj.Profile.CustomerPage" %>

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
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <b>Find </b>
                <hr />
            </td>
            <td>
                <b>Add / Edit Customer</b><hr />
            </td>
        </tr>
        <tr>
            <td style="width: 50%" valign="top">
                Name:
                <asp:TextBox CssClass="textBox" ID="TextBoxFindName" runat="server" Width="100px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp; or&nbsp;&nbsp;&nbsp; ID:
                <asp:TextBox CssClass="textBox" ID="TextBoxFindID" runat="server" Width="100px"></asp:TextBox>
                &nbsp;
                <asp:Button ID="ButtonGetUser" CssClass="buttonStyle" runat="server" Text="Search"
                    OnClick="ButtonGetUser_Click" />
                <br />
                <hr />
                <asp:GridView ID="gridviewActive" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#151515" GridLines="None" Width="100%" ViewStateMode="Enabled" OnSelectedIndexChanging="gridviewActive_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                        <asp:BoundField DataField="Customer_Id" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Limit_Send" HeaderText="Limit (TK)" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdCustomerId" runat="server" Value='<%# Eval("Customer_Id") %>' />
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
            <td style="width: 50%" valign="top">
                <table cellpadding="5" cellspacing="0" width="90%">
                    <tr>
                        <td class="rightAlign">
                            Name
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="TextBoxName" runat="server" TabIndex="2" Width="100px"></asp:TextBox>
                            &nbsp;(max 16 chars)
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            ID
                        </td>
                        <td>
                            <asp:Label runat="server" ID="LabelID"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Limit (TK)
                        </td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="TextBoxLimit" runat="server" TabIndex="3" Width="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Contact</td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="TextBoxContact" runat="server" TabIndex="3" 
                                Width="150px"></asp:TextBox> (max 20 chars)
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">
                            Address
                            <br />
                            (max 200 chars)</td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="TextBoxAddress" runat="server" TabIndex="2" Width="250px"
                                Rows="3" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 20px;" colspan="2">
                            <asp:Button CssClass="buttonStyle" ID="btnAddUser" runat="server" TabIndex="4" Text="Add / Update"
                                OnClick="btnAddUser_Click" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnClear" runat="server" TabIndex="5" 
                                Text="Clear" onclick="btnClear_Click" />
                            <br />
                            <br />
                            <asp:Panel runat="server" ID="PanelError" CssClass="messageBox">
                                <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
