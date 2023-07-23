<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" style="color: #2691d9" href="index.jsp">job portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        
         <c:if test="${userObj.role eq 'user'}">
             <li class="nav-item active">
        <a class="nav-link" style="color: #2691d9" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>    
        </c:if>
        
     
      <c:if test="${userObj.role eq 'admin'}">
           <li class="nav-item active">
        <a class="nav-link" style="color: #2691d9" href="#">Home <span class="sr-only">(current)</span></a>
      </li>    
        <li class="nav-item active">
        <a class="nav-link" style="color: #2691d9" href="add_job.jsp"><i class="fa-solid fa-plus"></i> post job</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" style="color: #2691d9" href="view_job.jsp"><i class="fa-sharp fa-solid fa-eye"></i> view job</a>
      </li>   
      <li class="nav-item active">
          <a class="nav-link" style="color: #2691d9" href="msg.jsp"><i class="fa-sharp fa-solid fa-eye"></i> view msg</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" style="color: #2691d9" href="APLLY.jsp"><i class="fa-sharp fa-solid fa-eye"></i> view apply</a>
      </li>
      <a href="navbar.jsp"></a>
          
      </c:if> 
     
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
        <c:if test="${userObj.role eq 'admin'}">
             <a href="#" class="btn btn-lightt my-1" style="color: #2691d9"><i class="fas fa-user"></i>addmin</a>
             <a href="logout" class="btn btn-Light" style="color: #2691d9"><i class="fas fa-sign-in-alt"></i>logout</a>
             </c:if>
             <c:if test="${userObj.role eq 'user'}">
                 <a href="#" class="btn btn-Light" style="color: #2691d9" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-user"></i>${userObj.name}</a>
        <a href="logout" style="color: #2691d9" class="btn btn-Light"><i class="fas fa-sign-in-alt"></i>logout</a>
        </c:if>
        
        
        
        <c:if test="${empty userObj}">
             <a href="login.jsp" style="color: #2691d9" class="btn btn-lightt my-1"><i class="fas fa-sign-in-alt"></i>login</a>
             
        <a href="signup.jsp" style="color: #2691d9" class="btn btn-Light"><i class="fas fa-user"></i>sign up</a>
        
        </c:if>
       
    </form>
  </div>
</nav>




<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="card">
              <div class="card-body">
                  <table class="table">
                      <tbody>
                          <tr>
                              <th scope="row">name</th>
                              <th>${userObj.name}</th>
                          </tr>
                           <tr>
                              <th scope="row">qualification</th>
                              <th>${userObj.qualification}</th>
                          </tr>
                           <tr>
                              <th scope="row">email</th>
                              <th>${userObj.email}</th>
                          </tr>


                      </tbody>
                  </table>
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="edit_profile.jsp" class="btn btn-primary">edit</a>
      </div>
    </div>
  </div>
</div>
                          
                          
                          
    