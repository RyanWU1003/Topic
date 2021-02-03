<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
	<script src="${path }/css/javascripts/jquery-3.5.1.min.js"/></script>
    <link rel="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Suez+One&display=swap');

          html,body{
              height: 100vh;
          }
          .page-wrapper{
              min-height: 100%;
          }

          header{
              font-family: 'Suez One', serif;
              background-color: rgb(111, 192, 79);
              box-sizing: border-box;
          }

          .header-links a{
              text-decoration: none;
              font-size: 0.9em;
              color: black;
          }

          .navbar{
              height: 70px;
              box-sizing: border-box;
              padding: 0;
              color: white;
              overflow: hidden;
              position: sticky;
          }
          li{
              width: 130px;
              border-left: 1px solid gray;
              box-sizing: border-box;
              padding-left:18px;
          }

          li a{
              color: rgb(44, 44, 44);
          }
    </style>
    <script>
      $(function(){
      $(".showMyCart").click(function(){
		  if(!($(".mycart").hasClass("show"))){
				$(".mycart").show();
				$(".mycart").addClass("show");
				
			}else{
				$(".mycart").hide();
				$(".mycart").removeClass("show");
				
			}
		})
  })
    </script>
</head>
<body>
    <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12  text-center">
                    <h2 class="my-md-3 site-title">Animal</h2>
                </div>
            </div>
            </div>
        </div>

            <nav class="navbar navbar-expand-lg  bg-light p-0 sticky-top">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarNav">
                  <ul class="navbar-nav navbar-right ">
                    <li class="nav-item">
                      <a class="nav-link" href="${path}/home.jsp">首頁</a>
                    </li>
                    <li class="nav-item ">
                      <a class="nav-link showMyCart" href="#"><i class="fa fa-shopping-cart"></i><span class="p-1" id="badge">0</span></a>
                    </li>
                  </ul>
                </div>
              </nav>
            </header>


</body>
</html>