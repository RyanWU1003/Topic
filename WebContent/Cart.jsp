<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="${path }/css/javascripts/jquery-3.5.1.min.js"/></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<script type="text/javascript" src="${path }/css/cartPage.js">
</script>
<link rel="stylesheet" href="${path }/css/cartPage.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="page-wrapper">
 <div class="container">
    <div class="row">
	<div class=" mycart col-12 col-sm-12">
        <h4><strong>My Cart</strong></h4>
		<table class="carttable" >
 	<thead>
 	<tr>
 		<th>Product</th>
        <th></th>
		<th>Quantity</th>
		<th>Price</th>
		<th>Subtotal</th>
		
 	</tr>
 	</thead>
 	<tbody id="cartTable">
	 	
 	</tbody>
 </table>
 <div class="total-price"></div>
 </div>
 </div>
 
 <%@ include file="footer.jsp" %>
</body>
</html>