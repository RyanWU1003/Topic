<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>產品</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
	<script src="${path}/css/javascripts/jquery-3.5.1.min.js"/></script>
    <link rel="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="${path}/css/productPage.js"></script> 
	<link rel="stylesheet" href="${path}/css/productAll.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="search">
		 <form action="" method="post"> 
		<input name="productname" id="search-name" type="text" placeholder="尋找商品">
		<input type="button" id="submit-btn" value="搜尋" >
		</form>
	</div>
<div class="containerarea">
	<div id="accordion" class="select-area ">
			<div class="card">
				<div class="card-header">
				  <a class="card-link" data-toggle="collapse" href="#">
					<form method="post" action="selectAll">
						<button id="button0" name="option" >檢視全部</button>
					</form> 
				  </a>
				</div>

			<div class="card">
			  <div class="card-header">
				<a class="card-link" data-toggle="collapse" href="#collapseOne">
				  寵物分類
				</a>
			  </div>
			  <div id="collapseOne" class="collapse show" data-parent="#accordion">
				<div class="card-body">
					<form action="selectSpecies" method="post">
						<div class="search-con species">
							<select name="species">
								<option disabled="true" selected>請選擇</option>
								<option value="dog">狗</option>
								<option value="cat">貓</option>
							</select>
							<button id="button7" type="submit">
								送出
							</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
			  </div>
			</div>
		  
			<div class="card">
			  <div class="card-header">
				<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
				  產品分類
				</a>
			  </div>
			  <div id="collapseTwo" class="collapse" data-parent="#accordion">
				<div class="card-body">
					<form action="selectClass" method="post">
						<div class="search-con ctg">
							<select name="classification">
								<option disabled="true" selected>請選擇</option>
								<option value="飼料">飼料</option>
								<option value="罐頭">罐頭</option>
								<option value="玩具">玩具</option>
								<option value="用品">用品</option>
								<option value="美容護理">美容護理</option>
								<option value="環境清潔">環境清潔</option>
							</select>
							<button id="button7" type="submit">送出</button>
						</div>
				 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
			  </div>
			</div>
		  
			<div class="card">
			  <div class="card-header">
				<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
				  品牌查詢
				</a>
			  </div>
			  <div id="collapseThree" class="collapse" data-parent="#accordion">
				<div class="card-body">
					<form action="selectBrand" method="post">
						<div class="search-con brand">
							<select name="brand">
								<option disabled="true" selected>請選擇</option>
								<option value="ROYAL法國皇家">ROYAL 法國皇家</option>
								<option value="BLACKWOOD柏萊富">BLACKWOOD 柏萊富</option>
								<option value="ORIJEN渴望">ORIJEN 渴望</option>
								<option value="Toma-pro優格">Toma-pro 優格</option>
								<option value="Nutram紐頓">Nutram 紐頓</option>
								<option value="Hills希爾思">Hills 希爾思</option>
							</select>
							<button id="button7" type="submit">
								送出
							</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
			  </div>
			</div>

			<div class="card">
				<div class="card-header">
				  <a class="collapsed card-link" data-toggle="collapse" href="#collapseFour">
					價格範圍
				  </a>
				</div>
				<div id="collapseFour" class="collapse" data-parent="#accordion">
				  <div class="card-body">
					<form action="selectPrice" method="post">
						<div class="search-con price">
							<label for="min">最低價格:</label>
							<input type="text" name="min" id="min" class="searchbox" value="1000"> 
							<label for="max">最高價格:</label>
							<input type="text" name="max" id="max" class="searchbox" value="2000">
							<button id="button5" type="submit">
								送出
							</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				  </div>
				</div>
			  </div>
		  
		  </div>
		</div>
		<%-- 全部產品TABLE --%>
		<c:choose>
			<c:when test="${selection == 'all' or empty selection}">
			<div id="product">
				<div class="title"></div>
			<p class="count">共 ${count}筆資料</p>
			<div class="product-con">
			<c:forEach var="product" items="${productList }">
			
				<div class="product-box">
					<div class="img-box">
						<c:if test="${product.img!=null}">
						<img src="/img/${product.img}" alt="">
						</c:if>
					</div>
					<p class="productname">${product.productName }</p>
					<p class="price">$ ${product.price }</p>
					<div class="btn-con">
					<button class="add2Cart" type="button"
						id="${product.productID}">加入購物車</button>
					<a href="getProductDetail?id=${product.productID}"><button>查看商品</button></a>
					</div>
				</div>
			</c:forEach>
			</c:when>
			<%--  產品種類TABLE--%>
			<c:when test="${selection == 'selectClass' }">
				<div class="product">
				<div class="title">	
				</div>
			<p class="count">共 ${count}筆資料</p>
			<div class="product-con">
			<c:forEach var="product" items="${productList }">
			
				<div class="product-box">
					<div class="img-box">
						<c:if test="${product.img!=null}">
						<img src="/img/${product.img}" alt="">
						</c:if>
					</div>
					<p class="productname">${product.productName }</p>
					<p class="price">$ ${product.price }</p>
					<div class="btn-con">
					<button class="add2Cart" type="button"
						id="${product.productID}">加入購物車</button>
					<a href="getProductDetail?id=${product.productID}"><button>查看商品</button></a>
					</div>
				</div>
			</c:forEach>
			</c:when>

			<%-- 品牌TABLE--%>
			<c:when test="${selection == 'selectBrand' }">
				<div class="product">
				<div class="title">	
				</div>
			<p class="count">共 ${count}筆資料</p>
			<div class="product-con">
			<c:forEach var="product" items="${productList }">
			
				<div class="product-box">
					<div class="img-box">
						<c:if test="${product.img!=null}">
						<img src="/img/${product.img}" alt="">
						</c:if>
					</div>
					<p class="productname">${product.productName }</p>
					<p class="price">$ ${product.price }</p>
					<div class="btn-con">
					<button class="add2Cart" type="button"
						id="${product.productID}">加入購物車</button>
					<a href="getProductDetail?id=${product.productID}"><button>查看商品</button></a>
					</div>
				</div>
				</c:forEach>
			</c:when>

			<%-- 物種TABLE--%>
			<c:when test="${selection == 'selectSpecies' }">
				<div class="product">
				<div class="title">	
				</div>
			<p class="count">共 ${count}筆資料</p>
			<div class="product-con">
			<c:forEach var="product" items="${productList }">
			
				<div class="product-box">
					<div class="img-box">
						<c:if test="${product.img!=null}">
						<img src="/img/${product.img}" alt="">
						</c:if>
					</div>
					<p class="productname">${product.productName }</p>
					<p class="price">$ ${product.price }</p>
					<div class="btn-con">
					<button class="add2Cart" type="button"
						id="${product.productID}">加入購物車</button>
					<a href="getProductDetail?id=${product.productID}"><button>查看商品</button></a>
					</div>
				</div>
				</c:forEach>
			</c:when>


			<c:when test="${selection == 'limitPrice'}">
				<div class="product">
				<div class="title">	
				</div>
			<p class="count">共 ${count}筆資料</p>
			<div class="product-con">
			<c:forEach var="product" items="${productList }">
			
				<div class="product-box">
					<div class="img-box">
						<c:if test="${product.img!=null}">
						<img src="/img/${product.img}" alt="">
						</c:if>
					</div>
					<p class="productname">${product.productName }</p>
					<p class="price">$ ${product.price }</p>
					<div class="btn-con">
					<button class="add2Cart" type="button"
						id="${product.productID}">加入購物車</button>
					<a href="getProductDetail?id=${product.productID}"><button>查看商品</button></a>
					</div>
				</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	</div>
</body>
</html>