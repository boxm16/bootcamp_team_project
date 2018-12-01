<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="forms"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title> beta Messenger</title>


        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>
    <body>

        <div class="container" id="incoming">
            <h3 class=" text-center">Requests</h3>
            <div class="messaging">
                <div class="inbox_msg">
                    <div class="inbox_people" >
                        <div class="headind_srch">
                            <div class="recent_heading">
                                <h4>Incoming requests</h4>
                            </div>
                        </div>
                        <div class="inbox_chat">
                            <div class="chat_list">     
                                <c:forEach items="${incoming_requests}" var="incoming_requests">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="chat_ib">
                                            <h5>${incoming_requests.requestReceiver.username}<span class="chat_date">${incoming_request.match.date}</span><br> <a style="float: right">${incoming_request.match.hours.hour}</a></h5>
                                            <p class="plain_message">${incoming_requests.match.courtId.name}</p>
                                            <h6 >${incoming_requests.text}</h4>
                                                <br>
                                                </div>
                                                </div>
                                            </c:forEach> 
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <div class="mesgs">
                                                <div class="msg_history">
                                                    <div class="incoming_msg">
                                                        <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                                        <div class="received_msg">
                                                            <div class="received_withd_msg">
                                                                <p></p>
                                                                <span class="time_date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <form id="reply" action="" method="POST">
                                                        <div >
                                                            <div class="input_msg_write text-center">
                                                                <button type="submit" class="btn btn-outline-primary btn-rounded waves-effect" id="accept">Accept</button>
                                                                <button type="button" class="btn btn-outline-danger btn-rounded waves-effect" id="deny">Deny</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                    </div>
                                </div>
        
         <div class="container" id="outgoing" style="display: none">
            <h3 class=" text-center">Requests</h3>
            <div class="messaging">
                <div class="inbox_msg">
                    <div class="inbox_people" >
                        <div class="headind_srch">
                            <div class="recent_heading">
                                <h4>Incoming requests</h4>
                            </div>
                        </div>
                        <div class="inbox_chat">
                            <div class="chat_list">     
                                <c:forEach items="${incoming_requests}" var="incoming_requests">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="chat_ib">
                                            <h5>whaaaaaaaaaaaaa<span class="chat_date">${incoming_request.match.date}</span><br> <a style="float: right">${incoming_request.match.hours.hour}</a></h5>
                                            <p class="plain_message">testttttttttttttttttt${incoming_requests.match.courtId.name}</p>
                                            <h6 >${incoming_requests.text}</h4>
                                                <br>
                                                </div>
                                                </div>
                                            </c:forEach> 
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <div class="mesgs">
                                                <div class="msg_history">
                                                    <div class="incoming_msg">
                                                        <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                                        <div class="received_msg">
                                                            <div class="received_withd_msg">
                                                                <p></p>
                                                                <span class="time_date"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <form id="reply" action="" method="POST">
                                                        <div >
                                                            <div class="input_msg_write text-center">
                                                                <button type="submit" class="btn btn-outline-primary btn-rounded waves-effect" id="accept">Accept</button>
                                                                <button type="button" class="btn btn-outline-danger btn-rounded waves-effect" id="deny">Deny</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                    </div>
                                </div>

                                <button onclick="myFunction()" >Click me</button>
                                <input type="button" value="incoming"  onClick="location.href = 'index.htm'"/>
                                <input type="button" value="outgoing"  onClick="location.href = 'messenger3.htm'"/>
                                <input type="button" value="answered"  onClick="location.href = 'index.htm'"/>

                                <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
                                 <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
                                </body>
                                </html>