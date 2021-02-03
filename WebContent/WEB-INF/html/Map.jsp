<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_ry8OhM_uQP_D8VjlwINRaeTvMXeOzy0&callback=initMap&libraries=&v=weekly"
	defer></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="${path }/css/javascripts/jquery-3.5.1.min.js" /></script>
<script src="${path }/css/javascripts/jquery-ui.min.js"></script>
<script type="text/javascript" src="${path }/css/map.js">
</script>
<link href="<c:url value="/css/index.css"/>" rel="stylesheet">
<script type="text/javascript" src="${path}/css/productDetail.js"></script>
<style>
#map {
	height: 400px;
	/* The height is 400 pixels */
	width: 100%;
	/* The width is the width of the web page */
}
</style>
<script>




var starting ='南投地理中心'
var  geocoder;
var address = '高雄資策會';
var init = ${init};
var zoom=7 ;
var navigation =${navigation};
if(${neww=='a'}){
	address=`${mmm.dress}`;
}
if(navigation==true){
	starting =	`${starting}`
}

var country =${country} ;
if(country == true){
	 starting = `${countryname}`;
	 zoom = 12;
}


var  lat;
var lng;
var marker
  function initMap() {	
	  if(init==true){
		  
	 var markers = [];
    var infowindows = [];
	 geocoder = new google.maps.Geocoder();  
	    // 初始化地圖
    var  map = new google.maps.Map(document.getElementById("map"), {
       zoom: zoom,               
       mapTypeId: 'terrain',        
        styles: null
   });

   geocoder.geocode( { 'address': starting  }, function(results, status) {
	    if (status == 'OK') { 
	    	 map.setCenter(results[0].geometry.location);  
	  loadMyCart();
		function loadMyCart(){
			$.ajax({
			url:"gomapjson",
			type:"POST",
			data:{'city':starting},
			dataType:"json",
			success:function(result){  	
				console.log(result) 
				 
   $.each(result,function(i,v){ 		    	
		    	markers[i] = new google.maps.Marker({
	          map: map,
	          position: {
	        	  lat: v.mappp.lat  ,
	  	        lng: v.mappp.lng
		          },
	         animation: google.maps.Animation.BOUNCE
	      });

			  infowindows[i] = new google.maps.InfoWindow( 
				  {
				     content:v.mappp.mapname,    
				            
				     position:{
				    	  lat: v.mappp.lat  ,
				  	        lng: 	  v.mappp.lng					     },
				     maxWidth: 200,
				 }

					 )
		        //點擊事件
		     var markerr = markers[i];
                    markerr.addListener('click', function () {
                    	 infowindows[i].open(map, markers[i]);	
                    })				  
  
		    })//foreach
      
			} //success
			})//ajax
		 }
	    }
    })//外框 map中心
}if(init ==false){

	 geocoder = new google.maps.Geocoder();  
	    // 初始化地圖
 var  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 15,               
    mapTypeId: 'terrain',        
     styles: null
});

geocoder.geocode( { 'address': address}, function(results, status) {
	    if (status == 'OK') { 
	    	 map.setCenter(results[0].geometry.location);  
	     	
		    var	marker = new google.maps.Marker({
	          map: map,
	          position: results[0].geometry.location,
	         animation: google.maps.Animation.BOUNCE
	      });

			var  infowindow= new google.maps.InfoWindow( 
				  {
				     content: `<h1>${mmm.mapname}</h1>`,   				            
				     position:results[0].geometry.location,
				     maxWidth: 200,
				 }
					 )
		        //點擊事件		  
                 marker.addListener('click', function () {
                 	 infowindow.open(map, marker);	
                 })			   
		 }

})	
}	if(navigation==true){
	//取得目前座標
//	 navigator.geolocation.getCurrentPosition((position) => {	
//	 lat = position.coords.latitude;
//	  lng = position.coords.longitude;
		 
	 // 載入路線服務與路線顯示圖層
	 var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();
    //初始化地址編碼
		 geocoder = new google.maps.Geocoder();  
		    // 初始化地圖
	 		var  map = new google.maps.Map(document.getElementById("map"), {
             zoom: 15,               
             mapTypeId: 'terrain',        
              styles: null
         });
	// 放置路線圖層
	  directionsDisplay.setMap(map);

geocoder.geocode( { 'address':starting }, function(results, status) {
		    if (status == 'OK') {
		 map.setCenter(results[0].geometry.location);
	 //進行地址編碼
	 geocoder.geocode( { 'address': address}, function(results2, status) {
		    if (status == 'OK') {
		     
//路線相關設定

var request;


if(${empty type or type == 1}){
 request = {
              origin:results[0].geometry.location  ,
               destination:results2[0].geometry.location ,
              travelMode: 'DRIVING'              
                        };
}
if(${type==2}){
	   request = {
	    origin: results[0].geometry.location,
	    destination: results2[0].geometry.location ,
	    travelMode: 'TRANSIT',
	    transitOptions: {modes:['BUS']}
	    }; 
	  }

  if(${type==3}){
   request = {
    origin: results[0].geometry.location,
    destination: results2[0].geometry.location ,
    travelMode: 'TRANSIT',
    transitOptions: {modes:['SUBWAY']}
    }; 
  }

// 繪製路線
directionsService.route(request, function (result3, status3) {
    if (status3 == 'OK') {
        //地圖標記   	
   	  directionsDisplay.setDirections(result3);
         }
})
//		繪製路線結束      
		      
		    } else {
		      console.log(status);
		    }
	
	          
		    
		  }); // 地址編碼結束   

		    }//地=ˋ次    

}); //第二次地址編碼
	// }); //取得目前座標結束括號


	
} 
	


