<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員專區</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
	<script src="${path}/css/javascripts/jquery-3.5.1.min.js"/></script>
</head>
<body>
<c:url value="select_member" var="memberUrl" />
<form method="post" action="${memberUrl} }">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<c:url value="updatePage" var="memberUrl" />
<form method="get" action="${memberUrl} }"></form>

<c:choose>
<c:when test="${selection == 'all' or empty selection}">
<c:forEach var="member" items="${memberList }">
<table>會員資料
<!-- <a href="updatePage">修改</a> -->
<tr>
<th>帳號</th>
<th>${member.account}</th>
</tr>

<tr>
<th>姓名</th>
<th>${member.userName}</th>
</tr>

<tr>
<th>信箱</th>
<th>${member.email}</th>
</tr>

<tr>
<th>電話</th>
<th>${member.phone}</th>
</tr>

<tr>
<th>地址</th>
<th>${member.address}</th>
</tr>

<tr>
<th>生日</th>
<th><fmt:formatDate value="${member.birthday}" pattern="yyyy/MM/dd"/> </th><!-- ${member.birthday} -->
</tr>

<tr>
<th>性別</th>
<th>${member.gender}</th>
</tr>
</c:forEach>
</table>
</c:when>



<c:when test="${selection == 'update' or empty selection}">
<c:forEach var="member" items="${memberList }">
<c:url value="update_member" var="memberUrl" />
<form method="post" action="${memberUrl} ">

<script type="text/javascript">
	

</script>

<table>修改會員資料

<tr>
<th>姓名</th>
<th><input type="text" name="username" id="username" value="${member.userName}"></th>
</tr>

<tr>
<th>信箱</th>
<th><input type="text" name="email" id="email" value="${member.email}"></th>
</tr>

<tr>
<th>電話</th>
<th><input type="text" name="phone" id="phone" value="${member.phone}"></th>
</tr>

<tr>
<th>地址</th>
<th><input type="text" name="address" id="address" value="${member.address}"></th>
</tr>

<tr>
<th>生日</th>
<th><input type="text" name="birthday" id="birthday" value="<fmt:formatDate value="${member.birthday}" pattern="yyyy/MM/dd"/>"></th><!-- ${member.birthday} -->
</tr>

<tr>
<th>性別</th>
<th>
	<input type="radio" id="gender1" name="gender" value="男" <c:if test="${member.gender=='男' }">checked="checked"</c:if> />
	<label for="gender1">男</label>
	<input type="radio" id="gender2" name="gender" value="女" <c:if test="${member.gender=='女' }">checked="checked"</c:if> />
	<label for="gender1">女</label>
	<input type="radio" id="gender3" name="gender" value="秘密" <c:if test="${member.gender=='秘密' }">checked="checked"</c:if> />
	<label for="gender1">秘密</label>
</th>		<!-- <input type="text" name="gender" id="gender" value="${member.gender}"> -->
</tr>
</table>
<div>
    <input type="submit" id="send" value="送出" />
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</c:forEach>
</c:when>
</c:choose>
<a href="updatePage">修改會員資料</a>		<!-- updatePage   select_member -->
<!-- <a href="update_member">會員資料修改</a> -->
<a href="changepwd.jsp">更換密碼</a>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</body>
</html>