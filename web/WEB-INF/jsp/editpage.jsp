<%@ taglib uri="http://www.springframework.org/tags/form" prefix="forms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>    
        <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Menu Page</title>

        <script>$(document).ready(function () {
                $(".btn-pref .btn").click(function () {
                    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
                    // $(".tab").addClass("active"); // instead of this do the below 
                    $(this).removeClass("btn-default").addClass("btn-primary");
                });
            });
        </script>  

    </head>
    <body>

        <div class="col-lg-12 col-sm-12">

            <div class="card hovercard">

                <div class="card-background">
                    <img class="card-bkimg" alt="" src="https://blog.oxforddictionaries.com/wp-content/uploads/football-1.jpg">
                </div>
                <div class="useravatar">
                    <img alt="" src="https://www.paris2018.com/wp-content/uploads/2016/04/football_228-1-125x125.png">
                </div>
                <div class="card-info"><b><span class="card-title">${users.getUsername()}</span></b></div>

            </div>
            <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/star.htm" data-toggle="tab"><button type="button" id="rank" class="btn btn-default" ><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <div class="hidden-xs">Rank</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/request.htm" data-toggle="tab"><button type="button" id="messages" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            <div class="hidden-xs">Requests</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/person.htm" data-toggle="tab"><button type="button" id="personalinfos" class="btn btn-primary" href="#tab1" data-toggle="tab"><h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span></h4>

                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/event.htm" data-toggle="tab"><button type="button" id="event" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                            <div class="hidden-xs">Events</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/search.htm" data-toggle="tab"><button type="button" id="search" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            <div class="hidden-xs">Search</div>
                        </button></a>
                </div>
                <div class="btn-group" role="group">
                    <a href="http://localhost:8080/seek_play/index.htm" data-toggle="tab"><button type="button" id="logout" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                            <div class="hidden-xs">Log Out</div>
                        </button></a>
                </div>
            </div>

            <div class="well">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab1">




                        <h5>Edit Personal Infos</h5>
                        <forms:form modelAttribute="users" action="edit.htm" method="GET">

                            <forms:label path="firstname" class="cols-sm-2 control-label"><b>Name</b></forms:label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <forms:input path="firstname" class="form-control" id="firstname" placeholder="Enter your Last Name"/>
                                </div>
                            </div>

                            <div class="card hovercard">

                                <div class="card-background">
                                    <img class="card-bkimg" alt="" src="https://blog.oxforddictionaries.com/wp-content/uploads/football-1.jpg">
                                </div>
                                <div class="useravatar">
                                    <img alt="" src="https://www.paris2018.com/wp-content/uploads/2016/04/football_228-1-125x125.png">
                                </div>
                                <div class="card-info"><b><span class="card-title">${users.getUsername()}</span></b></div>

                            </div>
                            <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="well">
                                <div class="btn-group" role="group">
                                    <a href="http://localhost:8080/seek_play/star.htm" data-toggle="tab"><button type="button" id="rank" class="btn btn-default" ><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                            <div class="hidden-xs">Rank</div>
                                        </button></a>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button" id="messages" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                        <div class="hidden-xs">Messages</div>
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <a href="http://localhost:8080/seek_play/person.htm" data-toggle="tab"><button type="button" id="personalinfos" class="btn btn-primary" href="#tab1" data-toggle="tab"><h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span></h4>

                                        </button></a>
                                </div>
                                <div class="btn-group" role="group">
                                    <a href="http://localhost:8080/seek_play/event.htm" data-toggle="tab"><button type="button" id="event" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                            <div class="hidden-xs">Events</div>
                                        </button></a>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button" id="search" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                        <div class="hidden-xs">Search</div>
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <a href="http://localhost:8080/seek_play/index.htm" data-toggle="tab"><button type="button" id="search" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                                            <div class="hidden-xs">Log Out</div>
                                        </button></a>
                                </div>
                            </div>

                            <div class="well">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab1">




                                        <h5>Edit Personal Infos</h5>
                                        <forms:form modelAttribute="users" action="edit.htm" method="GET">

                                            <forms:label path="firstname" class="cols-sm-2 control-label"><b>Name</b></forms:label>
                                                <div class="cols-sm-10">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                        <forms:input path="firstname" class="form-control" id="firstname" placeholder="Enter your Last Name"/>
                                                </div>
                                            </div>

                                            <forms:label path="lastname" class="cols-sm-2 control-label"><b>Last Name</b></forms:label>
                                                <div class="cols-sm-10">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                        <forms:input path="lastname" class="form-control" id="lastname"  placeholder="Enter your Last Name"/>
                                                </div>
                                            </div>

                                            <div class="form-group ">
                                                <a href="https://deepak646.blogspot.com/" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">CONFIRM</a>
                                            </div>

                                        </forms:form>




                                        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                                        <!-- Include all compiled plugins (below), or include individual files as needed -->
                                        <script src="js/bootstrap.min.js"></script>

                                    </div>
                                </div>

                            </div>    
                            <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
                             <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
                            </body>
                            </html>
