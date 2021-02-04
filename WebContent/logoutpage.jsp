<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<p>確定要登出嗎</p>
	<form method="post" action="perform_logout">				<!-- ${logoutUrl} -->
		<input value="確認" type="submit"> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<a href="index.jsp">回首頁</a>
	</form>
</body>
</html>