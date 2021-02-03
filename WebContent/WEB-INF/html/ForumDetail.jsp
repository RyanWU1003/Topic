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
	<script type="text/javascript" src="${path}/css/productPage.js"></script> 
<script >
 $(function(){
// 	//非同步討論版提交檔案
// $("#sett").submit(function (e) {
// 	  e.preventDefault();
// 		var formData = new FormData(this);
// 		 console.log("upload");
//     $.ajax({
//     	type: 'POST',
//         url: 'fileuploadcontroller',
//         data:formData,
//         // dataType: 'json', async: false,  
//         cache:false, // 不需要cache
//        processData: false, // jQuery預設會把data轉為query String, 所以要停用
//        contentType: false, // jQuery預設contentType為'application/x-www-form-urlencoded; charset=UTF-8', 且不用自己設定為'multipart/form-data'
//        dataType: 'json',
//         success: function (data) {
        
//         	 console.log(data.img);
              
//         }
//     });

    
// })
  

 });
</script>

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
 

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

<div class="list-group" >
<h2>${title}</h2> 
<c:forEach var="forumdata" items="${forumdata}">
 <c:choose>
 <c:when test="${forumdata.content=='[此樓層文章已由原作者刪除]'}">
  <table> 
 <tr> 	<td style="opacity: 0.5">${forumdata.content}</td>	 </tr>	
 <hr>
 </table>
 </c:when>  
 
 
 
  <c:when test="${forumdata.content!='[此樓層文章已由原作者刪除]'}">
    <table style="max-width: 900px;min-width: 800px;"> 
  	<c:if test="${forumdata.img!=null}">
		<td ><img  src="${url}${forumdata.img}"  height="200" width="200" /></td>
		   </c:if>						
			<td >${forumdata.content}</td>			
	     </tr>	
		<tr>	<td style="opacity: 0.6;">${forumdata.account}</td></tr>			
		<tr>	<td >${forumdata.date}</td></tr>
 		 <tr>	<td >#${forumdata.fl}</td></tr>
 		<tr> 
 		 <hr>		
  </table> 
 	
 <c:if test="${forumdata.account==user}"> 
  <div   class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">---</button>
  <div class="dropdown-menu" >
  <a class="dropdown-item" href="goeditor?forumid=${id}&fdid=${forumdata.fdid}">編輯文章</a>

  <a class="dropdown-item" href="delete?forumid=${id}&fdid=${forumdata.fdid}&fl=${forumdata.fl}">刪除文章</a>
  </div>  
  </div>
  </c:if>
 </c:when>
 </c:choose>	
</c:forEach>


 <button><a href="goforum?currpage=0" class="show-update">回列表</a> </button> 
  <button><a href="goeditor?forumid=${id}&fdid=0" class="show-update">回覆</a> </button>      
      
    
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