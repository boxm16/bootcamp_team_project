<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head> 

    <body       >
        <p>Welcome to Seek & Play!</p>


        <form autocomplete="on"  action="${pageContext.request.contextPath}/loginFormHandling.htm" method="POST">
            <h1>Log in</h1> 
            <p> 
                <label  > Your username </label>
                <input id="username" name="username" required="required" type="text" placeholder="myusername"/>
            </p>
            <p> 
                <label > Your password </label>
                <input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
            </p>
            <div>${message}</div>
            <p class="login button"> 
                <input type="submit" id="submit" value="Login" /> 
            </p>
            <p class="change_link">
                Not a member yet ?
                <a href="http://localhost:8080/seek_play/goToRegisterForm.htm">Go to register page</a>
            </p>
        </form>
        <a href="http://localhost:8080/seek_play/adduser.htm">Add one user</a><br/>
      

    </body>
</html>
