<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊會員</title>
</head>
<body>
<form action="register.controller" method="post">
<div>註冊會員</div>
<table>
<tr>
<td>帳號</td>
<td><input type="text" id="account" name="account" /></td>
<td>${err.account }${err.repeat}${err.accountformat }</td>
</tr>
<tr>
<td>密碼</td>
<td><input type="password" id="password" name="password" /></td>
<td>${err.password }${err.passwordformat }</td>
</tr>
<tr>
<td>確認密碼</td>
<td><input type="password" id="configpwd" name="configpwd" /></td>
<td>${err.againpwd }${err.checkpwd }</td>
</tr>
<tr>
<td>姓名</td>
<td><input type="text" id="username" name="username" /></td>
<td>${err.userName }</td>
</tr>
<tr>
<td>信箱</td>
<td><input type="email" id="email" name="email" /></td>
<td>${err.email }</td>
</tr>
<tr>
<td>電話</td>
<td><input type="text" id="phone" name="phone" /></td>
<td>${err.phone }</td>
</tr>
<tr>
<td>地址</td>
<td><input type="text" id="address" name="address" /></td>
<td>${err.address }</td>
</tr>
<tr>
<td>生日</td>
<td><input type="date" id="birthday" name="birthday" /></td>
<td>${err.birthday }</td>
</tr>
<tr>
<td>性別</td>
<td><input type="text" id="gender" name="gender" /></td>
<td>${err.gender }</td>
</tr>
</table>

<div>
    <input type="submit" id="send" value="送出" />
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</body>
</html>