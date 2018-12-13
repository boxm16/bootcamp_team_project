<%-- 
    Document   : menupage
    Created on : 14 Νοε 2018, 11:44:58 μμ
    Author     : aroum
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="forms"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>Menu Page</title>

        <script>$(document).ready(function () {
                $(".btn-pref .btn").click(function () {
                    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
                    // $(".tab").addClass("active"); // instead of this do the below 
                    $(this).removeClass("btn-default").addClass("btn-primary");
                });
            });
        </script>  
    </head>
    <body style=" background-image: url(resources/mainpage.jpg);background-size: cover">

        <div class="useravatar" style="  display: inline-block;">
            <img alt="${users.getUsername()}" src="https://media.licdn.com/dms/image/C5603AQF_gHn6AmLcFQ/profile-displayphoto-shrink_800_800/0?e=1549497600&v=beta&t=da7MT2GIQ56_Q9WLjb7QjX0dUDFMxsrQB41UYjDFma0" class="profpic">


            <div style=" display: inline-block; color: white;"><b><span class="card-title">${users.getUsername()}</span></b></div>
            <a href="http://localhost:8080/seek_play/index.htm"><button type="button" class="btn-pref btn" style="background-color: transparent; border-color: transparent; color: white; "><span class="glyphicon glyphicon-off"></span>
                </button></a>

        </div>

        <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/star.htm" data-toggle="tab"><button type="button" id="rank" class="btn btn-default" ><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                        <div class="hidden-xs">Ranks</div>
                    </button></a>
            </div>
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/messenger3.htm" data-toggle="tab"><button type="button" id="messages" class="btn btn-default" href="#tab2" data-toggle="tab" ><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                        <div class="hidden-xs">Requests</div>
                    </button></a>
            </div>
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/person.htm" data-toggle="tab"><button type="button" id="personalinfos" class="btn btn-default" href="#tab1" data-toggle="tab" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        <div class="hidden-xs">Personal Infos</div>
                    </button></a>
            </div>
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/booking_manage.htm" data-toggle="tab"><button type="button" id="event" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                        <div class="hidden-xs">Events</div>
                    </button></a>
            </div>
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/search.htm" data-toggle="tab"><button type="button" id="search" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        <div class="hidden-xs">Search</div>
                    </button></a>
            </div>

        </div>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1" >
                <h3 style="background-color: transparent; color: white">First Name: ${users.getFirstname()}</h3>
                <h3 style="background-color: transparent; color: white"> Last Name: ${users.getLastname()}</h3>
                <a href="http://localhost:8080/seek_play/editpersinf.htm" data-toggle="tab"><button type="button" id="following" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        <div class="hidden-xs">EDIT</div>
                    </button> </a>

                        <h3><div> Change your profile picture</div></h3>
                        <form>      
                            File to upload: <input type="file" name="img" multiple="multiple">
                            <button type="submit" value="Upload">Upload</button>
                        </form>
                        <div class="progress">
                       <div id="progressBar" class="progress-bar progress-bar-success" role="progressbar"
                            aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%</div>
                   </div>
            </div>
        </div>


        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
     <script type="text/javascript">
                $(document).ready(function(){
                    $('button[type=submit]').click(function(e){
                        e.preventDefault();
                        var form=document.forms[0];
                        var formData=new FormData(form);
                        var ajaxReq = $.ajax({
                            url: 'fileUpload.htm',
                            type: 'POST',
                            data: formData,
                            cache: false,
                            contentType: false, // λεμε να μην βαλει content-type στο request
                            processData: false, // Να μην το κάνει string για να το στειλει
                            //Callback for creating the XMLHttpRequest object
                            xhr: function () {
                               alert("create request")
                                //Get XmlHttpRequest object
                                var xhr = $.ajaxSettings.xhr();

                                //Set onprogress event handler
                                xhr.upload.onprogress = function (event) {
                                     alert("sending")
                                    var perc = Math.round((event.loaded / event.total) * 100);
                                    $('#progressBar').text(perc + '%');
                                    $('#progressBar').css('width', perc + '%');
                                };
                                return xhr;
                            },
                            beforeSend: function (xhr) {
                                 alert("before send")
                                //Reset alert message and progress bar
                                $('#alertMsg').text('');
                                $('#progressBar').text('');
                                $('#progressBar').css('width', '0%');
                            }
                        });

                        // Called on success of file upload
                        ajaxReq.done(function (msg) {
                            alert("done")
                            $('#alertMsg').text(msg);
                            $('input[type=file]').val('');
                            $('button[type=submit]').prop('disabled', false);
                        });

                        // Called on failure of file upload
                        ajaxReq.fail(function (jqXHR) {
                            $('#alertMsg').text(jqXHR.responseText + '(' + jqXHR.status +
                                    ' - ' + jqXHR.statusText + ')');
                            $('button[type=submit]').prop('disabled', false);
                        });
                    });              
                });
            </script>
    </body>
</html>
