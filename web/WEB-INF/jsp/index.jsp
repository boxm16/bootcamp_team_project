<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">

        <!------ Include the above in your HEAD tag ---------->     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head> 
    <body>
    <section class="login-block">
        <div class="container">
            <div class="row">
                <form autocomplete="on" class="login-form" action="${pageContext.request.contextPath}/loginFormHandling.htm" method="POST">

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
                            <!--                                     <p class="login button"> 
                                                               <input type="submit" id="submit" value="Login" /> 
                                                            </p>-->
                            <button type="submit" id="submit" class="btn btn-login float-right">Submit</button>
                        </div>
                        <p class="change_link">
                            Not a member yet ?
                            <a href="http://localhost:8080/seek_play/goToRegisterForm.htm">Go to register page</a>
                        </p>

                    </div>   



                    <div class="carousel fade-carousel slide col-md-8 banner-sec" data-ride="carousel" data-interval="4000" id="bs-carousel">
                        <!-- Overlay -->
                        <div class="overlay"></div>
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#bs-carousel" data-slide-to="1"></li>
                            <li data-target="#bs-carousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item slides active">
                                <div class="slide-1"></div>
                                <div class="hero">
                                    <hgroup>
                                        <h1>We are creative</h1>        
                                        <h3>Get start your next awesome project</h3>
                                    </hgroup>
                                    <button class="btn btn-hero btn-lg" role="button">See all features</button>
                                </div>
                            </div>
                            <div class="item slides">
                                <div class="slide-2"></div>
                                <div class="hero">        
                                    <hgroup>
                                        <h1>We are smart</h1>        
                                        <h3>Get start your next awesome project</h3>
                                    </hgroup>       
                                    <button class="btn btn-hero btn-lg" role="button">See all features</button>
                                </div>
                            </div>
                            <div class="item slides">
                                <div class="slide-3"></div>
                                <div class="hero">        
                                    <hgroup>
                                        <h1>We are amazing</h1>        
                                        <h3>Get start your next awesome project</h3>
                                    </hgroup>
                                    <button class="btn btn-hero btn-lg" role="button">See all features</button>
                                </div>
                            </div>
                        </div> 
                    </div>
                </form>
            </div>           
        </div>               
    </section>  


    <script src="<c:url value="/resources/newjavascript.js?$$REVISION$$" />"></script> 
     <link href="<c:url value="/resources/newcss2.css" />" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>