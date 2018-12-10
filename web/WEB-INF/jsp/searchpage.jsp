<%-- 
    Document   : menupage
    Created on : 14 Νοε 2018, 11:44:58 μμ
    Author     : aroum
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>   

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
                    <a href="http://localhost:8080/seek_play/search.htm" data-toggle="tab"><button type="button" id="search" class="btn btn-primary" href="#tab1" data-toggle="tab"><h4><span class="glyphicon glyphicon-search" aria-hidden="true"></span></h4>

                        </button></a>
                </div>
               
            </div>
    
            <div class="well">
                <div class="tab-content">
                    <div class="tab-pane fade in active">
                        <H3><B>Search for Player</B></H3>
                        <input type="text" name="texts" id="mytext" placeholder="Enter Username"/>
                        <table><div id="text"></div></table>

                    </div>
                </div>
            </div>

        </div> 

        <script>
            $(document).ready(function () {

                $(".btn-pref .btn").click(function () {
                    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");

                    $(this).removeClass("btn-default").addClass("btn-primary");
                });

                $("#mytext").keyup(function () {

                    var text = $(this).val();
                    $.ajax({
                        url: 'find.htm?texts=' + text,

                        contentType: 'application/json',
                        success: function (result) {

                            $("#text").empty();
                            var jsonobj = $.parseJSON(result);

                            $.each(jsonobj, function (i, item) {
                                $tr = $('<tr>').append(
                                        $('<a href="http://localhost:8080/seek_play/profile.htm?username="'+item+'".htm">').text(item)
                                        );
                                $("#text").append($tr);
                            });
                        }
                    });

                });

            });


        </script>

        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
    </body>
</html>
