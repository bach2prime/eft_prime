<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="RoleManagement.aspx.cs" Inherits="EFT_Proj.Admin.RoleManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">

//        $(document).ready(function () {
//            $("#TreeView1").click(function (e) { SelectAllChildNodes(e) });
//        });

//        function SelectAllChildNodes(e) 
//        {
//            var obj3 = e;
//            var obj = e.target;
//            var treeNodeFound = false;

//            var checkedState;
//            if (obj.tagName == "INPUT" && obj.type == "checkbox") {
//                var treeNode = obj;
//                checkedState = treeNode.checked;
//                do {
//                    obj = obj.parentNode;
//                } while (obj.tagName != "TABLE")

//                var parentTreeLevel = obj.rows[0].cells.length;
//                var parentTreeNode = obj.rows[0].cells[0];
//                var tables = obj.parentNode.getElementsByTagName("TABLE");
//                var numTables = tables.length;
//                if (numTables >= 1) {
//                    for (iCount = 0; iCount < numTables; iCount++) {
//                        if (tables[iCount] == obj) {
//                            treeNodeFound = true;
//                            iCount++;
//                            if (iCount == numTables) {
//                                return;
//                            }
//                        }
//                        if (treeNodeFound == true) {
//                            var childTreeLevel = tables[iCount].rows[0].cells.length;
//                            if (childTreeLevel > parentTreeLevel) {
//                                var cell = tables[iCount].rows[0].cells[childTreeLevel - 1];
//                                var inputs = cell.getElementsByTagName("INPUT");
//                                inputs[0].checked = checkedState;
//                            }
//                            else {
//                                return;
//                            }
//                        }
//                    }
//                }
//            }
//        }

        function checkBox_Click(e) {
            SelectAllChildNodes(e);
            return;
        }

        function AddEvent() {
            var checkBoxes = document.getElementsByTagName("input");
            for (var i = 0; i < checkBoxes.length; i++) {
                if (checkBoxes[i].type == "checkbox") {
                    checkBoxes[i].attachEvent("onclick", checkBox_Click);
                }
            }
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h3>
        Add New Role</h3>
    <div style="width: 50%;">
        <table cellpadding="5" cellspacing="0" width="100%">
            <tr>
                <td class="rightAlign" style="width: 120px;">
                    Select Role
                </td>
                <td>
                    <asp:DropDownList CssClass="dropDown" ID="ddlRole" AppendDataBoundItems="true" runat="server"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="rightAlign">
                    Role Name
                </td>
                <td>
                    <asp:TextBox CssClass="textBox" ID="txtRoleName" runat="server" TabIndex="2" Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="rightAlign" valign="top">
                    Select Pages
                </td>
                <td valign="top">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TreeView ID="TreeView1" runat="server" ShowCheckBoxes="All">
                            </asp:TreeView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="padding-top: 20px;">
                    <asp:Button ID="btnAdd" runat="server" CssClass="buttonStyle" TabIndex="4" Text="Add / Update"
                        OnClick="btnAdd_Click" ValidationGroup="group1" />&nbsp;
                    <asp:Button ID="btnClear" runat="server" TabIndex="5" CssClass="buttonStyle70" Text="Clear"
                        OnClick="btnClear_Click" Visible="false" />
                        <br />
                        <asp:Panel runat="server" ID="PanelError" CssClass="messageBox" >
                        <asp:Label Text="Error" ID="labelError" runat="server"></asp:Label>
                        </asp:Panel>
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>
