<%-- 
    Document   : addmin
    Created on : Oct 8, 2022, 12:20:47 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
        <c:if test="${userObj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
         <%@include file="navbar.jsp" %>
    <h1> i am  addmin bro</h1>
    <div>
        
    </div>
    </body>
</html>
