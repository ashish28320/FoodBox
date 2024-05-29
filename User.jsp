<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chauhan.foodbox.Modal.DAO"%>
<html>

<head>
  <title>FoodBox</title>
  <link rel="icon" href="resources/foodbox-logo.png" />

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

  <!-- font-awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <!-- Lightbox CSS & Script -->
  <script src="resources/lightbox/ekko-lightbox.js"></script>
  <link rel="stylesheet" href="resources/lightbox/ekko-lightbox.css"/>

  <!-- AOS CSS & Script -->
  <script src="resources/aos/aos.js"></script>
  <link rel="stylesheet" href="resources/aos/aos.css"/>

  <!-- custom css -->
  <link rel="stylesheet" href="resources/custom.css">

  <meta name="author" content="Vishal Chauhan" />
  <meta name="description" content="This is a website for Food Restaurant." />
  <meta name="keywords" content="" />
</head>

<body>

   <%
   String msg=(String)session.getAttribute("msg");
		  if(msg!=null){
  %>			  
    <p class="text-center bg-warning p-2"><%=msg%></p>
  <%
   session.setAttribute("msg", null);
		  }
  %>
    <nav class="navbar navbar-expand-sm container my-3">
        <a href="index.jsp" class="navbar-brand">
          <img src="resources/foodbox-logo.png" height="35px" alt="">
          <span>Food</span>Box
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#my-navbar">
          <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="my-navbar">
            <ul class="navbar-nav mx-auto p-2">
              <li>
                <a href="index.jsp">Home</a>
              </li>
               <li>
                <a href="Menu.jsp">Menu</a>
              </li>
              <li>
                <a href="User.jsp">Sign In/Sign Up</a>
              </li>
              <li>
                <a href=""  data-toggle="modal" data-target="#myModal">Get In Touch</a>
              </li>
              <li>
                <a href=""  data-toggle="modal" data-target="#adminLoginModal">Admin</a>
              </li>
            </ul>
            <a id="call" href="tel:9811XXXXXX"><i class="fa-solid fa-mobile-screen-button"></i> 9811XXXXXX</a>
        </div>
    </nav>
    <section class="container">
      <div class="row">
    <div class="col-sm p-3 bg-light">
    <div>
     <h5 class="text-center">User Sign In</h5>
     <form action="UserLogin" method="post"> 
                        <label>Email</label>
                        <input class="form-control" type="email" name="email" maxlength="100"placeholder="Your Email" required />
                        <br>
                        <label>Password</label>
                         <input class="form-control" type="password" name="password" maxlength="20" placeholder="Your Password" required />
                         <br>
                      <button class="btn btn-primary">Sign In</button>
              </form>
    </div>
    </div>
    
            <%
              String uemail=(String)session.getAttribute("uemail");
            
               %>
        
    <div class="col-sm  p-3 m-3 bg-dark text-white">
    <h5 class="text-center">User Sign Up</h5>
    
    <form action="UserEmailSendOTP" method="post" enctype="multipart/form-data"> 
                        <label>Email</label>
                        <input class="form-control" type="email" name="email" maxlength="100"placeholder="Your Email" required />
                        <br>
              
                      <button class="btn btn-light">Send OTP</button>
              </form>
              <br>
             
     <form action="UserOTPVerify" method="post" enctype="multipart/form-data"> 
                        <label>OTP</label>
                        <input class="form-control" type="number" name="otp" placeholder="Enter OTP" required />
                        <br>
                      <input type="hidden" name="email" value="<%=uemail%>" />
                      <button class="btn btn-warning">Verify</button>
              </form>
              <form action="UserRegister" method="post" enctype="multipart/form-data"> 
                        
                        <label>Full Name</label>
                        <input class="form-control" type="text" name="name" pattern="[a-zA-Z ]+" maxlength="50"placeholder="Your Full Name" required />
                        <br>
                        <label>Phone Number</label>
                        <input class="form-control" type="tel" name="phone" pattern="[0-9]+" maxlength="10" minlenght="10" placeholder="Your Phone number" required />
                        <br>
                        <label>Address</label>
                         <textarea class="form-control" rows="3" name="address" placeholder="Your address" required></textarea>
                         <br>
                         <label>Password</label>
                         <input class="form-control" type="password" name="password" maxlength="10"placeholder="Password" required />
                         <br>
                         <label>Photo</label>
                         <input class="form-control" type="file" name="photo">
                         <br>
                          <input type="hidden" name="email" value="<%=uemail%>" />
                      <button class="btn btn-primary">Register</button>
              </form>
    </section>
    <footer class="bg-dark p-5 text-center">
        <a href="index.jsp">
          <img src="resources/foodbox-logo.png" height="30px" alt="">
          <span>Food</span>Box
        </a>
        <br/>
        <p>&copy Rights Reserved</p>
        <p>
          <a href=""><i class="fa-brands fa-facebook"></i></a>
          <a href=""><i class="fa-brands fa-instagram"></i></a>
          <a href=""><i class="fa-brands fa-youtube"></i></a>
        </p>
    </footer>
    <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-light">
            <h5 class="modal-title" id="exampleModalLabel">Get In Touch</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          <form action="AddEnquiry" method="post">
                  <div class="row">
                      <div class="col-sm mt-2">
                          <input class="form-control" type="text" name="name" pattern="[a-zA-Z ]+" maxlength="20" placeholder="Your Name" required />
                      </div>
                      <div class="col-sm mt-2">
                        <input class="form-control" type="tel" name="phone" pattern="[0-9]+" maxlength="10" minlength="10" placeholder="Your Phone" required />
                    </div>
                    <div class="col-sm mt-2">
                      <button class="btn btn-primary">Submit</button>
                    </div>
                  </div>
              </form>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal- -->
    <div class="modal fade" id="adminLoginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-light">
            <h5 class="modal-title" id="exampleModalLabel">Admin Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          </div>
        </div>
      </div>
    </div>
</body>
<script>
    AOS.init();
    //script for scroll to top
    $("#top-button").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
    });
    //script for light box
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox();
    });

    //script for Google Sheet
  var scriptURL = "https://script.google.com/macros/s/AKfycbytC2ZbnvxCZ8LlubrshtBLJxTOYXaqkwzrydyjFzHJ7VKR-rQwJk6gsuPYTkWyxKMhKQ/exec";
    var form = document.forms['google-sheet'];
    form.addEventListener('submit', e => {
    e.preventDefault()
    fetch(scriptURL, { method: 'POST', body: new FormData(form)})
      .then(response => alert("Thanks for Contacting us..! We Will Contact You Soon..."))
      .catch(error => console.error('Error!', error.message))
    });
</script>
</script>
</html>