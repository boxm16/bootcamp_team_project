<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title> beta Messenger</title>


        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <c:forEach items="${messages}" var="message">

        <div class="wrapper">
            <div class="chat-box">
                <div class="chat-head">
                    <h2>Chat Box ${message.receiver.username}</h2>
                    <img src="https://maxcdn.icons8.com/windows10/PNG/16/Arrows/angle_down-16.png" title="Expand Arrow" width="16">
                </div>
                <div class="chat-body">
                    <div class="msg-insert">

                        <c:forEach items="${messages}" var="message">
                            <div class="msg-send"> ${message.text}</div>
                        </c:forEach> 

                        <div class="msg-receive"> Received message </div>
                    </div>
                    <div class="chat-text">
                        <textarea placeholder="Send"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach> 

    <script type="text/javascript" src="<c:url value="/resources/newjavascript.js" />"></script>
     <link href="<c:url value="/resources/newcss.css" />" rel="stylesheet">

</body>

</html>