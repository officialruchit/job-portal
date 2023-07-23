<%-- 
    Document   : view_job
    Created on : Oct 8, 2022, 12:24:19 PM
    Author     : Lenovo
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background: #2691d9">
         <c:if test="${userObj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="navbar.jsp" %>
       
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary">all jobs</h5>

                    <c:if test="${not empty succMsg}">
                        <div class="alert alert-warning" role="alert">${succMsg}</div>
                        <c:remove var="succmsg"/>
                    </c:if>



                    <%
                        JobDAO j = new JobDAO(DBConnect.getConn());
                        List<jobs> list = j.getAllJob();
                         for (jobs s : list) {%>


                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center texxt-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>

                            <h6><%= s.getTitle()%></h6>
                            <p>description :  <%= s.getDescription()%></p>
                            <br>
                            <div clas="form-row">

                                <div class="form-group col-md-3">
                                    <input type="text"  class="form-control form-control-sm" value="Location:<%= s.getLocation()%>" readonly>

                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="category:<%= s.getCategory()%>" readonly>

                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="status:<%= s.getStatus()%>" readonly>

                                </div>
                            </div>
                            <h6>publish date:<%= s.getPdate()%></h6>
                            <div class="text-center">
                                <a href="edit_job.jsp?id=<%= s.getId()%>" class="btn btn-sm bg-success text-white">edit</a>
                                <a href="delete?id=<%= s.getId()%>" class="btn btn-sm bg-danger text-white">delete</a>
                            </div>
                        </div>

                    </div>


                    <% }

                    %>



                </div>

            </div>

        </div>
    </body>
</html>
