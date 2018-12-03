<%-- 
    Document   : bookings_section
    Created on : 11-Nov-2018, 23:46:37
    Author     : Herc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create new event</h1>
        <a href="${pageContext.request.contextPath}/booking_creation.htm"><h1>Delete booking</h1></a><br/>
        <h1>Modify your bookings</h1>

        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
    </body>
</html>
