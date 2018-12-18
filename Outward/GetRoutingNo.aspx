<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetRoutingNo.aspx.cs" Inherits="EFT_Proj.Outward.GetRoutingNo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Get Routing Number</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript">
        function f2() {
            //if (opener != null)
            //  opener.document.getElementById("tbReceiveBank").value = document.getElementById("DropDownListBranch").value;
            var ret = $("#DropDownListBranch option:selected").text() + ':' + $("#DropDownListBranch option:selected").val();

            //document.getElementById("DropDownListBranch").text;
            window.returnValue = ret;
            window.close();
        }
        function closeAndreturnData() {
            var ret = 'return data'; //this is ur job
            window.returnValue = ret;
            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="margin: 20px 0 0 10px; width: 750px; border: 2px solid #f0f0f0;">
                <div style="padding: 10px; border: 1px solid #fff; background-color: #f5f5f5;">
                    Bank:
                    <asp:DropDownList CssClass="dropDown" AutoPostBack="true" Width="250px" ID="DropDownListBank"
                        runat="server" OnSelectedIndexChanged="DropDownListBank_SelectedIndexChanged" />
                    &nbsp; Branch:&nbsp;
                    <asp:DropDownList Width="220px" CssClass="dropDown" DataTextField="BranchName" DataValueField="RoutingNo"
                        ID="DropDownListBranch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListBranch_SelectedIndexChanged" />
                    &nbsp;&nbsp;
                    <asp:Label ID="labelDist" runat="server" Text=""></asp:Label><br />
                    <br />
                    <input style="margin-left: 350px;" type="button" class="buttonStyle" value="OK" onclick="f2();" />
                    <br />
                    <br />
                    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" DynamicLayout="false"
                        runat="server" DisplayAfter="0">
                        <ProgressTemplate>
                            <asp:Label ID="Label1" ForeColor="Green" runat="server" Text="Loading Branches . . ."></asp:Label>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
