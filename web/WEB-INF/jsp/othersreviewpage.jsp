<%-- 
    Document   : menupage
    Created on : 14 Νοε 2018, 11:44:58 μμ
    Author     : aroum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>        
        
        
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
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
 /*---------- star rating ----------*/
.flex-display {
    display: flex;
}
.star-rating {
    display: flex;
    align-items: center;
    font-size: 3em;
    justify-content: center;
    margin-top: 50px;
}
.back-stars {
    display: flex;
    color: #bb5252;
    position: relative;
    text-shadow: 4px 4px 10px #843a3a;
}
.front-stars {
    display: flex;
    color: #FFBC0B;
    overflow: hidden;
    position: absolute;
    text-shadow: 2px 2px 5px #d29b09;
    top: 0;
}

        </style>
       
        <title>Menu Page</title>
        <script>$(document).ready(function() {
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
            <a href="http://localhost:8080/seek_play/star.htm" data-toggle="tab"><button type="button" id="rank" class="btn btn-primary" ><h4><span class="glyphicon glyphicon-star" aria-hidden="true"></span></h4>
                
                </button></a>
        </div>
        <div class="btn-group" role="group">
            <a href="http://localhost:8080/seek_play/request.htm" data-toggle="tab"><button type="button" id="messages" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                <div class="hidden-xs">Requests</div>
                </button></a>
        </div>
        <div class="btn-group" role="group">
            <a href="http://localhost:8080/seek_play/person.htm" data-toggle="tab"><button type="button" id="personalinfos" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">Personal Infos</div>
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
            <a href="http://localhost:8080/seek_play/index.htm" data-toggle="tab"><button type="button" id="search" class="btn btn-default" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                <div class="hidden-xs">Log Out</div>
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
                <a href="http://localhost:8080/seek_play/others.htm" data-toggle="tab"><button type="button" id="others" class="btn btn-primary" data-toggle="tab"><h4><span class="glyphicon glyphicon-open" aria-hidden="true"></span></h4>
                    
                    </button></a>
            </div>
            <div class="btn-group" role="group">
                <a href="http://localhost:8080/seek_play/unfinished.htm" data-toggle="tab"><button type="button" id="unfinished" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                    <div class="hidden-xs">Unfinished Reviews</div>
                </button></a>
            </div>            
        </div>     
    <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active center" id="tab1">
          <div class="container">
            <div class="row center">
                <div class="col-xs-12 col-md-12">
                    <div class="well well-sm">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 text-center" >
                                <h1 class="rating-num">${star}</h1>
                                <div class="star-rating">
                                    <div class="back-stars">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <div class="front-stars" style="width:${stars}%">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-md-12 text-center">
                                <div class="row rating-desc">
                                    <div class="col-xs-2 col-md-2 text-right">
                                        <span class="fa fa-group" hidden=true"></span>Teamwork
                                    </div>
                                    <div class="col-xs-8 col-md-9">
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                                aria-valuemin="0" aria-valuemax="10" style="width:${team}%">
                                                <span class="sr-only">${team}%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end 5 -->
                                    <div class="col-xs-2 col-md-2 text-right">
                                        <span class="fa fa-heartbeat"></span>Athletism
                                    </div>
                                    <div class="col-xs-8 col-md-9">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                                aria-valuemin="0" aria-valuemax="100" style="width: ${athlet}%">
                                                <span class="sr-only">${athlet}%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end 4 -->
                                   <div class="col-xs-2 col-md-2 text-right">
                                        <span class="fa fa-line-chart"></span>Technique
                                    </div>
                                    <div class="col-xs-8 col-md-9">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                                aria-valuemin="0" aria-valuemax="100" style="width:${tech}%">
                                                <span class="sr-only">${tech}%</span>
                                            </div>
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
      </div>
    </div>
    
    </div>
          
    
    </body>
</html>
