<%-- 
    Document   : booking_manage
    Created on : 11-Nov-2018, 23:47:16
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
    </head>
    <body>

        <h1>My Active Events</h1>


        <table border="1">
            <c:forEach items="${myActiveReservationList}" var="current">
                <tr>
                    <td><c:out value="${current.courtReservationID}" /><td>
                    <td><c:out value="${current.courtId.name}" /><td>
                    <td><c:out value="${current.date}" /><td>
                    <td><c:out value="${current.hours.hour}" /><td>
                </tr>
            </c:forEach>
        </table>


        <a href="${pageContext.request.contextPath}/booking_creation.htm"><h1>Create new booking</h1></a><br/>
        <br>
        <a href="${pageContext.request.contextPath}/booking_modify.htm"><h1>Modify booking</h1></a><br/>
        <br>
        <a href="${pageContext.request.contextPath}/booking_manage.htm"><h1>Delete booking</h1></a><br/>
    </body>
</html>
