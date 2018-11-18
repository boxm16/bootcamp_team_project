<%-- 
    Document   : menupage
    Created on : 14 Νοε 2018, 11:44:58 μμ
    Author     : aroum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="userjs.js"></script>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
    </head>
    <body>
        <h1>Hello ${users.getUsername()}</h1>
        
<div class="container">
	<div class="row">
		<div class="col-sm-4 col-md-4 user-details">
            <div class="user-image">
                <img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/football-player-2-607908.png" alt="Karan Singh Sisodia" title="Karan Singh Sisodia" class="img-circle">
            </div>
            <div class="user-info-block">
                <div class="user-heading">
                    <h3>${sports.getSports()}</h3>
                </div>
                <ul class="navigation">
                    <li class="active">
                        <a data-toggle="tab" href="http://localhost:8080/seek_play/person.htm">
                            <span class="glyphicon glyphicon-user">personal infos</span>
                        </a>
                    </li>
                    
                    <li>
                        <a data-toggle="tab" href="#events">
                            <span class="glyphicon glyphicon-calendar"> plan </span>
                        </a>
                    </li>
                </ul>
                                
            </div>
        </div>
	</div>
</div>
    </body>
</html>
