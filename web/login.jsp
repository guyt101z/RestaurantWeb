<%-- 
    Document   : index
    Created on : Jun 14, 2012, 10:16:05 AM
    Author     : diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="./LoginServlet" method="POST">
            Email:<input type="text" name="email"><br>
            Password:<input type="password" name="password">
            <input type="submit" value="Login">
        </form>
    </body>
</html>
 