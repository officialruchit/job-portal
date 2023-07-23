<%-- 
    Document   : one_view
    Created on : Oct 26, 2022, 12:01:36 PM
    Author     : Lenovo
--%>

<%@page import="com.entity.jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
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
                    
                    <%
                    int id=Integer.parseInt(request.getParameter("id"));
                    JobDAO job=new JobDAO(DBConnect.getConn());
                    jobs j=job.getJobId(id);
                    
                    %>
                    
                    <div class="card mt-5">
                        <div class="card-body">
                            <h6>Title : <%= j.getTitle() %></h6>
                            <p>description : <%= j.getDescription()  %></p>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly="">
                                </div>
                                <div class="form-group col-md-3">
                                  <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory()%>" readonly="">
                                </div>
                                
                                
                            </div>
                                <h6>publish Date :<%= j.getPdate() %></h6>
                                 <div class="text-center">
                                   
                                       <a href="apply.jsp?id=<%= j.getId() %>" class="btn btn-success btn-sm
                                       text-white">apply</a>
                                </div>
                            
                        </div>
                    </div>
                                
                </div>
            </div>
        </div>
    </body>
</html>
