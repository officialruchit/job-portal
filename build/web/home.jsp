<%-- 
    Document   : home
    Created on : Oct 25, 2022, 4:12:08 PM
    Author     : Lenovo
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page  isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
        <style>
            body{
                background: #2691d9;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-inline text-primary">all jobs</h5>
                    <c:if test="${not empty succMsg}">
                        <h4 class="text-center text-denger">${succMsg}</h4>
                        <c:remove var="succMsg"/>
                    </c:if>

                    <div class="card">
                        <div class="card-body">
                            <form class="form-inline" action="more_view.jsp" method="get">
                                <div class="form-group col-md-5 mt-1">
                                    <h5>location</h5>
                                </div>
                                <div class="form-group col-md-4 mt-1">
                                    <h5>Category</h5>
                                </div>
                                <div class="form-group col-md-5">
                                    <select name="loc" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected value="lo">choose..</option>
                                        <option value="odisha">odisha</option>
                                        <option value="zharkhand">zharkhand</option>
                                        <option value="gujrat">gujrat</option>
                                        <option value="bhuvneswar">bhuvneswar</option>
                                        <option value="dilhi">dilhi</option>
                                        <option value="banglore">banglore</option>
                                        <option value="chennai">chennai</option>
                                        <option value="kerla">kerla</option>


                                    </select>


                                </div>
                                <div class="form-group col-md-5">
                                    <select class="custom-select" id="inlineFormCustomSelectPref" name="cat">
                                        <option value="ca" selected>choose</option>
                                        <option value="it">it</option>
                                        <option value="devloper">devloper</option>
                                        <option value="banking">banking</option>
                                        <option value="teacher">teacher</option> 

                                    </select>

                                </div>
                                <button class="btn btn-success">submit</button>
                            </form>
                        </div>
                    </div>


                    <%
                        JobDAO job = new JobDAO(DBConnect.getConn());
                        List<jobs> list = job.getAllJobForUser();
                        for (jobs j : list) {
                    %>
                    <div class="card mt-2">
                        <div class="card-body">
                            <h6>Title :<%= j.getTitle()%></h6>
                            <%
                                if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
                            %>
                            <p><%= j.getDescription()%>.</p>
                            <%
                                } else {
                              %>
                              <p><%= j.getDescription().substring(0,120) %>...</p>
                              <%
                                }
                            %>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location:<%= j.getLocation() %>" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Category:<%= j.getCategory() %>" readonly>
                                </div>
                            </div>
                                <h6>publis date:<%= j.getPdate().toString()   %></h6>
                                <div class="text-center">
                                    <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-success btn-sm
                                       text-white">view more</a>
                                       <a href="apply.jsp?id=<%= j.getId() %>" class="btn btn-success btn-sm
                                       text-white">apply</a>
                                </div>
                               
                                
                                
                        </div>
                    </div>
                         <%
                             }
%>
                    



                </div>
            </div>
        </div>
    </body>
</html>
