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

        <div class="container">

            <h3 class=" text-center">Requests</h3>

            <div class="messaging">

                <div class="inbox_msg">
                    <div class="inbox_people"id="test1">
                        <div class="headind_srch">
                            <div class="recent_heading">
                                <h4>Incoming requests</h4>
                            </div>

                            <!--            <div class="srch_bar">
                                          <div class="stylish-input-group">
                                            <input type="text" class="search-bar"  placeholder="Search" >
                                            <span class="input-group-addon">
                                            <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                                            </span> </div>
                                        </div>-->
                        </div>

                        <div class="inbox_chat">

                            <div class="chat_list">     

                                <c:forEach items="${messages}" var="message">
                                    <div class="chat_people">

                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="chat_ib">
                                            <h5>${message.match.booker.username}<span class="chat_date">${message.match.date}</span><br> <a style="float: right">${message.match.hours.hour}</a></h5>
                                            <p class="plain_message">${message.match.courtname.name}</p>
                                            <h6 >${message.text}</h4>
                                                <br>
                                                </div>
                                                </div>
                                            </c:forEach> 

                                            </div>


                                            </div>
                                            </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                                            <div class="inbox_people" id="test2" style="display: none">
                                                <div class="headind_srch">
                                                    <div class="recent_heading">
                                                        <h4>Outgoing requests</h4>
                                                    </div>

                                                    <!--            <div class="srch_bar">
                                                                  <div class="stylish-input-group">
                                                                    <input type="text" class="search-bar"  placeholder="Search" >
                                                                    <span class="input-group-addon">
                                                                    <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                                                                    </span> </div>
                                                                </div>-->
                                     </div>

                                                <div class="inbox_chat">

                                                    <div class="chat_list  ">     

                                                        <div class="chat_people">

                                                            <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                                            <div class="chat_ib">
                                                                <h5>test<span class="chat_date">${message.match.date}</span><br> <a style="float: right">${message.match.hours.hour}</a></h5>
                                                                <p class="plain_message">${message.match.courtname.name}</p>
                                                                <h6 >${message.text}</h4>
                                                                    <br>
                                                                    </div>
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

                                                                                        <p>

                                                                                        </p>
                                                                                        <span class="time_date">${message.match.date}</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>


                                                                            <br>

                                                                            <form id="reply" action="" method="POST">

                                                                                <div >
                                                                                    <div class="input_msg_write text-center">
                                                                                        <!--              <input type="text" class="write_msg" placeholder="Type a message" />-->
                                                                                        <button type="submit" class="btn btn-outline-primary btn-rounded waves-effect" id="accept">Accept</button>

                                                                                        <button type="button" class="btn btn-outline-danger btn-rounded waves-effect" >Deny</button>

                                                                                    </div>
                                                                                </div>

                                                                            </form>

                                                                        </div>

                                                                    </div>

                                                                    <button onclick="myFunction()" >Click me</button>
<input type="button" value="incoming"  onClick="location.href='index.htm'"/>
<input type="button" value="outgoing"  onClick="location.href='messenger3.htm'"/>
<input type="button" value="answered"  onClick="location.href='index.htm'"/>


                                                            </div></div>

                                                        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
                                                         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">

                                                        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>

                                                        </body>
                                                        </html>