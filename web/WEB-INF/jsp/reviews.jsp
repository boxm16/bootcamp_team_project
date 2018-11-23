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


        <a href="http://localhost:8080/seek_play/AAA.htm">Trial link</a><hr>

        <a href="http://localhost:8080/seek_play/BBB.htm">Create review Form</a>

        <div>

            Select a Player;
            <select id="player" name="player" onchange="myFunction()">
                <c:forEach items="${playersList}" var="user">
                    <option value="${user.username}">${user.username}</option>
                </c:forEach>
            </select>

            <div id="demo">

            </div>



            <spring:form commandName="fr" action="http://localhost:8080/seek_play/reviewFormHandling.htm" method="POST">  
                <table>


                    <td><spring:textarea  path="user1.username" id="1"/></td>

                    <tr>

                        <td> <spring:radiobuttons path="teamwork.grade" items="${Grades}"/> </td>

                    </tr>

                    <tr>

                        <td> <spring:radiobuttons path="athletism.grade" items="${Grades}"/> </td>

                    </tr> 
                    <tr>

                        <td> <spring:radiobuttons path="technique.grade" items="${Grades}"/> </td>

                    </tr>
                    <tr> 
                        <td> <spring:label path="comments">Comments</spring:label></td>  
                        <td colspan="10"> <spring:textarea  path="comments"  rows="3" cols="100"/> </td>
                    </tr>
                </table>
                <input type="submit">
            </spring:form>
        </div>
        <script>
            function myFunction() {

                var x = document.getElementById("player").value;
                document.getElementById("demo").innerHTML = " <h1>Evaluate: " + x + "</h1>";
                document.getElementById("1").innerHTML = " <h1>Avaluate: " + x + "</h1>";
                document.getElementById("1").value = x;
            }
        </script>
    </body>
</html>
