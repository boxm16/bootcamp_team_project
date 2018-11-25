<%-- 
    Document   : user_page
    Created on : 11-Nov-2018, 23:46:02
    Author     : Herc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <a href="http://localhost:8080/seek_play/booking_creation.htm">Go to booking Creation</a>
        
    </body>
</html>
