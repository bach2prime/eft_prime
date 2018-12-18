
function showCheckItemDetails(chkno, inout, bankCode) {
    if (typeof (bankCode) === 'undefined')
        bankCode = '';

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = 'CheckItemProcess' + bankCode + '.aspx?edrId=' + chkno + '&inout' + inout;
    var checkId = { chkno: chkno };

    var r = window.showModalDialog(url, [], "dialogwidth: 1024px; dialogheight: 768px; resizable: yes; dialogHide:yes");

    /*if (r == "stimeout") {
    alert("Your session has been expired.You will be redirected to a login page......");
    window.location.href = "../login.aspx";

    }
    else  */
    if (r == "cancel" || r == null) {
        javascript: __doPostBack('ctl00$MainContent$PostBack', '');
    }
}

function showOutwardItemDetails(chkno, type) {

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = 'ItemDetails.aspx?edrId=' + chkno + '&type=' + type;
    var checkId = { chkno: chkno };

    var r = window.showModalDialog(url, a, "dialogwidth: 724px; dialogheight: 768px; resizable: yes; dialogHide:yes");

   
}

function showCheckItemDetailsFinal(chkno, inout, bankCode) {
    if (typeof (bankCode) === 'undefined')
        bankCode = '';

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = 'CheckItemProcessFinal' + bankCode + '.aspx?edrId=' + chkno + '&inout' + inout;
    var checkId = { chkno: chkno };

    var r = window.showModalDialog(url, a, "dialogwidth: 1024px; dialogheight: 768px; resizable: yes; dialogHide:yes");

    //    if (r == "stimeout") {
    //        alert("Your session has been expired.You will be redirected to a login page......");
    //        window.location.href = "../login.aspx";

    //    }
    //    else
    if (r == "cancel" || r == null) {
        javascript: __doPostBack('ctl00$MainContent$PostBack', '');
    }

}

function showMakerDetails(chkno, from) {

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = 'MakerProcess.aspx?edrId=' + chkno + '&from=' + from;
    var checkId = { chkno: chkno };

    var r = window.showModalDialog(url, a, "dialogwidth: 1024px; dialogheight: 768px; resizable: yes; dialogHide:yes");

    if (r == "stimeout") {
        alert("Your session has been expired.You will be redirected to a login page......");
        window.location.href = "../login.aspx";

    }
    else if (r == "cancel" || r == null) {
        window.location.reload(true);
    }

}

function showCheckerDetails(chkno, from) {

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = 'CheckerProcess.aspx?edrId=' + chkno + '&from=' + from;
    var checkId = { chkno: chkno };

    var r = window.showModalDialog(url, a, "dialogwidth: 1024px; dialogheight: 768px; resizable: yes; dialogHide:yes");

    if (r == "stimeout") {
        alert("Your session has been expired.You will be redirected to a login page......");
        window.location.href = "../login.aspx";
    }
    else if (r == "cancel" || r == null) {
        window.location.reload(true);
    }

}

function showTxDetails(edrID, action) {//maker checker none


    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = 'EFTInDetails.aspx?edrID=' + edrID + '&from=' + action;
    var edrID_Id = { edrID: edrID };

    var r = window.showModalDialog(url, a, "dialogwidth: 900px; dialogheight: 768px; resizable: yes; dialogHide:yes");
    if (r == "cancel" || r == null) {
        window.location.reload(true);
    }

}

function showPopUp() {

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = '/Inward/EFTInDetails.aspx';
    var r = window.showModalDialog(url, a, "dialogwidth: 800px; resizable: yes; dialogHide:yes");
    var formid = document.getElementsByTagName("form");
    if (r != null) {
        window.location.reload(true);
    }
}


function showNoCDialog() {
    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var id = $("#cheque_id").val();

    var roleType = $("#role_type").val();
    var bankCode = $("#bank_code").val();

    if (typeof (bankCode) === 'undefined')
        bankCode = '';

    var url = '';
    if (roleType)
        url = '/Inward/NoCProcess' + bankCode + '.aspx?edrID=' + id + '&roleType=' + roleType;
    else
        url = '/Inward/NoCProcess.aspx?edrID=' + id;

    var r = window.showModalDialog(url, a, "dialogwidth: 650px; dialogheight: 300px; resizable: yes; dialogHide:yes; center:yes;");
}

function showFinalizeBatchDialog(batchId) {
    var url = '/Outward/ProcessFinalizedBatch.aspx?batchId=' + batchId;
    var r = window.showModalDialog(url, [], "dialogwidth: 900px; dialogheight: 550px; resizable: yes; dialogHide:yes; center:yes;");
}