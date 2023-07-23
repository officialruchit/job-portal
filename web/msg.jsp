<%-- 
    Document   : msg
    Created on : Nov 7, 2022, 12:12:17 AM
    Author     : Lenovo
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.contact"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.Touch"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body >
                 <c:if test="${userObj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="navbar.jsp" %>
        <div class="col-md-12">
            <div class="card paint-card ">
                <div class="card-body ">

                    <table class="table table-primary">
                        <thead>
                            <tr>
                                <th scope="col">name</th>
                                <th scope="col">no</th>
                                <th scope="col">mail</th>
                                <th scope="col">msg</th>
                                <th scope="col">delete</th>
                            </tr>
                        </thead>
                       
                                 <%
                        Touch t = new Touch(DBConnect.getConn());
                        List<contact> list = t.getAllMsg();
                        for (contact c : list) {%>

                    <tbody>
                        <tr>
                            <td><%= c.getName()%></td>
                        <td><%= c.getNo()%></td>
                        <td><%= c.getMail()%></td>
                        <td><%= c.getMsg()%></td>
                        <td><a href="deleteMsg?id=<%= c.getId() %>">delete</a></td>
                        </tr>


                    </tbody>
                    
                    <%}
                    %>

                </div>
            </div>
        </div>

        <%

        %>

                        
                    </table>





           

       
    </body>
</html>
