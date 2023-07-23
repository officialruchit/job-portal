<%-- 
    Document   : apply
    Created on : Nov 6, 2022, 10:15:55 PM
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
    <body style="background-color: #2691d9">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            JobDAO j = new JobDAO(DBConnect.getConn());
            jobs job = j.getJobId(id);


        %>
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="card">
            <div class="card-body">

 <c:if test="${not empty succMsg}">
                                <h4 clas="text-center text-success">${succMsg}</h4>
                                <c:remove var="succMsg" />
                            </c:if>

                <form action="image" method="post" enctype="multipart/form-data">
                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label>name</label>
                            <input type="text" class="form-control" name="name" placeholder="name">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Email</label>
                            <input type="email" class="form-control" name="mail" placeholder="Email">
                        </div>


                        <div class="form-group col-md-6">
                            <label>Title</label>
                            <input type="text" class="form-control" name="title" value="<%= job.getTitle()%>"  placeholder="title">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Location</label>
                            <input type="text" class="form-control" name="location" placeholder="location" value="<%= job.getLocation()%>">
                        </div>



                    </div>


                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">phone No.</label>
                            <input type="text" class="form-control" name="no">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputCity">cv</label>
                            <input type="file" class="form-control" name="image">
                        </div>


                    </div>

                    <button type="submit" class="btn btn-primary">Apply</button>
                </form>
            </div>
        </div>
    </body>
</html>
