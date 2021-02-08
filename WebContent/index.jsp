<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="${path}/css/javascripts/jquery-3.5.1.min.js" /></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>







<link href="<c:url value="/css/home.css"/>" rel="stylesheet">
</head>
<script>
	$(function() {
		$('header').hide();

		$(window).scroll(function() {
			var height = $(window).scrollTop();
			if (height > 0) {
				$('header').show();
				$('header').addClass('sticky')
			} else {
				$('header').removeClass('sticky');
				$('header').hide();
			}
		})

		$('.slider').slick({
			arrows : false,
			dots : true,
			centerMode : true,
			centerPadding : 0,
			slidesToShow : 4,
			slidesToScroll : 3,
			autoplaySpeed : 2000,
			responsive : [ {
				breakpoint : 1300,
				settings : {
					arrows : true,
					centerMode : true,
					centerPadding : 0,
					slidesToShow : 3
				}
			}, {
				breakpoint : 910,
				settings : {
					arrows : true,
					centerMode : true,
					centerPadding : 0,
					slidesToShow : 2
				}
			}, {
				breakpoint : 850,
				settings : {
					arrows : true,
					centerMode : true,
					centerPadding : 0,
					slidesToShow : 2
				}
			}, {
				breakpoint : 680,
				settings : {
					arrows : true,
					centerMode : true,
					centerPadding : 0,
					slidesToShow : 1
				}
			} ]
		})

	})
