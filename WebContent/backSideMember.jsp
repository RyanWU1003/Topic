<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料修改</title>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="${path}/css/javascripts/jquery-3.5.1.min.js" /></script>
<script src="${path }/css/javascripts/jquery-ui.min.js"></script>
<style type="text/css">
html {
	height: 100%;
	background: linear-gradient(45deg, rgba(145, 155, 155, 1) 0%,
		rgba(43, 53, 53, 1) 100%) no-repeat fixed;
}

#tools a {
	color: #ffffff;
	border-bottom: 2px solid white;
}

input[type=text] {
	box-sizing: border-box;
	border: none;
	border-bottom: 2px solid white;
	background-color: rgba(31, 31, 31, 0%);
	color: white;
}

input[type=text]:focus {
	background-color: white;
	color: rgb(31, 31, 31);
	outline: none;
}

::placeholder {
	color: #999;
}

textarea:focus {
	background-color: white;
	color: rgb(31, 31, 31);
	outline: none;
}

select {
	border: none;
	background-color: rgba(131, 131, 131, 50%);
	color: #999;
}

select:focus {
	outline: none;
	background-color: rgba(131, 131, 131, 50%);
}

select:checked {
	color: #555;
}

option, option:focus {
	color: rgb(41, 41, 41);
}

.main {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	weight: 100%;
	height: 100%;
	margin: 100px auto 100px auto;
}

#tools {
	background-color: rgb(202 202 202/ 20%);
	display: flex;
	align-items: center; /* 垂直置中 */
	justify-content: center; /* 水平置中 */
	margin: 2px;
	color: #ffffff;
}

.updatebutton {
	background-color: gray;
	transition-duration: 0.4s;
	border: none;
	border-radius: 5px;
	padding: 8px 10px;
	color: #eee;
	margin-bottom: 25px;
}

.updatebutton:hover {
	background-color: #eee;
	transition-duration: 0.4s;
	color: #555;
}

.deletebutton {
	background-color: gray;
	transition-duration: 0.4s;
	border: none;
	border-radius: 5px;
	padding: 8px 10px;
	color: #eee;
}

.deletebutton:hover {
	background-color: #eee;
	transition-duration: 0.4s;
	color: #555;
}

.item {
	display: inline-block;
	padding: 20px;
}

.count {
	margin: 2px;
	margin-top: 10px;
}

/* .inside {
	margin: 2px;
	margin-top: 10px;
	color: rgb(32, 32, 37);
} */

.producttitle {
	font-size: 22px;
}

.productlist {
	background-color: rgba(31, 31, 31, 50%);
	font-size: 18px;
}

.product {
	background-color: rgba(31, 31, 31, 50%);
	color: white;
}

.id {
	color: rgb(0, 255, 243);
}

.inside{
	margin: 2px;
	margin-top: 50px;
	background-color: rgba(31, 31, 31, 50%);
	font-size:18px;
	color:rgb(0 255 243);
}

div.scrollable /* scrollbar */ {
	width: 100%;
	max-height: 150px;
	overflow-y: scroll;
	padding: 10px;
}

div::-webkit-scrollbar {
	display: none;
}
</style>

