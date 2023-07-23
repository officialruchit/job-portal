<%-- 
    Document   : add_job
    Created on : Oct 8, 2022, 12:49:55 AM
    Author     : Lenovo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="container p-2">
            <div class="col-md-10 offset-md-1">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center text-success">

                            <c:if test="${not empty succMsg}">
                                 <div class="alert alert-warning" role="alert">${succMsg}</div>
                                 <c:remove var="succmsg"/>
                            </c:if>
                            add job
                        </div>
                        
                        <form action="addServlet" method="post">
                            
                            
                            <div class="form-group">
                                <label>enter title  </label>
                                <input type="text" name="title" class="form-control" />

                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>location </label>

                                    <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
                                        
                                        <option selected>choose</option>
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

                                <div class="form-group col-md-4">
                                    <label>category </label>

                                    <select name="category" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected>choose</option>
                                        <option value="it">it</option>
                                        <option value="devloper">devloper</option>
                                        <option value="banking">banking</option>
                                        <option value="teacher">teacher</option>
                                    </select>

                                </div>
                                <div class="form-group">
                                    <label>status</label>

                                    <select name="status" class="form-control" >                             

                                        <option  class="Actiive" value="active">active</option>
                                        <option class="Inactiive" value="inactive">inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>enter description</label>

                                <textarea required rows="6" cols="" name="desc" class="form-control"></textarea>

                            </div>
                            <button class="btn btn-success">publish job</button>
                        </form>

                    </div>

                </div>

            </div>

        </div>

    </body>
</html>
