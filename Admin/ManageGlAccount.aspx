<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ManageGlAccount.aspx.cs" Inherits="EFT_Proj.Admin.ManageGlAccount" %>

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
                            <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" Visible="false">
                                <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Branch</td>
                        <td>
                            <asp:DropDownList Width="200px" CssClass="dropDown" DataTextField="NameAndRt" DataValueField="RoutingNo"
                                ID="DropDownListBranch" runat="server"  TabIndex="2" />
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Currency </td>
                        <td>
                             <asp:DropDownList Width="200px" CssClass="dropDown" ID="DropDownListCurrency" runat="server"  TabIndex="2" />
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Tnx Type</td>
                        <td>
                             <asp:DropDownList Width="200px" CssClass="dropDown" ID="DropDownListTnxType" runat="server" TabIndex="2" />
                        </td>
                    </tr>
                    <tr>
                        <td class="rightAlign">Account Number</td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtAccNum" runat="server" TabIndex="2" Width="200px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>   
                    <tr>
                        <td class="rightAlign">Company ID</td>
                        <td>
                            <asp:TextBox CssClass="textBox" ID="txtCompanyId" runat="server" TabIndex="2" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 20px;" colspan="2">
                            <asp:Button CssClass="buttonStyle70" ID="btnAdd" runat="server" TabIndex="4" Text="Add"
                                OnClick="btnAdd_Click" OnClientClick="loading()" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnEdit" runat="server" TabIndex="5" Text="Update"
                                OnClick="btnEdit_Click" OnClientClick="loading()" />
                            &nbsp;
                            <asp:Button CssClass="buttonStyle70" ID="btnClear" runat="server" TabIndex="5" Text="Cancel"
                                OnClick="btnClear_Click" OnClientClick="loading()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                Branch
                <asp:DropDownList Width="200px" CssClass="dropDown" DataTextField="NameAndRt" DataValueField="RoutingNo"
                                ID="DropDownListBranchSearch" runat="server"  TabIndex="2" />
                &nbsp; &nbsp;
                Currency
                <asp:DropDownList Width="100px" CssClass="dropDown" DataTextField="NameAndRt" DataValueField="RoutingNo"
                                ID="DropDownListCurrencySearch" runat="server" />
                &nbsp; &nbsp;
                <asp:HiddenField ID="hfLastSearchedBranchRt" runat="server" Value="" />
                <asp:HiddenField ID="hfLastSearchedCurrency" runat="server" Value="" />

                <asp:Button CssClass="buttonStyle" ID="ButtonSearch" runat="server" TabIndex="5"
                    Text="Search" OnClick="SearchAccount_clicked" OnClientClick="loading()" />
                <br />
                <br />
                <asp:GridView ID="gvGlAccountList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                    ForeColor="#333333" GridLines="None" Width="100%" 
                    OnSelectedIndexChanging="gvPageList_SelectedIndexChanging" 
                    OnRowDeleting="gvGlAccountList_RowDeleting"
                    OnRowDataBound="gvGlAccountList_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="RoutingNumber" HeaderText="Routing Number" />
                        <asp:BoundField DataField="CurrencyCodeStr" HeaderText="Currency" />
                        <asp:BoundField DataField="GlAccountTypeStr" HeaderText="Tnx-Type" />
                        <asp:BoundField DataField="GlAccountNumber" HeaderText="Acc Number" />
                        <asp:BoundField DataField="CompanyId" HeaderText="Company ID" />
                        <asp:TemplateField HeaderText="">
                            <ItemStyle Width="0%" />
                            <ItemTemplate>
                                <asp:HiddenField ID="hdBranchRt" runat="server" Value='<%# Eval("RoutingNumber") %>' />
                                <asp:HiddenField ID="hdCurrencyCode" runat="server" Value='<%# Eval("CurrencyCode") %>' />
                                <asp:HiddenField ID="hdTnxType" runat="server" Value='<%# Eval("GlAccountType") %>' />
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
