<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Ajax.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #loader{
            display:none;
        }
    </style>
</head>    
<body>
    <form id="form1" runat="server">
        <div>
            <input type="text" placeholder="Enter Your Name" id="UName"/>
            <br /><br />

            <input type="text" placeholder="Enter Your SurName" id="SName"/>
            <br /><br />

            <input type="button" value="Submit" id="btn"/>
            <br />

            <h2 id="result"></h2>

            <div id="loader">
                <img src="Images/loader.gif" height="100" width="100" />
            </div>
        </div>
    </form>
    <script src="Script/JQuery.js"></script>   

    <script>
        $(document).ready(function () {
            $("#btn").click(function () {
                //debugger;
                var UName = $("#UName").val();
                var SName = $("#SName").val();
                if (UName == "" || SName == "")
                {
                    alert("All Fields are Required...");
                }
                else
                {
                    $.ajax({
                        url: 'WebForm1.aspx/Getdata',
                        type: 'post',
                        contentType: 'application/json',
                        data: JSON.stringify({ UName: UName, SName: SName }),
                        dataType: 'json',
                        beforeSend: function () {
                            $("#loader").show();
                            //$("#result").text("Processing....");
                        },
                        success: function (result, status, xhr) {
                            $("#result").text(result.d);
                            $("#loader").hide();
                        },
                        error: function (xhr, status, result) {
                            alert(xhr);
                            alert(status);
                            $("#result").text(result.d);
                        },
                        //complete: function (xhr, status) {
                        //    alert(status);
                        //}
                    })
                }
            })
        })
    </script>
</body>
</html>
