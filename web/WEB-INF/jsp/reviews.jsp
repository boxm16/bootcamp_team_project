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

                    <td><spring:hidden  path="reviewed.username" id="1"/></td>
                  

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
        <script>
            function myFunction() {

                var x = document.getElementById("player").value;
                document.getElementById("demo").innerHTML = " <h1>Evaluate: " + x + "</h1>";
                document.getElementById("1").innerHTML = " <h1>Avaluate: " + x + "</h1>";
                document.getElementById("1").value = x;
                document.getElementById("1").value = x;
            }
        </script>
    </body>
</html>
