<%@ taglib uri="http://www.springframework.org/tags/form" prefix="forms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style rel="stylesheet" id="bootstrap-css">
            /* USER PROFILE PAGE */
            .card {
                margin-top: 20px;
                padding: 80px;
                background-color: rgba(214, 224, 226, 0.2);
                -webkit-border-top-left-radius:5px;
                -moz-border-top-left-radius:5px;
                border-top-left-radius:5px;
                -webkit-border-top-right-radius:5px;
                -moz-border-top-right-radius:5px;
                border-top-right-radius:5px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            .card.hovercard {
                position: relative;
                padding-top: 0;
                overflow: hidden;
                text-align: center;
                background-color: #fff;
                background-color: rgba(255, 255, 255, 1);
            }
            .card.hovercard .card-background {
                height: 130px;
            }
            .card-background img {
                -webkit-filter: blur(25px);
                -moz-filter: blur(25px);
                -o-filter: blur(25px);
                -ms-filter: blur(25px);
                filter: blur(1px);
                margin-left: -100px;
                margin-top: -200px;
                min-width: 130%;
            }
            .card.hovercard .useravatar {
                position: absolute;
                top: 15px;
                left: 0;
                right: 0;
            }
            .card.hovercard .useravatar img {
                width: 100px;
                height: 100px;
                max-width: 100px;
                max-height: 100px;
                -webkit-border-radius: 50%;
                -moz-border-radius: 50%;
                border-radius: 50%;
                border: 5px solid rgba(255, 255, 255, 0.5);
            }
            .card.hovercard .card-info {
                position: absolute;
                bottom: 14px;
                left: 0;
                right: 0;
            }
            .card.hovercard .card-info .card-title {
                padding:0 5px;
                font-size: 20px;
                line-height: 1;
                color: #262626;
                background-color: rgba(255, 255, 255, 0.1);
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
            }
            .card.hovercard .card-info {
                overflow: hidden;
                font-size: 12px;
                line-height: 20px;
                color: #737373;
                text-overflow: ellipsis;
            }
            .card.hovercard .bottom {
                padding: 0 20px;
                margin-bottom: 17px;
            }
            .btn-pref .btn {
                -webkit-border-radius:0 !important;
            }
            .main-center{
                margin-top: 30px;
                margin: 0 auto;
                max-width: 400px;
                padding: 10px 40px;
                background:#009edf;
                color: #FFF;
                text-shadow: none;
                -webkit-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
                -moz-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
                box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
            }
            .main-login{
                background-color: #fff;
                /* shadows and rounded borders */
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
                -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

            }

        </style>
       
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
    </body>
</html>
