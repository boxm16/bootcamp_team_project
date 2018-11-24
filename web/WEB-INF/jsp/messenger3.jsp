<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title> beta Messenger</title>
        

        <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value="/resources/newjavascript.js" />"> </script> 

</head>
<body>

<div class="container">

<h3 class=" text-center">Messaging</h3>

<div class="messaging">

      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Recent requests</h4>
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

            <div class="chat_list ">
             <c:forEach items="${messages}" var="message">

                <div class="chat_people">
                  

                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5> ${message.match.booker.username} <span class="chat_date">${message.match.date}</span></h5>
                  <p>${message.text}</p>
                </div>
              </div>
           </c:forEach> 
  
            </div>

            <div class="chat_list active_chat">

              <div class="chat_people">

                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>

                <div class="chat_ib">
                  <h5>  <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div>
           
                    
          </div>

        </div>
          

        <div class="mesgs">

          <div class="msg_history">
             <c:forEach items="${messages}" var="message">

            <div class="incoming_msg">

              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>

              <div class="received_msg">

                <div class="received_withd_msg">

                    <p>
                            ${message.text}

                                           
                    </p>
                  <span class="time_date"> ${message.match.date}</span>
                </div>
              </div>
            </div>

<!--            <div class="outgoing_msg">
              <div class="sent_msg">
                <p></p>
                <span class="time_date">  </span> </div>

            </div>
                                </c:forEach> 

          </div>-->
<br>
          <div >
            <div class="input_msg_write text-center">
<!--              <input type="text" class="write_msg" placeholder="Type a message" />-->
                 
                    <button type="button" class="btn btn-outline-primary btn-rounded waves-effect">Accept</button>
 
                    <button type="button" class="btn btn-outline-danger btn-rounded waves-effect" >Deny</button>

            </div>
          </div>

        </div>

      </div>
            
    
    </div></div>
 

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
    </body>
    </html>