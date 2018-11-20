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
            <div id="demo">Evaluate</div>
            <form>
                <!-- <table boredr="1">
                     <tbody>
                         <tr>
                             <td>TEAMWORK</td>
                             <td><input type="radio" name="radio_tw" value="option1">1</td>
                             <td><input type="radio" name="radio_tw" value="option2">2</td>
                             <td><input type="radio" name="radio_tw" value="option3">3</td>
                             <td><input type="radio" name="radio_tw" value="option4">4</td>
                             <td><input type="radio" name="radio_tw" value="option5">5</td>
                             <td><input type="radio" name="radio_tw" value="option6">6</td>
                             <td><input type="radio" name="radio_tw" value="option7">7</td>
                             <td><input type="radio" name="radio_tw" value="option8">8</td>
                             <td><input type="radio" name="radio_tw" value="option9">9</td>
                             <td><input type="radio" name="radio_tw" value="option10">10</td>
                         </tr>
                         <tr>
                             <td>ATHLETISM</td>
                             <td><input type="radio" name="optradio_a" value="option1">1</td>
                             <td><input type="radio" name="optradio_a" value="option2">2</td>
                             <td><input type="radio" name="optradio_a" value="option3">3</td>
                             <td><input type="radio" name="optradio_a" value="option4">4</td>
                             <td><input type="radio" name="optradio_a" value="option5">5</td>
                             <td><input type="radio" name="optradio_a" value="option6">6</td>
                             <td><input type="radio" name="optradio_a" value="option7">7</td>
                             <td><input type="radio" name="optradio_a" value="option8">8</td>
                             <td><input type="radio" name="optradio_a" value="option9">9</td>
                             <td><input type="radio" name="optradio_a" value="option10">10</td>
                         </tr>
                         <tr>
                             <td>TECHNIQUE</td>
                             <td><input type="radio" name="optradio_t" value="option1">1</td>
                             <td><input type="radio" name="optradio_t" value="option2">2</td>
                             <td><input type="radio" name="optradio_t" value="option3">3</td>
                             <td><input type="radio" name="optradio_t" value="option4">4</td>
                             <td><input type="radio" name="optradio_t" value="option5">5</td>
                             <td><input type="radio" name="optradio_t" value="option6">6</td>
                             <td><input type="radio" name="optradio_t" value="option7">7</td>
                             <td><input type="radio" name="optradio_t" value="option8">8</td>
                             <td><input type="radio" name="optradio_t" value="option9">9</td>
                             <td><input type="radio" name="optradio_t" value="option10">10</td>
                         </tr>
                         <tr>
                             <td>COMMENTS</td>
                             <td colspan="10"><textarea  maxlength="250" rows="4" cols="100"></textarea></td>
                         </tr>
                     </tbody>
                 </table>
                 <input type="submit">
             </form>
         </div>
 
         <hr>
         <div>  -->



                <spring:form modelAttribute="fr" action="${pageContext.request.contextPath}/registerFormHandling.htm" method="POST">  
                    <table>



                        <tr>
                            <td> <spring:label path="teamwork">Teamwork</spring:label></td>  
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>
                            <td> <spring:radiobutton name="radio_tw" path="teamwork"/> </td>

                        </tr>
                        <tr>
                            <td> <spring:label path="athletism">Athletism</spring:label></td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="athletism"/> </td>

                        </tr>

                        <tr>
                            <td> <spring:label path="technique">Technique</spring:label></td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                            <td> <spring:radiobutton name="radio_a" path="technique"/> </td>
                        </tr>

                        <tr> 
                            <td> <spring:label path="comments">Comments</spring:label></td>  
                            <td colspan="10"> <spring:textarea  path="comments"  rows="3" cols="100"/> </td>
                        </tr>
                    </table>
                </spring:form>
        </div>
        <script>
            function myFunction() {

                var x = document.getElementById("player").value;
                document.getElementById("demo").innerHTML = " <h1>Evaluate: " + x + "</h1>";
            }
        </script>
    </body>
</html>
