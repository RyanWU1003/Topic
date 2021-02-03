<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check</title>
</head>
<body>
<form action="checkConfirm">
<table>
	<thead>
		<tr>
			<td>訂單商品</td>
			<td>單價</td>
			<td>數量</td>
			<td>總計</td>
		</tr>
	</thead>
	<tbody>
	    <c:set var="total" value="0" />
		<c:forEach var="list" items="${sessionScope.cart}">
		<c:set var="total" value="${total+(list.quantity*list.product.price) }" />
			<tr>
				<td>${list.product.productName}
					<input type="hidden" name=productID value="${ list.product.productID}">
				</td>
				<td>${list.product.price}</td>
				<td>${list.quantity}
					<input type="hidden" name=quantity value="${list.quantity}">
				</td>
				<td>$ ${list.quantity*list.product.price}</td>
			</tr>
		</c:forEach>
		<tr><td>運費: $ 60 </td></tr>
		<tr><td>總計: $ ${total}<input type="hidden" name=quantity value="${list.quantity}"></td></tr>
		<tr><td><button>確認結帳</button></td></tr>
	</tbody>
</table>
</form>
</body>
</html>