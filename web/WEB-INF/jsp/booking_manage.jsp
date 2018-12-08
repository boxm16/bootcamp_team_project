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

        <script>

            $(document).ready(function () {

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
    </head>
    <body>

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
      <form:form modelAttribute="gameRequest" method="POST" action="${pageContext.request.contextPath}/handleGameRequestForm.htm">
          <form:input path="status"/>
        <button type="submit">Send Request</button>
    </form:form>
        <div id="output">jjjj</div>
</div>
        <script>
            

            function reply_click(clicked_id)
            {
               var courtReservationId=clicked_id;
               
               
                 alert(clicked_id);
                 
                 
              
                    $("#output").empty()
                  
             
                    $.ajax({
                        url: 'findAvaliablePlayersForThisGameByRest.htm?courtReservationId=' + courtReservationId,
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
                
                 
                 
                 
            }


        </script>

    <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
     <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
</body>
</html>
