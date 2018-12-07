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

    </head>
    <body>

        <div class="col-lg-12 col-sm-12">
            <div class="card hovercard">
                <div class="card-background">
                    <img class="card-bkimg" alt="" src="https://blog.oxforddictionaries.com/wp-content/uploads/football-1.jpg">
                </div>
                <div class="useravatar">
                    <img alt="" src="https://www.paris2018.com/wp-content/uploads/2016/04/football_228-1-125x125.png">
                </div>
                <div class="card-info"><b><span class="card-title">${users.getUsername()}</span></b></div>

            </div>
            <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/star.htm" data-toggle="tab"><button type="button" id="rank" class="btn btn-default" ><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <div class="hidden-xs">Rank</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/messenger3.htm" data-toggle="tab"><button type="button" id="messages" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            <div class="hidden-xs">Requests</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/person.htm" data-toggle="tab"><button type="button" id="personalinfos" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
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
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/index.htm" data-toggle="tab"><button type="button" id="logout" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                            <div class="hidden-xs">Log Out</div>
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
                                        $('<a href="http://localhost:8080/seek_play/user.htm">').text(item)
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
