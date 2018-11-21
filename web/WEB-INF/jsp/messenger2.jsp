<%-- 
    Document   : menupage
    Created on : 14 Νοε 2018, 11:44:58 μμ
    Author     : aroum
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>beta Messenger</title>
    </head>
    <body>
        <h1>Hello</h1>





        <div>
            <c:forEach items="${messages}" var="message">
                ${message.sender.username}<br>

                ${message.receiver.username}<br>
                <br>
                ${message.text}<br>

            </c:forEach>

            <c:forEach items="${conversation}" var="msg">
                
                <br>
                ${msg.text}<br>

            </c:forEach>
        </div>
    </body>
</html>