//} 

	 //更改風格
     $("#dark").click(function () {
                    map.setOptions({
                        styles: style
                    });
                })
       $("#light").click(function () {
                    map.setOptions({
                        styles: null
                    });
                })

   //initmap結束
	  }
	


</script>

</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>

	<!-- 跑馬燈 -->
	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-ride="carousel">
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
					<a href="goforum?currpage=0"
						class="list-group-item list-group-item-action border-top">
						<div class="font-weight-bold">討論專區</div>
					</a> <a href="getAllProduct"
						class="list-group-item list-group-item-action">
						<div class="font-weight-bold">生活用品</div>
					</a> <a href="gomap?currpage=0"
						class="list-group-item list-group-item-action">
						<div class="font-weight-bold">醫療資源</div>
					</a> <a href="#" class="list-group-item list-group-item-action">
						<div class="font-weight-bold">美容設施</div>
					</a>

					<div class="extra-news-feed collapse">
						<a href="#"
							class="list-group-item list-group-item-action border-top">
							<div class="font-weight-bold">More bad news for Airbnb</div> <small
							class="text-muted"> Top News &bull; 4,703 views </small>
						</a> <a href="#" class="list-group-item list-group-item-action">
							<div class="font-weight-bold">What Indians are searching
								for</div> <small class="text-muted"> 1hr ago &bull; 11,303
								views </small>
						</a> <a href="#" class="list-group-item list-group-item-action">
							<div class="font-weight-bold">Unacademy hit by data breach
							</div> <small class="text-muted"> 6hrs ago &bull; 6,843 views </small>
						</a>
					</div>

				</div>
				<button type="button" class="btn btn-sm btn-light m-3 text-muted"
					data-toggle="collapse"
					data-target="#menu .extra-news-feed, #news-feed .toggle-btn">
					<span class="toggle-btn collapse show"> Show more <i
						class="fas fa-chevron-down fa-sm"></i>
					</span> <span class="toggle-btn collapse"> Show less <i
						class="fas fa-chevron-up fa-sm"></i>
					</span>
				</button>
			</div>

			<!-- 文章推薦 -->

			<div class="row align-items-start">
				<!-- 	  <table  id="ddd">非同步資料測試 -->

				<!-- 	  </table> -->

				<!--The div element for the map -->
				<div>
					<div id="map" style="min-height: 500px; min-width: 800px;"></div>

					<button id="dark" type="button">夜間模式</button>
					<button id="light" type="button">日間模式</button>
				</div>
				<!-- 	 <form  id="a1"  action="#"><input type="submit" id="b1" name="id" value="1"/></form> -->
				<div>
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">選擇縣市</button>
						<div class="dropdown-menu">

							<a class="dropdown-item" href="gomap?currpage=0">各縣市</a> <a
								class="dropdown-item" href="gomapcity?city=台北市&currpage=0">台北市</a>
							<a class="dropdown-item" href="gomapcity?city=新北市&currpage=0">新北市</a>
							<a class="dropdown-item" href="gomapcity?city=桃園市&currpage=0">桃園市</a>
							<a class="dropdown-item" href="gomapcity?city=台中市&currpage=0">台中市</a>
							<a class="dropdown-item" href="gomapcity?city=台南市&currpage=0">台南市</a>
							<a class="dropdown-item" href="gomapcity?city=高雄市&currpage=0">高雄市</a>


						</div>
					</div>

					<c:choose>
						<c:when test="${selection == 'selectClass' }">
							<c:forEach var="cityList" items="${cityList}">

								<c:if test="${mmm.id==cityList.id}">
									<div style="width: 650px; border: solid;">
										<table>
											
											<tr>
												<td class="mapname">${cityList.mapname}</td>
											
											</tr>
											<tr>
												<%-- 																<td class="id">no.${cityList.id}</td> --%>
												<td class="tel">電話：${cityList.tel}</td>
											</tr>
											<tr>
												<td class="dress">${cityList.dress}</td>

											</tr>
											<table>
												</div>
												</c:if>
												<c:if test="${mmm.id!=cityList.id}">
													<div style="width: 650px;">
														<table>
															
															<tr>
																<td class="mapname">${cityList.mapname}</td>
															</tr>
															<tr>
																<%-- 																<td class="id">no.${cityList.id}</td> --%>
																<td class="tel">電話：${cityList.tel}</td>
															</tr>
															<tr>
																<td><div class="dress">${cityList.dress}</td>
															</tr>
															</c:if>
															<tr>
																<td><a
																	href="mapselect2get?id=${cityList.id}&city=${cityList.city}"><img
																		src="/img/google-map2.png"></a></td>
															</tr>
															<tr>
																<td><div class="navigation" id="${cityList.id}">
																		<img src="/img/googlemap.jpg">
																		<form
																			action="mapselect3?&${_csrf.parameterName}=${_csrf.token}"
																			method="post">
																			<input type="hidden" name="id" value="${cityList.id}">
																			<input type="hidden" name="city"
																				value="${cityList.city}"> <input
																				class="mystart" type="text" name="starting">
																			<input class="mystart" type="submit" value="導航">
																			<br> <label class="mystart">交通方式:</label> <label
																				class="mystart"><input class="mystart"
																				type="radio" name="type" value="1" checked>自駕車</label>
																			<label class="mystart"><input class="mystart"
																				type="radio" name="type" value="2">公車</label>
																			<c:if
																				test="${cityList.city=='高雄市' or cityList.city == '台北市'}">
																				<label class="mystart"><input
																					class="mystart" type="radio" name="type" value="3">捷運</label>
																			</c:if>
																		</form>
																	</div></td>

															</tr>
														</table>
													</div>

													</c:forEach>
													<c:if test="${totalpage<=10 && totalpage>1}">
														<ul class="pagination">
															<li class="page-item"><a class="page-link"
																href="gomapcity?currpage=0&city=${countryname}">&laquo;</a></li>
															<c:forEach begin="1" end="${totalpage}" var="page">
																<c:if test="${page==currpage+1}">
																	<li class="page-item active" class="page-item"><a
																		class="page-link"
																		href="gomapcity?currpage=${page-1}&city=${countryname}">${page}</a></li>
																</c:if>
																<c:if test="${page!=currpage+1}">
																	<li class="page-item " class="page-item"><a
																		class="page-link"
																		href="gomapcity?currpage=${page-1}&city=${countryname}">${page}</a></li>
																</c:if>
															</c:forEach>
															<li class="page-item"><a class="page-link"
																href="gomapcity?currpage=${totalpage}&city=${countryname}">&raquo;</a></li>
														</ul>
													</c:if>

													<c:if test="${totalpage>10}">
														<ul class="pagination">
															<li class="page-item"><a class="page-link"
																href="gomapcity?currpage=0&city=${countryname}">&laquo;</a></li>
															<c:forEach begin="${currpage-3}" end="${currpage+7}"
																var="page">
																<c:if test="${page==currpage+1}">
																	<li class="page-item active" class="page-item"><a
																		class="page-link"
																		href="gomapcity?currpage=${page-1}&city=${countryname}">${page}</a></li>
																</c:if>
																<c:if test="${page!=currpage+1}">
																	<li class="page-item " class="page-item"><a
																		class="page-link"
																		href="gomapcity?currpage=${page-1}&city=${countryname}">${page}</a></li>
																</c:if>
															</c:forEach>
															<li class="page-item"><a class="page-link"
																href="gomapcity?currpage=${totalpage}&city=${countryname}">&raquo;</a></li>
														</ul>
													</c:if>
													</c:when>
													<c:when
														test="${selection != 'selectClass' or empty selection }">
														<div style="width: 700px;">
															<c:forEach var="MapList" items="${MapList}">
																<table>
																	
																	<tr>
																		<td class="mapname">${MapList.mapname}</td>

																	</tr>
																	<tr>
																		<%-- 																<td class="id">no.${cityList.id}</td> --%>
																		<td class="tel">電話：${MapList.tel}</td>
																	</tr>
																	<tr>
																		<td class="dress">${MapList.dress}</td>

																	</tr>
																	<tr>
																		<td><a
																			href="mapselect2get?id=${MapList.id}&city=${MapList.city}"><img
																				src="/img/google-map2.png"></a></td>
																	</tr>
																	<tr>
																		<td><div class="navigation" id="${MapList.id}">
																				<img src="/img/googlemap.jpg">
																				<form
																					action="mapselect3?&${_csrf.parameterName}=${_csrf.token}"
																					method="post">
																					<input type="hidden" name="id"
																						value="${MapList.id}"> <input
																						type="hidden" name="city" value="${MapList.city}">
																					<input class="mystart" type="text" name="starting">
																					<input class="mystart" type="submit" value="導航"><br>
																					<label class="mystart">交通方式:</label> <label
																						class="mystart"><input class="mystart"
																						type="radio" name="type" value="1" checked>自駕車</label>
																					<label class="mystart"><input
																						class="mystart" type="radio" name="type" value="2">公共運輸</label>
																					<c:if
																						test="${MapList.city=='高雄市' or MapList.city == '台北市'}">
																						<label class="mystart"><input
																							class="mystart" type="radio" name="type"
																							value="3">捷運</label>
																					</c:if>

																				</form>

																			</div></td>


																	</tr>
																</table>
															</c:forEach>
															<c:if test="${totalpage<=10 && totalpage>1}">
																<ul class="pagination">
																	<li class="page-item"><a class="page-link"
																		href="gomap?currpage=0">&laquo;</a></li>
																	<c:forEach begin="1" end="${totalpage}" var="page">
																		<c:if test="${page==currpage+1}">
																			<li class="page-item active" class="page-item"><a
																				class="page-link" href="gomap?currpage=${page-1}">${page}</a></li>
																		</c:if>
																		<c:if test="${page!=currpage+1}">
																			<li class="page-item " class="page-item"><a
																				class="page-link" href="gomap?currpage=${page-1}">${page}</a></li>
																		</c:if>
																	</c:forEach>
																	<li class="page-item"><a class="page-link"
																		href="gomap?currpage=${totalpage}">&raquo;</a></li>
																</ul>
															</c:if>

															<c:if test="${totalpage>10}">
																<ul class="pagination">
																	<li class="page-item"><a class="page-link"
																		href="gomap?currpage=0">&laquo;</a></li>
																	<c:forEach begin="${currpage-3}" end="${currpage+7}"
																		var="page">
																		<c:if test="${page==currpage+1}">
																			<li class="page-item active" class="page-item"><a
																				class="page-link" href="gomap?currpage=${page-1}">${page}</a></li>
																		</c:if>
																		<c:if test="${page!=currpage+1}">
																			<li class="page-item " class="page-item"><a
																				class="page-link" href="gomap?currpage=${page-1}">${page}</a></li>
																		</c:if>
																	</c:forEach>
																	<li class="page-item"><a class="page-link"
																		href="gomap?currpage=${totalpage}">&raquo;</a></li>
																</ul>
															</c:if>
														</div>
													</c:when>
													</c:choose>

													</div>


													</div>

													<!-- class:row -->
													</div>
													<!-- class:container -->
													</div>

													<div class="showProduct container-fluid">
														<div class="site-slider px-md-4">
															<div class="row slider-one text-center">
																<div class="col-md-2 product pt-md-5"></div>
															</div>
														</div>
													</div>






													<footer class=" text-center text-lg-start">
														<div class="container p-4">
															<div class="row">
																<div class="col-lg-6 col-md-12 mb-4 mb-md-0">
																	<h5 class="text-uppercase">Footer text</h5>
																	<p></p>
																</div>
																<div class="col-lg-6 col-md-12 mb-4 mb-md-0">
																	<h5 class="text-uppercase">Footer text</h5>
																	<p></p>
																</div>
															</div>
														</div>


														<!-- Copyright -->
														<div class="text-center p-3"
															style="background-color: rgb(87, 182, 87)">
															© 2020 Copyright: <a class="text-dark" href="">Animal.com</a>
														</div>
														<!-- Copyright -->
													</footer>
</body>
</html>