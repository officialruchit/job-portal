<%-- 
    Document   : about
    Created on : Nov 3, 2022, 11:27:53 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <style>
             #slider{
    width: 100%;
}
             #about{
    padding-top: 50px;
    padding-bottom: 50px;
    color: #555;
}
#about .btn{
    margin-top: 20px;
    margin-bottom: 20px;
   
}
.skill-bar p{
    margin-bottom: 6px;
    font-weight: 600;
}
.progress-bar{
    border-radius: 16px;
}
.progress{
    border-radius: 16px !important;
    margin-bottom: 20px;
}
#contact{
    background: #efefef;
    padding-top: 40px;
    padding-bottom: 40px;
    color: #777;
} 
.contact-form{
    padding: 15px;
}
.form-control{
  border-radius: 0 !important;
  border: none !important;
}
::placeholder{ 
  color: #999 !important;
}
.follow{
background-color: #fff;
padding: 10px;
margin: 15px;
}
         </style>
    </head>
    <body>
 
        
        
        
        
        
<div id="slider">
    <div id="headerSlider" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#headerSlider" data-slide-to="0" class="active"></li>
          <li data-target="#headerSlider" data-slide-to="1"></li>
          <li data-target="#headerSlider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block img-fluid" src="img/banner1.jpg" alt="First slide">
            
          </div>
          <div class="carousel-item">
            <img class="d-block img-fluid" src="img/banner2.jpg" alt="Second slide">
          </div>
          <div class="carousel-item">
            <img class="d-block img-fluid" src="img/banner3.jpg" alt="Second slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#headerSlider" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#headerSlider" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
</div>
        
        
        
        
        
        
        
        
        
        
        <section id="about">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>about us</h1>
                <div class="about-content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim repellat, vero nobis consectetur fuga aliquam inventore explicabo iste molestiae, eos non dolore quasi modi aliquid sit saepe porro eligendi aut vitae incidunt? Distinctio soluta placeat ratione quas dicta veniam at.

                </div>
                
                <div >
                                <a href="login.jsp" class="btn btn-primary">login</a>
                                <a href="signup.jsp" class="btn btn-primary">signup</a>
                            </div>
              
                
            </div>
            <div class="col-md-6 skill-bar">
         <p>UI Design jobs</p>
         <div class="progress">
            <div class="progress-bar" style="width: 80%;">80%</div>
         </div>
         <p>data analyst jobs</p>
         <div class="progress">
            <div class="progress-bar" style="width: 50%;">50%</div>
         </div>
         <p> aws cloud jobs</p>
         <div class="progress">
            <div class="progress-bar" style="width: 70%;">70%</div>
         </div>
         <p>react js devlopers jobs</p>
         <div class="progress">
            <div class="progress-bar" style="width: 88%;">88%</div>
         </div>
            </div>
        </div>
    </div>
</section>
        
        
        
<section id="contact">
    <div class="container">
        <h1>Get In Touch</h1>
       <div class="row">
        <div class="col-md-6">
            <form action="addMsg" class="contact-form">
                <div class="form-group">
                    <input type="text" class="form-control" name="name"  placeholder="enter your name"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="no" id="" placeholder="Phone no."/>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" name="mail" id="" placeholder="email"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="msg" id="" placeholder="messages"/>
                </div>
                <button type="submit" class="btn btn-primary">send message</button>
            </form>
        </div>
        <div class="col-md-6 contact-info">
            <div class="follow"><b>Address:</b><i class="fa fa-map-marker"></i>xyz road pune,IN</div>
    
        
          <div class="follow"><b>Phone no.:</b><i class="fa fa-phone" ></i></xyzi>1234567890</div>

       <div class="follow"><b>Email:</b><i class="fa-thin fa-envelopes"></i>official.ruchit@gmail.com</div>
       
       <div class="follow"><label><b>Get social:</b></label>
       
           <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href="#"><i class="fa-brands fa-twitter"></i></a>
         <a href="#"><i class="fa-brands fa-instagram"></i></a>
          <a href="#"><i class="fa fa-google-plus"></i></a>
         
       </div>

        
       </div>
    </div>
</section>
        
    </body>
</html>
