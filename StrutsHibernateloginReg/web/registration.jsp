<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h2>User Registration</h2>
        <s:form action="registeruser" method="post">
            <s:textfield label="Username" name="userlogin.username" />
            <s:password label="Password" name="userlogin.password" />
            <s:textfield label="Email" name="userlogin.email" />
            <s:submit value="Submit" />
        </s:form>
    </body>
</html>
