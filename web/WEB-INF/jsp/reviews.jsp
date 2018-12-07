<%-- 
    Document   : reviews
    Created on : 11-Nov-2018, 23:48:38
    Author     : Herc
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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



        <table border="1">
            <c:forEach items="${pendingReviewList}" var="current">
                <tr onclick="selectPersonForReview(event)">

                    <td>${current.requestReceiver.username}</td>
                    <td>${current.match.courtId.name}</td>
                    <td>${current.match.date}</td>
                    <td>${current.match.hours.hour}</td>

                </tr>
            </c:forEach>
        </table>



        <div id="dispaly"></div>




        <div>
            <spring:form modelAttribute="review" action="${pageContext.request.contextPath}/reviewFormHandling.htm" method="POST">  
                Select a Player;
                <spring:select id="player" name="player" path="reviewed.userId">
                    <c:forEach items="${playersList}" var="user">
                        <option value="${user.userId}">${user.username}</option>
                    </c:forEach>
                </spring:select>

                <table >

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

        <div class="switch">
            <input name="switch" id="one" type="radio" checked/>
            <label for="one" class="switch__label">One</label>
            <input name="switch" id="two" type="radio" />
            <label for="two" class="switch__label">Two</label>
            <input name="switch" id="three" type="radio" />
            <label for="three" class="switch__label" >Three</label>
            <div class="switch__indicator" /></div>
    </div>

    <script>

        function selectPersonForReview(event) {
            alert(event.target);
            document.getElementById("dispaly").innerHTML = "Hello World";
        }

    </script>

     <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">

    <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 


</body>
</html>
