<%-- 
    Document   : APLLY
    Created on : Nov 13, 2022, 2:12:56 AM
    Author     : Lenovo
--%>

<%@page import="com.entity.apply"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.Applyjob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="allCss.jsp" %>
    </head>
    <body>
         <%@include file="navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
         <div class="col-md-12">
            <div class="card paint-card ">
                <div class="card-body ">

                    <table class="table table-primary">
                        <thead>
                            <tr>
                                <th scope="col">name</th>
                                <th scope="col">mail</th>
                                <th scope="col">Title</th>
                                <th scope="col">location</th>
                                <th scope="col">no</th>
                                <th scope="col">image</th>
                                <th scope="col">delete</th>
                            </tr>
                        </thead>
                       
                                 <%
                        Applyjob a= new Applyjob(DBConnect.getConn());
                        List<apply> list = a.all();
                        for (apply c : list) {%>

                    <tbody>
                        <tr>
                            <td><%= c.getName()%></td>
                        <td><%= c.getMail()%></td>
                        <td><%= c.getTitle() %></td>
                        <td><%= c.getLocation() %></td>
                        <td><%= c.getNo() %></td>
                        <td><%= c.getImage() %></td>
                        <td><a href="deleteImage?id=<%= c.getId() %>">delete</a></td>
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
