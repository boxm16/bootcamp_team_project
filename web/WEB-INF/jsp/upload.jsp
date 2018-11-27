<%-- 
    Document   : upload
    Created on : 27-Nov-2018, 21:17:57
    Author     : Herc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <spring:form method="POST" modelAttribute="book" action="insertbook" enctype=" multipart/form-data"/>
            <table>
                <tr>
                    
                    <td>
                        Image
                        
                    </td>
                    
                    <td>
                       <input type="file" name="cover"/>
                      
                    <td><spring:errors path="image" cssClass="error"></springForm:errors></td>
                        
                    </td>
                </tr>
                
                
            </table>             
            
            
            
            
        </spring:form>
                     <h1>Hello World!</h1>
    </body>
</html>
