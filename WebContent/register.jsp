<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊會員</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/register.css">
</head>
<body>
<div class="register">
<form action="register.controller" method="post">
<h1>註冊會員</h1>

<table class="regist_box">
<tr class="text-box">
<td>帳號</td>
<td><input type="text" id="account" name="account" /></td>
<td>${err.account }${err.repeat}${err.accountformat }</td>
</tr>
<tr class="text-box">
<td>密碼</td>
<td><input type="password" id="password" name="password" /></td>
<td>${err.password }${err.passwordformat }</td>
</tr>
<tr class="text-box">
<td>確認密碼</td>
<td><input type="password" id="configpwd" name="configpwd" /></td>
<td>${err.againpwd }${err.checkpwd }</td>
</tr>
<tr class="text-box">
<td>姓名</td>
<td><input type="text" id="username" name="username" /></td>
<td>${err.userName }</td>
</tr>
<tr class="text-box">
<td>信箱</td>
<td><input type="email" id="email" name="email" /></td>
<td>${err.email }</td>
</tr>
<tr class="text-box">
<td>電話</td>
<td><input type="text" id="phone" name="phone" /></td>
<td>${err.phone }</td>
</tr>
<tr class="text-box">
<td>地址</td>
<td><input type="text" id="address" name="address" /></td>
<td>${err.address }</td>
</tr>
<tr class="text-box">
<td>生日</td>
<td><input type="date" id="birthday" name="birthday" /></td>
<td>${err.birthday }</td>
</tr >
<tr class="text-box">
<td>性別</td>
<td><input type="radio" id="gender1" name="gender" value="男"  />
	<label for="gender1">男</label>
	<input type="radio" id="gender2" name="gender" value="女" />
	<label for="gender1">女</label>
	<input type="radio" id="gender3" name="gender" value="秘密"  checked="checked"/>
	<label for="gender1">秘密</label>
</td>
<td>${err.gender }</td>
</tr>
</table>
<div>
    <input type="submit" id="btn-submit" value="送出" />
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</body>
</html>