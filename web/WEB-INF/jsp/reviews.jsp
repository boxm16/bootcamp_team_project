<%-- 
    Document   : reviews
    Created on : 11-Nov-2018, 23:48:38
    Author     : Herc
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>
    </head>
    <body>
        <h1>Review your co-players</h1>
        <div class="container">


            <table border="1" class="table table-hover">
                <c:forEach items="${pendingReviewList}" var="current">

                    <tr onclick="reply_click(this.id)" id ="${current.id}">
                        <td>${current.id}</td>
                        <td>${current.requestReceiver.username}</td>
                        <td>${current.match.courtId.name}</td>
                        <td>${current.match.date}</td>
                        <td>${current.match.hours.hour}</td>

                    </tr>
                </c:forEach>
            </table>








            <div>
                <spring:form modelAttribute="review" action="${pageContext.request.contextPath}/reviewFormHandling.htm" method="POST">  
                    <div id="dispaly"></div>
                    <input type="hidden" id="game_request_id" name="gameRequestId" value="" />
                    <table>

                        <tr>
                            <td> <spring:label path="teamwork">Teamwork</spring:label></td> 
                            <td> <spring:radiobuttons path="teamwork" items="${Grades}" label="Teamwork"/> </td>

                        </tr>

                        <tr>
                            <td> <spring:label path="athletism">Athletism</spring:label></td> 
                            <td> <spring:radiobuttons path="athletism" items="${Grades}" label="Athletism"/> </td>

                        </tr> 
                        <tr>
                            <td> <spring:label path="technique">Technique</spring:label></td> 
                            <td> <spring:radiobuttons path="technique" items="${Grades}" label="Technique"/> </td>

                        </tr>
                        <tr> 
                            <td> <spring:label path="comments">Comments</spring:label></td>  
                            <td> <spring:textarea  path="comments"  rows="3" cols="100"/></td>
                        </tr>
                    </table>
                        <input type="submit">
                </spring:form>
            </div>
        </div> 
        <script>

            function reply_click(clicked_id)
            {
               
                document.getElementById("game_request_id").value=clicked_id;
                 alert(document.getElementById("game_request_id").value);
            }


        </script>

        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
    </body>
</html>
