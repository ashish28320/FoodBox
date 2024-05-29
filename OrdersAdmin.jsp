
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chauhan.foodbox.Modal.DAO"%>
<%
  String name=(String)session.getAttribute("name");
if(name==null){
	session.setAttribute("msg","Please Login First");
	response.sendRedirect("index.jsp");
}else{
%>
<!DOCTYPE html>
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
   DAO db=new DAO();
   String msg=(String)session.getAttribute("msg");
		  if(msg!=null){
  %>			  
    <p class="text-center bg-warning p-2"><%=msg%></p>
  <%
   session.setAttribute("msg", null);
		  }
  %>
    <nav class="navbar navbar-expand-sm container my-3">
        <a href="AdminHome.jsp" class="navbar-brand">
          <img src="resources/foodbox-logo.png" height="35px" alt="">
          <span>Food</span>Box
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#my-navbar">
          <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="my-navbar">
            <ul class="navbar-nav mx-auto p-2">
              <li>
                <a href="AdminHome.jsp">Home</a>
              </li>
              <li>
                <a href="Enquiry.jsp">Enquiry</a>
              </li>
              <li>
                <a href="OrdersAdmin.jsp">Orders</a>
              </li>
            </ul>
            Welcome: <b> <%= name %></b>
            <a id="call" class="bg-danger" href="Logout"> Logout</a>
        </div>
    </nav>
    <section class="container">
    <h4 class="bg-success text-white p-3">Orders:</h4>
    
     <%
   
    ArrayList<HashMap> orders=db.getOrders();
    db.closeConnection();
    for(HashMap order:orders){
    %>
    	<div class="bg-warning p-2 m-2">
    	 <p>
    	 ID:<b><%=order.get("id") %></b>
    	<% String status=(String)order.get("status"); %>
    	 Status:<b><%=status %></b>
    	 <%
    	 if(status.equalsIgnoreCase("Pending")){
    		 
    	%>
    	 <a href="ChangeOrdersStatus?id=<%=order.get("id") %>&status=Accepted&page=OrderAdmin" class="btn btn-sm btn-success mx-2">Accept</a>
    	 <a href="ChangeOrdersStatus?id=<%=order.get("id") %>&status=Rejected&page=OrderAdmin" class="btn btn-sm btn-danger mx-2">Reject</a>
    	<%	 
    	 }
    	 if(status.equalsIgnoreCase("Accepted")){
    		 
    	    	%>
    	    	 <a href="ChangeOrdersStatus?id=<%=order.get("id") %>&status=Delivered " class="btn btn-sm btn-success mx-2">Delivered</a>
    	    	<%	 
    	    	 }
    	 
    	 %>
    	 </p>
    	 <hr/>
    	  <p>
    	 Items:<b><%=order.get("items") %></b>
    	 <hr/>
    	 Address:<b><%=order.get("address") %></b>
    	 <hr/>
    	 Amount:<b><%=order.get("total") %></b>
    	
    	 </p>
    	</div>
   <% 	
    }
    %>
    
    </section> 
    
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
              <form action="AdminLogin" method="post">
                  <div class="row">
                      <div class="col-sm mt-2">
                          <input class="form-control" type="text" name="id" maxlength="20" placeholder="Admin ID" required />
                      </div>
                      <div class="col-sm mt-2">
                        <input class="form-control" type="password" name="password" maxlength="10"placeholder="Password" required />
                    </div>
                    <div class="col-sm mt-2">
                      <button class="btn btn-primary">Login</button>
                    </div>
                  </div>
              </form>
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


<% }
%>