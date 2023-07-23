<%-- 
    Document   : edit_profile
    Created on : Oct 27, 2022, 1:39:26 PM
    Author     : Lenovo
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                 <h5>edit profile</h5>
                            </div>
                            <form  action="update_profile" method="post">
                                <input type="hidden" name="id" value="${userObj.id}">
                                
                                <div class="form-group">
                                    <label>enter name</label>
                                    <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedly="email-help" name="name" value="${userObj.name}">
                                </div>
                                 <div class="form-group">
                                    <label>enter qualification</label>
                                    <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedly="email-help" name="qua" value="${userObj.qualification}">
                                </div>
                                <div class="form-group">
                                    <label>enter Email</label>
                                    <input type="email" required="required" class="form-control" id="exampleInputEmail1" aria-describedly="email-help" name="email" value="${userObj.email}">
                                </div>
                                <div class="form-group">
                                    <label>enter Password</label>
                                    <input type="password" required="required" class="form-control" id="exampleInputEmail1" aria-describedly="email-help" name="ps" value="${userObj.password}">
                                </div>
                                <button type="submit" class="btn btn-primary badge-pill btn-block">update</button>
                                    
                            </form> 
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
