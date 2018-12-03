<%-- 
    Document   : user_page
    Created on : 11-Nov-2018, 23:46:02
    Author     : Herc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome user ${user.username}</h1><br>

        <a href="http://localhost:8080/seek_play/goToReviewForm.htm">Review Player</a><br>
        <hr>
        <a href="http://localhost:8080/seek_play/booking_manage.htm">Go to booking room</a>


        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
    </body>
</html>