</script>
</head>
<body>
	<header>



		<a href="#" class="logo">Animal</a>
		<ul class="navigation">
			<%
			if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
			%>

			<a href="perform_login"><li>登入 </li></a>
			<a href="${path}/register.jsp"><li>註冊</li></a>
			<%
			}else{
			%>
			
			<%-- <%
			if (!"anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
			%> --%>
			<a class="nav-link active" aria-current="page" href="select_member"><li>我的帳號</li></a>
			<a href="logoutPage"><li>登出 </li></a>

			<%
			}
			%>


		</ul>
	</header>
	<section class="banner" id="banner"
		style="background-image: url('/img/thum.jpg');">
		<div class="content">
			<h2>Always by Your Side</h2>
			<p>
				可以打一些網站介紹但是還沒想到所以當<br>做測試隨便打幾句dfefkaoijfiajkdlsjfeiajf
			</p>
			<a class="btn-action" href="goforum?currpage=0"><button class="btn">
					前往討論版<i class="fa fa-angle-double-right"></i>
				</button></a><br> <a class="btn-action" href="getAllProduct"><button
					class="btn">
					寵物用品<i class="fa fa-angle-double-right"></i>
				</button></a><br> <a class="btn-action" href="gomap?currpage=0"><button class="btn">
					地圖查詢<i class="fa fa-angle-double-right"></i>
				</button></a><br>
					<a class="btn-action" href="gowebscoket"><button class="btn">
					客服/聊天<i class="fa fa-angle-double-right"></i>
				</button></a>
				<br>
			<%
			if ("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
			%>
			<a class="btn-action" href="perform_login">		<!-- perform_login  /  login.jsp-->
				<button class="btn" id="login">登入/註冊<i class="fa fa-angle-double-right"></i>
				</button>
			</a>
			<%
			} else {
			%>
			<a class="btn-action" href="logoutPage">
				<button class="btn" id="login">登出<i class="fa fa-angle-double-right"></i>
				</button>
			</a>

			<%
			}
			%>
		</div>
	</section>

<%-- 		<%=  SecurityContextHolder.getContext().getAuthentication().getName() %> --%>




	<div class="discuss-area">
		<h2 class="title">熱門討論</h2>
		<div>
			<ul class="articleList">			
				<a href="goforumdetail?forumid=${hotforum0.copyfdid}">
					<li>
						<div class="eachArticle">
							<h3 class="artTitle">${hottitle0}</h3>
							<p>${hotforum0.content}</p>
							<small>${hotforum0.date}</small>
						</div>
				</li>
				</a>				
				<a href="goforumdetail?forumid=${hotforum1.copyfdid}">
					<li>
						<div class="eachArticle">
							<h3 class="artTitle">${hottitle1}</h3>
							<p>${hotforum1.content}</p>
							<small>${hotforum1.date}</small>
						</div>
				</li>
				</a>
				<a href="goforumdetail?forumid=${hotforum2.copyfdid}">
					<li>
						<div class="eachArticle">
							<h3 class="artTitle">${hottitle2}</h3>
							<p>${hotforum2.content}</p>
							<small>${hotforum2.date}</small>
						</div>
				</li>
				</a>
				<a href="goforumdetail?forumid=${hotforum3.copyfdid}">
					<li>
						<div class="eachArticle">
							<h3 class="artTitle">${hottitle3}</h3>
							<p>${hotforum3.content}</p>
							<small>${hotforum3.date}</small>
						</div>
				</li>
				</a>
				<a href="goforumdetail?forumid=${hotforum4.copyfdid}">
					<li>
						<div class="eachArticle">
							<h3 class="artTitle">${hottitle4}</h3>
							<p>${hotforum4.content}</p>
							<small>${hotforum4.date}</small>
						</div>
				</li>
				</a>	
			</ul>
		</div>
		<div class="gotochat">
			<a href="goforum?currpage=0"><button>查看更多</button></a>
		</div>
	</div>
	<!-- 商品 -->
	<div class="product-area">
		<h2 class="title">本月熱銷</h2>

		<div class="product-p1 product-page slider">
			<a>
				<div class="eachproduct">
					<div class="pimg-container">
						<img src="/img/3db4c6c0-042b-4a7e-9a0e-2f96d0ade7b4.jpg">
					</div>
					<p>測試用因為商品名稱很長所以打一長串看起來應該是部會超過吧糟糕</p>
				</div>
			</a> <a>
				<div class="eachproduct">
					<div class="pimg-container">
						<img src="/img/7d188998-ee4d-4d4d-b787-8ff7c83838a6.jpg">
					</div>
					<p>Product Name</p>
				</div>
			</a> <a>
				<div class="eachproduct">
					<div class="pimg-container">
						<img src="/img/1e1e93aa-1bfd-401f-a6dd-3de1711b2b12.jpg">
					</div>
					<p>Product Name</p>
				</div>
			</a> <a>
				<div class="eachproduct">
					<div class="pimg-container">
						<img src="/img/2a6eb7c3-c240-4323-bce1-e216a13cf138.jpg">
					</div>
					<p>Product Name</p>
				</div>
			</a> <a>
				<div class="eachproduct">
					<div class="pimg-container">
						<img src="/img/2a6eb7c3-c240-4323-bce1-e216a13cf138.jpg">
					</div>
					<p>Product Name</p>
				</div>
			</a>
		</div>


		<div class="gotoShop">
			<a href="getAllProduct"><button>去購物</button></a>
		</div>
	</div>

	<!-- 地圖查詢 -->
	<div class="map-area">
		<div class="map-title" style="background-image: url('/img/map.jpg');">
			<h2>地圖查詢</h2>
		</div>
		<div class="map-container">
			<div class="map-cato">
				<div class="box-background"
					style="background-image: url('/img/dog.jpg');"></div>
				<div class="content">
					<div class="logo">
						<i class="fa fa-hospital-o"></i>
					</div>
					<div class="gobtn">
						<a href="gomap?currpage=0"><button id="hbtn">醫療資源</button></a>
					</div>
				</div>
			</div>

			<div class="map-cato">
				<div class="box-background"
					style="background-image: url('/img/20200929001326.jpg');"></div>
				<div class="content">
					<div class="logo">
						<i class="fa fa-shower"></i>
					</div>
					<div class="gobtn">
						<a href=""><button id="sbtn">寵物美容</button></a>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="footer-col-1">
					<h3>聯絡我們</h3>
					<p>我們會用最快的速度回應您的需求</p>
				</div>
			</div>
			<hr>
			<p class="footer-bottom">&copy; Animal.com | Alawys by Your Side</p>
		</div>
	</div>



</body>
</html>