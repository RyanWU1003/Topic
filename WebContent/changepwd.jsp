<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更換密碼</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="css/javascripts/jquery-3.5.1.min.js"/></script>		<%-- ${path } --%>
<link rel="stylesheet" href="<c:url value="/css/changepwd.css"/>">

</head>
<body>



	<div class="leftbar">
        <ul>
            <li><a href="updatePage"><span>修改資料<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></span></a></li>
            <li><a href="changepwd.jsp"><span>更換密碼<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></span></a></li>
            <li><span>我的訂單</span></li>
            <li><a href="gohome"><span>回首頁<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></span></a></li>
        </ul>
     </div>

	 <div class="member-cont">
		<form action="checkpassword.controller" method="post">
			<div class="work-area">
				<h2>更改密碼</h2>
				<p>為了保護您帳號的安全，請勿與他人共享密碼。</p>
				<div class="text-box">
					<label>請輸入原有密碼</label>
					<input type="text" id="oldpassword" name="oldpassword" />
					<span class="err">${err.checkoldpwd }</span>
				</div>

				<div class="text-box">
					<label>新的密碼</label>
					<input type="password" id="newpassword" name="newpassword" />
				</div>

				<div class="text-box">
					<label>確認密碼</label>
					<input type="password" id="checkpassword" name="checkpassword" />
					<span class="err">${err.newpwderr }</span>
				</div>

				<div class="btn-area">
					<input class="sendform" type="submit" id="send" value="送出" />
				</div>

			</div>

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</body>
</html>