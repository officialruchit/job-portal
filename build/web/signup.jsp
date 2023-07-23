<%-- 
    Document   : signup
    Created on : Oct 7, 2022, 11:40:45 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #2691d9">
        <%@include file="navbar.jsp" %>
       
        <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">

                                <h5>Ragistation</h5>
                            </div>
                            <c:if test="${not empty succMsg}">
                                <h4 clas="text-center text-success">${succMsg}</h4>
                                <c:remove var="succMsg" />
                            </c:if>
                            
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label>enter full name </label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
                                </div>
                                
                                 <div class="form-group">
                                    <label>enter qualification </label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="qua">
                                </div>
                                
                                 <div class="form-group">
                                    <label>enter email </label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
                                </div>
                                
                                <div class="form-group">
                                    <label>enter password </label>
                                    <input type="password" class="form-control" id="exampleInputPassword" name="ps">
                                </div>
                                <button type="submit" class="btn btn-primary badge-pill bln-block">login</button>
                            </form>



                        </div>

                    </div>

                </div>

            </div> 
   
        
        </body>
</html>
