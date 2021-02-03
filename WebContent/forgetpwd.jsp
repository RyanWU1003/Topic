<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="forgetpwd.controller" method="post">
<table>
<td>帳號</td>
<td><input type="text" id="account" name="account" /></td>
</tr>
<td>信箱</td>
<td><input type="text" id="email" name="email" /></td>
<td>${err.newpwderr }</td>
</tr>
</table>

<div>
    <input type="submit" id="send" value="送出" />
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</body>
</html>