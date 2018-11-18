<%-- 
    Document   : reviews
    Created on : 11-Nov-2018, 23:48:38
    Author     : Herc
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <div id="demo">Avaluate</div>
            <form>
                <table boredr="1">
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
        <script>
            function myFunction() {

                var x = document.getElementById("player").value;
                document.getElementById("demo").innerHTML = " <h1>Avaluate: " + x+"</h1>";
            }
        </script>
    </body>
</html>
