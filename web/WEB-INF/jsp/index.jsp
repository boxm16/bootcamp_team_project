<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

         <link href="<c:url value="/resources/newcss2.css"/>" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Welcome to Spring Web MVC project</title>
    </head> 

    <body>
        <form autocomplete="on" class="login-form" action="${pageContext.request.contextPath}/loginFormHandling.htm" method="POST">
            <section class="login-block">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 login-sec">
                            <h2 class="text-center">Login Now</h2>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="text-uppercase">Username</label>
                                <input class="form-control" id="username" name="username" required="required" type="text" placeholder="myusername"/>


                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="text-uppercase">Password</label>
                                <input class="form-control" id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO"/> 

                            </div>
                            <div>${message}</div>


                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input">
                                    <small>Remember Me</small>
                                </label>
                                <!--                                      <p class="login button"> 
                                                                    <input type="submit" id="submit" value="Login" /> 
                                                                </p>-->
                                <button type="submit" id="submit" class="btn btn-login float-right">Submit</button>
                            </div>
                            <p class="change_link">
                                Not a member yet ?
                                <a href="http://localhost:8080/seek_play/goToRegisterForm.htm">Go to register page</a>
                            </p>
                            </form>


                        </div>
                            
                            
                            
                       	<div class="col-md-8 banner-sec">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <div class="banner-text">
                                                <h2>This is Heaven</h2>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid" src="https://images.pexels.com/photos/7097/people-coffee-tea-meeting.jpg" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <div class="banner-text">
                                                <h2>This is Heaven</h2>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid" src="https://images.pexels.com/photos/872957/pexels-photo-872957.jpeg" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <div class="banner-text">
                                                <h2>This is Heaven</h2>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                            </div>	
                                        </div>
                                    </div>
                                </div>	   

                            </div>
                        </div>
                    </div>
                </div>
            </section>



    </body>
</html>