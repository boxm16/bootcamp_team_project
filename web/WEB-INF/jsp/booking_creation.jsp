<%-- 
    Document   : booking_creation
    Created on : 11-Nov-2018, 23:46:58
    Author     : Herc
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            }
            );

        </script>
    </head>
    <body>
        <h1>Let's create a new event</h1>
        Select a Court;


        <form:form modelAttribute="courtReservation" method="GET" action="${pageContext.request.contextPath}/handleEventCreationForm.htm">


            <form:select id="court" name="court" path="courtId.id">
                <c:forEach items="${courtList}" var="courtList">
                <option value="${courtList.id}">${courtList.name}</option>
            </c:forEach>
        </form:select>


        <form:input id="datepicker" type="date"  name="date" path="date"/>

        <form:select id="output" path="hours.hoursId" ></form:select>



        <form:button>Create Event</form:button>
    </form:form>


    <script>




    </script>

</body>
</html>
