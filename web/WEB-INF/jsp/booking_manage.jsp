<%-- 
    Document   : booking_manage
    Created on : 11-Nov-2018, 23:47:16
    Author     : Herc
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">  
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script>

            $(document).ready(function () {

                $("#tr").click(function () {

                });




                $("#datepicker").change(function () {
                    $("#output").empty()
                    var text = $(this).val();
                    var text2 = $("#court").val();
                    //alert(text2);
                    $.ajax({
                        url: 'findFreeTimeSlotsByRest.htm?userinput=' + text + '&userinput2=' + text2,
                        contentType: 'application/json',
                        success: function (result) {
                            //alert(result)
                            var jsonobj = $.parseJSON(result);

                            $.each(jsonobj, function (i, item) {

                                $tr = $("#output").append(
                                        // $('<td>').text(item.username),
                                        $('<option value=' + item.hoursId + '>').text(item.hour)
                                        );
                            });
                        }
                    });
                });

            }
            );

        </script>
        <script>
            $(document).ready(function () {
                $(".btn-pref .btn").click(function () {
                    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
                    // $(".tab").addClass("active"); // instead of this do the below 
                    $(this).removeClass("btn-default").addClass("btn-primary");
                });
            });
        </script>
    </head>
    <body style=" background-image: url(resources/new-event.jpg);background-size: cover">

        <div class="useravatar" style="  display: inline-block;">
            <img alt="${users.getUsername()}" src="https://media.licdn.com/dms/image/C5603AQF_gHn6AmLcFQ/profile-displayphoto-shrink_800_800/0?e=1549497600&v=beta&t=da7MT2GIQ56_Q9WLjb7QjX0dUDFMxsrQB41UYjDFma0" class="profpic">


            <div style=" display: inline-block; color: white;"><b><span class="card-title">${users.getUsername()}</span></b></div>
            <a href="http://localhost:8080/seek_play/index.htm"><button type="button" class="btn-pref btn" style="background-color: transparent; border-color: transparent; color: white; "><span class="glyphicon glyphicon-off"></span>
                </button></a>

        </div>

        <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/star.htm" data-toggle="tab"><button type="button" id="rank" class="btn btn-primary" ><h4><span class="glyphicon glyphicon-star" aria-hidden="true"></span></h4>
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
        <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/myreviews.htm" data-toggle="tab"><button type="button" id="my" class="btn btn-default" ><span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                        <div class="hidden-xs">My Reviews</div>
                    </button></a>
            </div>
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/others.htm" data-toggle="tab"><button type="button" id="others" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-open" aria-hidden="true"></span>
                        <div class="hidden-xs">Others Reviews</div>
                    </button></a>
            </div>
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/goToReviewForm.htm" data-toggle="tab"><button type="button" id="unfinished" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                        <div class="hidden-xs">Unfinished Reviews</div>
                    </button></a>
            </div>
        </div>








        <!--Creation section -->
        <h1>Let's create a new event</h1>
        Select a Court;
        <div class="container">

            <form:form id="form1" modelAttribute="courtReservation" method="POST" name="form1" action="${pageContext.request.contextPath}/handleEventCreationForm.htm">
                <form:select id="court" name="court" path="courtId.id">
                    <c:forEach items="${courtList}" var="courtList">
                        <option value="${courtList.id}">${courtList.name}</option>
                    </c:forEach>
                </form:select>
                <form:input id="datepicker" type="date"  name="date" path="date"/>
                <form:select id="output" path="hours.hoursId" ></form:select>
                    <button type="submit">Create Event</button>
            </form:form>



            <h1>My Active Events</h1>


            <table border="1" class="table table-hover" >
                <c:forEach items="${myActiveReservationList}" var="current">
                    <tr onclick="reply_click(this.id)" id ="${current.courtReservationID}">

                        <td><c:out value="${current.courtId.name}" /><td>
                        <td><c:out value="${current.date}" /><td>
                        <td><c:out value="${current.hours.hour}" /><td>
                        <td><c:out value="${current.courtReservationID}" /><td>

                        <td><a href='${pageContext.request.contextPath}/booking_delete.htm?id=${current.courtReservationID}'>DELETE BOOKING</a><td>

                    </tr>
                </c:forEach>
            </table>
            <hr>

            <table  border="1" class="table table-hover" id="output1">SELECT AVAILABLE PLAYERS FOR YOUR GAME</table>
        </div>
        <script>


            function reply_click(clicked_id)
            {
                var courtReservationId = clicked_id;

                $("#output1").empty();

                // alert("σδσδσδ");
                $.ajax({

                    url: 'findAvaliablePlayersForThisGameByRest.htm?courtReservationId=' + courtReservationId,
                    contentType: 'application/json',
                    success: function (result) {
                        // alert(result)
                        var jsonobj = $.parseJSON(result);

                        $.each(jsonobj, function (i, item) {

                            $a = $('<a href="${pageContext.request.contextPath}/booking_delete.htm?id=clicked_id">').text("Send request");

                            $tr = $('<tr>').append(
                                    $('<td>').text(item.player),
                                    $('<td>').text(item.teamwork),
                                    $('<td>').text(item.athletism),
                                    $('<td>').text(item.technique),
                                    $('<td>').text(item.technique),
                                    $('<td>').append($a),
                                    // $('<td>').append(<a href='${pageContext.request.contextPath}/booking_delete.htm?id=clicked_id'>Send Request</a>)
                                    //   $('<td><a href='${pageContext.request.contextPath}/booking_delete.htm?id=clicked_id'>Send Request</a><td>'),
                                    //$('<option value=' + item.player + '>').text(item.player)
                                    );
                            $("#output1").append($tr);
                        });
                    }
                });




            }


        </script>

        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
    </body>
</html>
