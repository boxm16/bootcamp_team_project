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
                    //alert(text);
                    $.ajax({
                        url: 'findFilledSlotsByRest.htm?userinput=' + text,
                        contentType: 'application/json',
                        success: function (result) {
                           // alert(result)
                            var jsonobj = $.parseJSON(result);
                           
                            $.each(jsonobj, function (i, item) {
                               // alert(item)
                                $tr = $('<tr>').append(
                                       // $('<td>').text(item.username),
                                        $('<h1><td></h1>').text(item.hour)

                                        );
                                $("#output").append($tr);
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
        <select id="court" name="court" onchange="myFunction()">
            <c:forEach items="${courtList}" var="courtList">
                <option value="${courtList.name}">${courtList.name}</option>
            </c:forEach>
        </select>

        <div id="demo">
        </div>



        <input id="datepicker" type="date" name="bday">
        <div id="output"></div>

        <form:form modelAttribute="courtReservation" method="GET" action="${pageContext.request.contextPath}/controlerName.htm">
            <form:input id="DateField" path="date"/>
            <form:input path="date" class="date" />
            
            
            
            
            
            <table>
                <tr>
                    <td>Hours</td>
                    <td><form:select path="hours" items="${hours}" itemLable="Hours" itemValue="hours"></form:select>
                                 
                </tr>
            </table>
        </form:form>


        <script>
            function timeSlots() {
                var selectedDate = document.getElementById("datepicker").value;
                document.getElementById("demo").innerHTML = " <h1>You selected date:" + selectedDate + "</h1>";
            }

            function myFunction() {

                var x = document.getElementById("court").value;
                document.getElementById("demo").innerHTML = " <h1>You selected court:" + x + "</h1>";
            }
        </script>

    </body>
</html>
