<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<c:url value="selectAllMember" var="backsidemember"></c:url>
<form action="${backsidemember }" method="get"></form>
<h2>會員資料</h2>
<%-- <c:choose> --%>
<%-- <c:when test="${selection == 'all' or empty selection} "> --%>


<table>
<thead>
<tr>
<th>帳號</th>
<th>姓名</th>
<th>信箱</th>
<th>電話</th>
<th>地址</th>
<th>生日</th>
<th>性別</th>
<th>購物權限</th>
<th>論壇權限</th>
</tr>
</thead>
<tbody>
<c:forEach var="member" items="${memberList }">
<tr>
<td>${member.account }</td>		<!-- member. -->
<td>${member.userName }</td>
<td>${member.email }</td>
<td>${member.phone }</td>
<td>${member.address }</td>
<td>${member.birthday }</td>
<td>${member.gender }</td>
<td>${member.pdauthority }</td>
<td>${member.frauthority }</td>
<td><input type="button" value="修改"></td>
</tr>

</c:forEach>
</tbody>
</table>


<%-- </c:when> --%>
<%-- </c:choose> --%>




</div>
</body>
</html>