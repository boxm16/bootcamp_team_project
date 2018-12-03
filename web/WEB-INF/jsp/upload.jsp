<%-- 
    Document   : upload
    Created on : 27-Nov-2018, 21:17:57
    Author     : Herc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <spring:form method="POST" modelAttribute="book" action="insertbook" enctype=" multipart/form-data"/>
        <table>
            <tr>
                Image
                <td>
                    <input type="file" name="cover"/>
                </td>
                <td><spring:errors path="image" cssClass="error"> </spring:errors></td>
                </tr>
            </table>             
         </spring:form>

    <h1>Hello World!</h1>

    <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
     <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
</body>
</html>