</head>
<body>

	<!-- 導覽列 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="navbar-brand"
				href="gobackhome">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="goemployee">員工</a></li>
			<li class="nav-item"><a class="nav-link"
				href="bsProductManagement">產品</a></li>
			<li class="nav-item"><a class="nav-link" href="selectAllMember">會員</a></li>
		</ul>
	</nav>
	<!-- -->

	<div class="inside" style="width: 100%; height:auto;" align="center">
		<h2>會員資料</h2>
		<c:url value="selectAllMember" var="backsidemember"></c:url>
		<form action="${backsidemember}" method="get"></form>
		<table class="producttable"
			style="border-collapse: separate; border-spacing: 0px 10px;">
			<thead class="producttitle">
				<tr>
					<th scope="col" width="5%" style="text-align: center;">帳號</th>
					<th scope="col" width="5%" style="text-align: center;">姓名</th>
					<th scope="col" width="10%" style="text-align: center;">信箱</th>
					<th scope="col" width="5%" style="text-align: center;">電話</th>
					<th scope="col" width="5%" style="text-align: center;">地址</th>
					<th scope="col" width="5%" style="text-align: center;">生日</th>
					<th scope="col" width="5%" style="text-align: center;">性別</th>
					<th scope="col" width="5%" style="text-align: center;">購物權限</th>
					<th scope="col" width="5%" style="text-align: center;">論壇權限</th>
				</tr>
			</thead>
			<tbody class="productlist">
				<c:choose>
					<c:when test="${selection == 'all' or empty selection}">
						<c:forEach var="member" items="${memberList}">
							<c:url value="updateauthority?account=${member.account }" var="backsidemember" />
							<form method="post" action="${backsidemember }">
								<tr style="line-height:25px;" height="250px">
									<td class="account" name="account">${member.account }</td>
									<td class="userName" style="text-align: center">${member.userName }</td>
									<td class="email" style="text-align: center">${member.email }</td>
									<td class="phone" style="text-align: center">${member.phone }</td>
									<td class="address" style="width: 10% ;text-align: center">${member.address }</td>
									<td class="birthday" style="width: 10% ; text-align: center"><fmt:formatDate value="${member.birthday}" pattern="yyyy-MM-dd"/></td>
									<td class="genfer" style="text-align: center">${member.gender }</td>
									
									<td style="width: 10% ; text-align: center">
										<input type="radio" id="pdauthority" name="pdauthority" value="t"<c:if test="${member.pdauthority=='t' }">checked="checked"</c:if>  />
                    					<label >允許</label>
                    					<input type="radio" id="pdauthority" name="pdauthority" value="f "<c:if test="${member.pdauthority=='f' }">checked="checked"</c:if>  />
                    					<label >禁止</label>
                    				</td>
                    					
                    				<td style="width: 10% ; text-align: center">
                    					<input type="radio" id="frauthority" name="frauthority" value="t "<c:if test="${member.frauthority=='t' }">checked="checked"</c:if>  />
                    					<label >允許</label>
                    					<input type="radio" id="frauthority" name="frauthority" value="f"<c:if test="${member.frauthority=='f' }">checked="checked"</c:if>  />
                    					<label >禁止</label></td>
									
									<%-- <td style="width: 10% ; text-align: center"><input type="text" name="pdauthority" class="pdauthority" style="width: 10%" value="${member.pdauthority }"></td>
									<td style="width: 10% ; text-align: center"><input type="text" name="frauthority" class="frauthority" style="width: 10%" value="${member.frauthority }"></td> --%>
									<td><input type="submit" value="修改"></td>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</tr>
							</form>
						</c:forEach>
					</c:when>

					<%-- <c:when test="${selection == 'update' or empty selection}">
<c:forEach var="member" items="${memberList}">
<c:url value="updatepage" var="backsidemember"/>
<form method="get" action="backsidemember"></form>

<c:url value="updateauthority" var="backsidemember"/>
<form method="post" action="${backsidemember }">

<tr>
<td class="account" name="account">${member.account }</td>		<!-- member.           <input name="account" value="${member.account }">-->
<input name="account" value="${member.account }">
<td>${member.userName }</td>
<td>${member.email }</td>
<td>${member.phone }</td>
<td>${member.address }</td>
<td>${member.birthday }</td>
<td>${member.gender }</td>
<td><input type="text" value="${member.pdauthority }"></td>
<td><input type="text" value="${member.frauthority }"></td>
<td><input type="submit" value="確認" ></td>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</tr>
</form>
</c:forEach>
</c:when> --%>
				</c:choose>

			</tbody>
		</table>






	</div>
</body>
</html>