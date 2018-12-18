<%@ Page Title="EFT: Help" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Help.aspx.cs" Inherits="EFT_Proj.Help.Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #vtab
        {
            margin: auto;
            width: 980px;
            height: 100%;
        }
        #vtab > ul > li
        {
            width: 180px; /*height: 25px;*/
            background-color: #f5f5f5 !important;
            list-style-type: none;
            display: block;
            text-align: center;
            margin: auto;
            padding: 10px 0 10px;
            border: 1px solid #fff;
            position: relative;
            border-right: none;
            opacity: .7;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=70)";
            filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
            cursor: help;
        }
        /*#vtab > ul > li.home {
    background: url('home.png') no-repeat center center;
}
#vtab > ul > li.login {
    background: url('login.png') no-repeat center center;
}
#vtab > ul > li.support {
    background: url('support.png') no-repeat center center;
}*/
        
        #vtab > ul > li.selected
        {
            opacity: 1;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
            filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100);
            border: 1px solid #ddd;
            border-right: none;
            z-index: 10;
            background-color: #fafafa !important;
            position: relative;
        }
        #vtab > ul
        {
            float: left;
            width: 180px;
            text-align: left;
            display: block;
            margin: auto 0;
            padding: 0;
            position: relative;
            top: 30px;
        }
        #vtab > div
        {
            background-color: #ffffff;
            margin-left: 180px;
            border: 1px solid #ddd;
            min-height: 500px;
            padding: 15px 20px 20px 30px;
            position: relative;
            z-index: 9;
            -moz-border-radius: 10px;
        }
        #vtab > div > h4
        {
            color: #065291;
            font-size: 1.2em;
            border-bottom: 1px dotted #065291;
            padding-top: 5px;
            margin-top: 0;
        }
        
        #vtab > ul > li.selected
        {
            border-right: 1px solid #fff !important;
        }
        #vtab > ul > li
        {
            border-right: 1px solid #ddd !important;
        }
        #vtab > div
        {
            /*z-index: -1 !important;*/
            left: 1px;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var $items = $('#vtab>ul>li');
            $items.mouseover(function () {
                $items.removeClass('selected');
                $(this).addClass('selected');

                var index = $items.index($(this));
                $('#vtab>div').hide().eq(index).show();
            }).eq(0).mouseover();
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="vtab">
        <ul>
            <li>Outward: Repair Batch</li>
            <li>Inward: Repair Item</li>
            <li>Outward: Excel</li>
            <li>Admin: All Bank Branch</li>
        </ul>
        <div>
            <h4>
                Outward: Repair A Batch</h4>
            1. Find Batch ID from Batchwise Outward Items report
            <br />
            2. Go to Outward -> Repair page
            <br />
            3. Search a Batch by Batch ID
            <br />
            <br />
            <b>Options</b>
            <br />
            <br />
            <b>If a batch contains error and rejected by PBM</b><br />
            Send its status to <i>Remake</i>.
            <br />
            <br />
            <b>If you need to send a batch again</b>
            <br />
            Remove the file name if file name exists
            <br />
            Change batch status to <i>Ready to Send</i><br />
            <br />
            <b>If there is problem to finalize a batch</b><br />
            Change batch status to <i>Final</i>.
            <br />
            <br />
            <b>If Settlement Date is wrong<br />
            </b>Select correct date and click change button.
            <br />
            <br />
            <b>Deleting a Batch</b>
            <br />
            Change the Settlement Date to an obsolete date like <b>01/01/1900 </b>and it will
            not be shown on reports. This is a different approach to make a batch obsolete.
            <br />
            <br />
            <b>If you need to regenerate xml file</b>
            <br />
            Remove its current file name and it will be ready again for XML generation.
            <br />
            <br />
            <b>If user doesn&#39;t Unlock a batch<br />
            </b>Unlock it using the unlock button.
            <br />
        </div>
        <div>
            <h4>
                Inward: Repair An Item</h4>
            1. Find Item ID from <i><b>Inward Items</b></i> report
            <br />
            2. Go to <i>Inward -> Repair</i> page
            <br />
            3. Search an Item by that ID
            <br />
            <br />
            <b>Option</b>
            <br />
            <b>
                <br />
                If Settlement Date is wrong<br />
            </b>Select correct date and click change button.
            <br />
            <br />
            <b>If Beneficiary Branch is wrong<br />
            </b>Select correct branch and click change button.<br />
            <br />
            <b>If Operational Branch is wrong<br />
            </b>Select correct branch and click change button.<br />
            <br />
            <b>If Item Status is wrong<br />
            </b>Select correct status and click change button.<br />
            <br />
            <b>Deleting an Item</b>
            <br />
            Change the Settlement Date to an obsolete date like <b>01/01/1900 </b>and it will
            not be shown on reports. This is a different approach to make an item obsolete.
            <br />
            <br />
            <h4>
                Return Not Sent
            </h4>
            <strong>1.</strong> Delete old return from repair page&nbsp;&nbsp;
            <br />
            <strong>2.</strong> Repair main item status -&gt; <em><strong>InwardMakerReturned</strong></em>
            <strong>
                <br />
                3.</strong> Send return again
            <br />
        </div>
        <div>
            <h4>
                Outward: Download Sample Excel File for EFTT</h4>
            <br />
            &nbsp;&nbsp;&nbsp; <a href="../media/sample.xls">&nbsp;<img width="48px" alt="Download"
                src="../media/images/excel.png" />
            </a>
        </div>
        <div>
            <h4>
                Admin: All Bank Branch</h4>
            <b>Upload from excel file</b><br />
            <br />
            1. Column B : Branch Name<br />
            2. Column C : Routing Number<br />
            <br />
            3. Row 1 : Header Text<br />
            4. Data starts from Row 2<br />
        </div>
    </div>
</asp:Content>
