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
        <style>* {outline: 1px solid red;
           outline-offset: -1px;}
        </style>
        </head>


        <body>
            <div class="centreButtons">
            <button onclick="myFunction1()" class="btn btn-primary" style="display:inline-block; text-align: center;">Incoming</button>
            <button onclick="myFunction2()" class="btn btn-primary" style="display:inline-block;">Outgoing</button>
            <button onclick="myFunction3()" class="btn btn-primary" style="display:inline-block;">Answered</button>
        </div>
        <div class="container" id="incoming">

            <h3 class=" text-center"> Requests</h3>
            <div class="messaging">
                <div class="inbox_msg">
                    <div class="inbox_people" >
                        <div class="headind_srch">
                            <div class="recent_heading">
                                <h4>Incoming</h4>
                            </div>
                        </div>
                        <div class="inbox_chat">
                            <div class="chat_list">     
                                <c:forEach items="${incoming_requests}" var="incoming_requests">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="chat_ib"><a id="incoming_id" style="display: block">${incoming_requests.id}</a>
                                            <h5>${incoming_requests.match.booker.username}<span class="chat_date">${incoming_request.match.date}</span><br> <a style="float: right" id="text">${incoming_request.match.hours.hour}</a></h5>
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
                                                    <div >
                                                        <div class="input_msg_write text-center">
                                                            <form id="accept" action="" method="POST"  >
                                                                <button type="submit" class="btn btn-outline-primary btn-rounded waves-effect btn-lg" id="accept" style="float:left">Accept</button>
                                                            </form>
                                                            <div>
                                                                <form id="deny" action="" method="POST"style="display:inline">
                                                                    <button type="submit" class="btn btn-outline-danger btn-rounded waves-effect btn-lg" id="deny" style="float:right">Deny</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
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
                                                        <h4>Outgoing</h4>
                                                    </div>
                                                </div>
                                                <div class="inbox_chat">
                                                    <div class="chat_list">     
                                                        <c:forEach items="${outgoing_requests}" var="outgoing_requests">
                                                            <div class="chat_people">
                                                                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                                                <div class="chat_ib">
                                                                    <h5>${outgoing_requests.requestReceiver.username}<span class="chat_date">${outgoing_requests.match.date}</span><br> <a style="float: right" id="text">${outgoing_requests.match.hours.hour}</a></h5>
                                                                    <p class="plain_message">testttttttttttttttttt${outgoing_requests.match.courtId.name}</p>
                                                                    <h6 >${outgoing_requests.text}</h4>
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
                                                                            <div >
                                                                                <div class="input_msg_write text-center">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                        <div class="container" id="answered" style="display: none">
                                                            <h3 class=" text-center">Requests</h3>
                                                            <div class="messaging">
                                                                <div class="inbox_msg">
                                                                    <div class="inbox_people" >
                                                                        <div class="headind_srch">
                                                                            <div class="recent_heading">
                                                                                <h4>Answered</h4>
                                                                            </div>
                                                                        </div>
                                                                        <div class="inbox_chat">
                                                                            <div class="chat_list">     
                                                                                <c:forEach items="${answered_requests}" var="answered_requests">
                                                                                    <div class="chat_people">
                                                                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                                                                        <div class="chat_ib">
                                                                                            <h5>${answered_requests.requestReceiver.username}<span class="chat_date">${answered_requests.match.date}</span><br> <a style="float: right" id="text">${answered_requests.match.hours.hour}</a></h5>
                                                                                            <p class="plain_message">{answered_requests.match.courtId.name}</p>
                                                                                            <h6 >${answered_requests.text}</h4>
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
                                                                                                    <div >
                                                                                                        <div class="input_msg_write text-center">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                    </div>
                                                                                </div>

                                                                                <!--                                                                                <input type="button" value="incoming"  onClick="location.href = 'messenger3.htm'"/>
                                                                                                                                                                <input type="button" value="outgoing"  onClick="location.href = 'messenger3.htm'"/>
                                                                                                                                                                <input type="button" value="answered"  onClick="location.href = 'messenger3.htm'"/>-->
                                                                                <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
                                                                                 <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
                                                                                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
                                                                                </body>
                                                                                </html>