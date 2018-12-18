<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="phone.aspx.cs" Inherits="EFT_Proj.Admin.phone" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Scripts/jquery-1.6.1.min.js"></script>
    <script type="text/javascript">



        $(document).ready(function () {

            $('#txt').focus();
            //alert("Handler for .keypress() called.");
            $(document).keypress(function (event) {
                //alert(event.which);
                if ($("#txt").is(":focus") == false && event.which >= 48 && event.which <= 57) {
                    event.preventDefault();
                    $('#txt').focus();
                    $('#txt').val($('#txt').val() + (event.which - 48));
                }

            });

        });

        function cleartxt() {
            $('#txt').val('');
        }

        function out(bt) {
            $('#txt').val($('#txt').val() + (bt.value));
        }       

       
    </script>
    <style type="text/css">
        .mybutton
        {
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #3C3C3D;
            cursor: pointer;
            margin: 5px 2px;
            width: 90px;
            height: 61px;
            font-size: 30px;
        }
        /*.dialButton
        {
            background: url("../media/images/number.png") no-repeat #d9d9d9;
            width: 90px;
            height: 61px;
            margin: 5px 2px;
            border: none;
            font-size: 30px;
            color: #444;
        }*/
        .call
        {
            width: 287px;
        }
        .clearButton
        {
            font-size: 24px;
            width: 40px;
            height: 50px;
            margin: 5px 5px 5px 0;
        }
        .textbox
        {
            font-size: 24px;
            height: 45px;
            margin: 5px;
            padding: 4px;
            color: #444;
        }
        .mainbox
        {
            padding: 10px;
            width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="buttons" runat="server" CssClass="mainbox">
            <asp:TextBox ID="txt" runat="server" Width="225px" CssClass="textbox"></asp:TextBox>
            
            
            <input type="button" id="bc" value="1" onclick="cleartxt();" class="mybutton clearButton" />
            <input type="button" id="b1" value="1" onclick="out(this);" class="mybutton" />
            <input type="button" id="b2" value="2" onclick="out(this);" class="mybutton" />
            <input type="button" id="b3" value="3" onclick="out(this);" class="mybutton" />
            <input type="button" id="b4" value="4" onclick="out(this);" class="mybutton" />
            <input type="button" id="b5" value="5" onclick="out(this);" class="mybutton" />
            <input type="button" id="b6" value="6" onclick="out(this);" class="mybutton" />
            <input type="button" id="b7" value="7" onclick="out(this);" class="mybutton" />
            <input type="button" id="b8" value="8" onclick="out(this);" class="mybutton" />
            <input type="button" id="b9" value="9" onclick="out(this);" class="mybutton" />
            <input type="button" id="bstar" value="*" onclick="out(this);" class="mybutton" />
            <input type="button" id="b0" value="0" onclick="out(this);" class="mybutton" />
            <input type="button" id="bhash" value="#" onclick="out(this);" class="mybutton" />
            <asp:Button ID="bdial" runat="server" CssClass="mybutton call" Text="Call" OnClientClick="alert('call')" />
        </asp:Panel>
        <div id="o">
        </div>
    </div>
    </form>
</body>
</html>
