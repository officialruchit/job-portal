<%-- 
    Document   : login
    Created on : Oct 7, 2022, 1:15:01 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <%@include file="allCss.jsp" %>
        <style>
            body{
                background: #2691d9;
            }
        </style>
        
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <div class="container-fluid">
            <div class="row p-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">

                                <h5>login pages</h5>
                                <c:if test="${not empty succMsg}">
                                    <h4 clas="text-center text-danger">${succMsg}</h4>
                                    <c:remove var="succMsg" />
                                </c:if>
                            </div>   

                            <form action="loginServlet" method="post">
                                <div class="form-group">
                                    <label>enter email </label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
                                </div>
                                <div class="form-group">
                                    <label>enter password </label>
                                    <input type="password" class="form-control" id="exampleInputPassword" name="password">
                                </div>
                                <button type="submit" class="btn btn-primary badge-pill bln-block">login</button>
                            </form>



                        </div>

                    </div>

                </div>

            </div> 
            
    </body>
</html>
