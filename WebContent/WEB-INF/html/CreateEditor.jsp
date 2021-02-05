<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" /> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" ></script>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="${path }/css/javascripts/jquery-3.5.1.min.js"/></script>
<script src="${path }/css/javascripts/jquery-ui.min.js"></script>
<link href="<c:url value="/css/index.css"/>" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="${path }/css/javascripts/ckeditor5-build-classic/build/ckeditor.js"/></script>

<link href="<c:url value="/css/editor.css"/>" rel="stylesheet">

</head>
<body>
 <nav class="navbar navbar-expand fixed-top p-0">
    <div class="container-fluid d-flex justify-content-end">
        <a class="navbar-brand" href="gohome">Home</a>
        <ul class="navbar-nav navbar-right">
          <li class="nav-item">
            <span>
            <a class="nav-link active" aria-current="page" href="select_member">我的帳號</a>
           </span>
          </li>
          <li class="nav-item">
            <span>
            <a class="nav-link" href="#"><i class="fa fa-shopping-cart"></i></a>
            <span></span>
          </span>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- 跑馬燈 -->
  <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block w-100" src="/img/cat&dog.jpg" alt="First slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="/img/柯基.jpg" alt="Second slide">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="/img/dog1.jpg" alt="Third slide">
      </div>
    </div>
  </div>

<!-- 主選單 -->
<div class="container-fluid">
  <div class="row">

    <div id="menu" class="col-12 col-md-3 col-lg-2 col-xl-2">
      <h5 class="m-3 text-muted">menu</h5>
      <div class="list-group list-group-flush">
        <a href="goforum?currpage=0" class="list-group-item list-group-item-action border-top">
          <div class="font-weight-bold">
            討論專區
          </div>
        </a>
        <a href="getAllProduct" class="list-group-item list-group-item-action">
          <div class="font-weight-bold">
           生活用品
          </div>
        </a>
        <a href="gomap?currpage=0" class="list-group-item list-group-item-action">
          <div class="font-weight-bold">
           醫療資源
          </div>
        </a>
        <a href="#" class="list-group-item list-group-item-action">
          <div class="font-weight-bold">
          美容設施
          </div>
        </a>
    
        <div class="extra-news-feed collapse">
          <a href="#" class="list-group-item list-group-item-action border-top">
            <div class="font-weight-bold">
              More bad news for Airbnb
            </div>
            <small class="text-muted">
              Top News &bull; 4,703 views
            </small>
          </a>
          <a href="#" class="list-group-item list-group-item-action">
            <div class="font-weight-bold">
              What Indians are searching for
            </div>
            <small class="text-muted">
              1hr ago &bull; 11,303 views
            </small>
          </a>
          <a href="#" class="list-group-item list-group-item-action">
            <div class="font-weight-bold">
              Unacademy hit by data breach
            </div>
            <small class="text-muted">
              6hrs ago &bull; 6,843 views
            </small>
          </a>
        </div>
    
      </div>
      <button type="button" class="btn btn-sm btn-light m-3 text-muted" data-toggle="collapse" data-target="#menu .extra-news-feed, #news-feed .toggle-btn">
        <span class="toggle-btn collapse show">
          Show more
          <i class="fas fa-chevron-down fa-sm"></i>
        </span>
        <span class="toggle-btn collapse">
          Show less
          <i class="fas fa-chevron-up fa-sm"></i>
        </span>
      </button>
    </div>

 <!-- 文章推薦 -->
    <div class="list-group">
    <br>
    <h1>發表文章</h1>
     <form action="createnewforum?forumid=${id}&${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">     
      <dxa:csrf-token/> 
         <input type="text" name="title" value="${title}" size="35" />
          <select name="species">
						<option selected>請選擇文章類別</option>
						<option value="1">狗狗專區</option>
						<option value="2">貓咪專區</option>
						<option value="3">鳥版</option>
						<option value="4">鼠版</option>
						<option value="5">爬蟲版</option>
						<option value="6">其他</option>
						
</select>
        <textarea name="content" id="editor"  >         
        </textarea>
         <input type="file" name="myfile" />
        
        <input type="submit" value="發表文章">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    <!-- 將id為editor1的textarea用ckeditor來操作 -->
      <script>
                    ClassicEditor.create(document.querySelector( 
                                '#editor'),{
                             
                            	cloudServices: {
                                    tokenUrl: 'https://77893.cke-cs.com/token/dev/3ae078b69f627bf3caf91f236b5cb6c9faf7d14cae2ce6c29e5cb66e12db',
                                    uploadUrl: 'https://77893.cke-cs.com/easyimage/upload/'
                                }
                            })
                            .then(editor=>{
                                   console.log(editor);
                            })
                            .catch(error=>{
                                   console.error(error);
                            });
            </script>
             <br>
            <br>
 <button><a href="goforum?currpage=0" class="show-update">回列表</a> </button>
    </div>


    <!-- class:row -->
  </div>
   <!-- class:container -->
</div>

<div class="showProduct container-fluid">
  <div class="site-slider px-md-4">
    <div class="row slider-one text-center">
      <div class="col-md-2 product pt-md-5">

      </div>
    </div>
  </div>
</div>






<footer class=" text-center text-lg-start">
  <div class="container p-4">
    <div class="row">
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase">Footer text</h5>
        <p>
          
        </p>
      </div>
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase">Footer text</h5>
        <p>
       
        </p>
      </div>
    </div>
  </div>


  <!-- Copyright -->
  <div class="text-center p-3" style="background-color:  rgb(87, 182, 87)">
    © 2020 Copyright:
    <a class="text-dark" href="">Animal.com</a>
  </div>
  <!-- Copyright -->
</footer>




</body>
</html>