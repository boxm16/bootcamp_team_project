<%-- 
    Document   : reviews
    Created on : 11-Nov-2018, 23:48:38
    Author     : Herc
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>
    </head>
    
    
     <body style=" background-image: url(resources/star.jpeg);background-size: cover">

              <div class="useravatar" style="  display: inline-block;">
                    <img alt="${users.getUsername()}" src="https://media.licdn.com/dms/image/C5603AQF_gHn6AmLcFQ/profile-displayphoto-shrink_800_800/0?e=1549497600&v=beta&t=da7MT2GIQ56_Q9WLjb7QjX0dUDFMxsrQB41UYjDFma0" class="profpic">
                
            
                    <div style=" display: inline-block; color: white;"><b><span class="card-title">${users.getUsername()}</span></b></div>
                    <a href="http://localhost:8080/seek_play/index.htm"><button type="button" class="btn-pref btn" style="background-color: transparent; border-color: transparent; color: white; "><span class="glyphicon glyphicon-off"></span>
                        </button></a>
                
          </div>
            
            <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/star.htm" data-toggle="tab"><button type="button" id="rank" class="btn btn-default" ><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <div class="hidden-xs">Ranks</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/messenger3.htm" data-toggle="tab"><button type="button" id="messages" class="btn btn-default" href="#tab2" data-toggle="tab" ><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            <div class="hidden-xs">Requests</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/person.htm" data-toggle="tab"><button type="button" id="personalinfos" class="btn btn-default" href="#tab1" data-toggle="tab" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            <div class="hidden-xs">Personal Infos</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/booking_manage.htm" data-toggle="tab"><button type="button" id="event" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                            <div class="hidden-xs">Events</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/search.htm" data-toggle="tab"><button type="button" id="search" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            <div class="hidden-xs">Search</div>
                        </button></a>
                </div>
               
            </div>
            <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/myreviews.htm" data-toggle="tab"><button type="button" id="my" class="btn btn-default" ><span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                            <div class="hidden-xs">My Reviews</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/others.htm" data-toggle="tab"><button type="button" id="others" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-open" aria-hidden="true"></span>
                            <div class="hidden-xs">Others Reviews</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/goToReviewForm.htm" data-toggle="tab"><button type="button" id="unfinished" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                            <div class="hidden-xs">Unfinished Reviews</div>
                        </button></a>
                </div>
            </div>
<!--        <div class="well" >-->
              
    
    
    
    
    
    
    
    
        <h1>Review your co-players</h1>
        <div class="container">


            <table border="1" class="table table-hover">
                
                <c:forEach items="${pendingReviewList}" var="current">

                    <tr onclick="reply_click(this.id)" id ="${current.id}">
                        <td>${current.id}</td>
                        <td>${current.requestReceiver.username}</td>
                        <td>${current.match.courtId.name}</td>
                        <td>${current.match.date}</td>
                        <td>${current.match.hours.hour}</td>

                    </tr>
                </c:forEach>
            </table>


            <div>
                <spring:form modelAttribute="review" action="${pageContext.request.contextPath}/reviewFormHandling.htm" method="POST">  
                    <div id="dispaly"></div>
                    <input type="hidden" id="game_request_id" name="gameRequestId" value="" />
                    <table>

                        <tr>
                            <td> <spring:label path="teamwork">Teamwork</spring:label></td> 
                            <td> <spring:radiobuttons path="teamwork" items="${Grades}" label="Teamwork"/> </td>

                        </tr>

                        <tr>
                            <td> <spring:label path="athletism">Athletism</spring:label></td> 
                            <td> <spring:radiobuttons path="athletism" items="${Grades}" label="Athletism"/> </td>

                        </tr> 
                        <tr>
                            <td> <spring:label path="technique">Technique</spring:label></td> 
                            <td> <spring:radiobuttons path="technique" items="${Grades}" label="Technique"/> </td>

                        </tr>
                        <tr> 
                            <td> <spring:label path="comments">Comments</spring:label></td>  
                            <td> <spring:textarea  path="comments"  rows="3" cols="100"/></td>
                        </tr>
                    </table>
                        <input type="submit">
                </spring:form>
            </div>
        </div> 
        <script>

            function reply_click(clicked_id)
            {

                document.getElementById("game_request_id").value = clicked_id;
                alert(document.getElementById("game_request_id").value);
            }


            function selectPersonForReview(event) {
                alert(event.target);
                document.getElementById("dispaly").innerHTML = "Hello World";
            }

        </script>

         <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">

        <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 


    </body>
</html>
