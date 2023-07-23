<%-- 
    Document   : more_view
    Created on : Oct 26, 2022, 3:24:59 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background: #2691d9">
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary">All jobs</h5>
                    <%
                        String loc = request.getParameter("loc");
                        String cat = request.getParameter("cat");
                        String msg = "";

                        JobDAO dao = new JobDAO(DBConnect.getConn());
                        List<jobs> list = null;
                        if ("lo".equals(loc) && "ca".equals(cat)) {
                            list = new ArrayList<jobs>();
                            msg = "not available please enter correct category and location";
                        } else if ("lo".equals(loc) || "ca".equals(cat)) {
                            list = dao.getJobsORLocationAndCate(cat, loc);
                        } else {
                            list = dao.getJobsAndLocationAndCate(cat, loc);
                        }
                        if (list.isEmpty()) {
                    %>
                    <h4 class="text-center text-denger">job not avilable</h4>  
                    <%
                        }
                        if (list != null) {

                            for (jobs j : list) {
                    %>
                    <div class="card mt-2">
                        <div class="card-body">
                            <h6><%= j.getTitle()%></h6>
                            <p><%=  j.getDescription()%></p>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location:<%= j.getLocation()%>" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Category:<%= j.getCategory()%>" readonly>
                                </div>
                            </div>
                            <h6>publis date:<%= j.getPdate().toString()%></h6>
                            <div class="text-center">
                                <a href="one_view.jsp?id=<%= j.getId()%>" class="btn btn-success btn-sm
                                   text-white">view more</a>
                                    <a href="apply.jsp?id=<%= j.getId() %>" class="btn btn-success btn-sm
                                       text-white">apply</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
} else{
                    %>
                    <h4 class="text-center text-primary"><%= msg %></h4>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
