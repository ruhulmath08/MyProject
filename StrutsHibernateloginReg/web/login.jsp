<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h2>User Login</h2>
        <s:form action="login" method="post">
            <s:textfield label="Username" name="userlogin.username" />
            <s:password label="Password" name="userlogin.password" />
            <s:submit value="Login" />
        </s:form>
        <a href="registration.jsp" >Registration</a>
    </body>
</html>
