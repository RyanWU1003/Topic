<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更換密碼</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="css/javascripts/jquery-3.5.1.min.js"/></script>		<!-- ${path } -->

<script >
$(function(){
	(".sendform").click(function(){
		if($(`${checkpwd}`) == true){
			 alert("更換成功");
		}
	})
})

</script>

</head>
<body>

<form action="checkpassword.controller" method="post">
<table>
<tr>
<td>舊密碼</td>
<td><input type="text" id="oldpassword" name="oldpassword" /></td>
<td>${err.checkoldpwd }</td>
</tr>
<td>新密碼</td>
<td><input type="password" id="newpassword" name="newpassword" /></td>
</tr>
<td>確認密碼</td>
<td><input type="password" id="checkpassword" name="checkpassword" /></td>
<td>${err.newpwderr }</td>
</tr>
</table>

<div>
    <input class="sendform" type="submit" id="send" value="送出" />
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</body>
</html>