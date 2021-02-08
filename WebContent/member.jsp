<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/membercenter.css"/>">		<!-- <c:url value="/css/home.css"/> -->
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
        <c:url value="select_member" var="memberUrl" />
        <form method="post" action="${memberUrl} }">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
        
        <c:url value="updatePage" var="memberUrl" />
        <form method="get" action="${memberUrl} }"></form>
        
        <c:choose>
        <c:when test="${selection == 'all' or empty selection}">
        <c:forEach var="member" items="${memberList }">
            
        <div class="work-area">
            <h2>會員資料</h2>
            
            <div class="text-box">
                <label>姓名</label>
                <input type="text" name="username" id="username" value="${member.userName}" disabled>
            </div>
    
            <div class="text-box">
                <label>信箱</label>
                <input type="text" name="email" id="email" value="${member.email}"  disabled>
            </div>
    
            <div class="text-box">
                <label>電話</label>
                <input type="text" name="phone" id="phone" value="${member.phone}"  disabled>
            </div>
    
            <div class="text-box">
                <label>地址</label>
                <input type="text" name="address" id="address" value="${member.address}"  disabled>
            </div>
    
     
            <div class="text-box">
                <label>生日</label>
                <input type="text" name="birthday" id="birthday" value="<fmt:formatDate value="${member.birthday}" pattern="yyyy-MM-dd"/>"  disabled><!-- ${member.birthday} -->
            </div>
            
            <div class="text-box">
                
                <div class="selector-gender">
                    <label>性別</label>
                    <input type="radio" id="gender1" name="gender" value="男" <c:if test="${member.gender=='男' }">checked="checked"</c:if>  disabled/>
                    <label for="gender1">男</label>
                    <input type="radio" id="gender2" name="gender" value="女" <c:if test="${member.gender=='女' }">checked="checked"</c:if>   disabled/>
                    <label for="gender1">女</label>
                    <input type="radio" id="gender3" name="gender" value="秘密" <c:if test="${member.gender=='秘密' }">checked="checked"</c:if>   disabled/>
                    <label for="gender1">秘密</label>
                </div>		<!-- <input type="text" name="gender" id="gender" value="${member.gender}"> -->
            <div> 
            
            <div class="btn-area">
                <a href="updatePage"><input type="button" id="send" value="修改" /></a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </div>

        </c:forEach>
        
        </c:when>
    
        
        
        <c:when test="${selection == 'update' or empty selection}">
        <c:forEach var="member" items="${memberList }">
        <c:url value="update_member" var="memberUrl" />
        <form method="post" action="${memberUrl} ">
        
        <script type="text/javascript">
            
        
        </script>
        <div class="work-area">
        <h2>修改資料</h2>
        
        <div class="text-box">
            <label>姓名</label>
            <input type="text" name="username" id="username" value="${member.userName}">
        </div>

        <div class="text-box">
            <label>信箱</label>
            <input type="text" name="email" id="email" value="${member.email}">
        </div>

        <div class="text-box">
            <label>電話</label>
            <input type="text" name="phone" id="phone" value="${member.phone}">
        </div>

        <div class="text-box">
            <label>地址</label>
            <input type="text" name="address" id="address" value="${member.address}">
        </div>

 
        <div class="text-box">
            <label>生日</label>
            <input type="text" name="birthday" id="birthday" value="<fmt:formatDate value="${member.birthday}" pattern="yyyy-MM-dd"/>"><!-- ${member.birthday} -->
        </div>
        
        <div class="text-box">
            
            <div class="selector-gender">
                <label>性別</label>
                <input type="radio" id="gender1" name="gender" value="男" <c:if test="${member.gender=='男' }">checked="checked"</c:if> />
                <label for="gender1">男</label>
                <input type="radio" id="gender2" name="gender" value="女" <c:if test="${member.gender=='女' }">checked="checked"</c:if> />
                <label for="gender1">女</label>
                <input type="radio" id="gender3" name="gender" value="秘密" <c:if test="${member.gender=='秘密' }">checked="checked"</c:if> />
                <label for="gender1">秘密</label>
            </div>		<!-- <input type="text" name="gender" id="gender" value="${member.gender}"> -->
        <div> 
        
        <div class="btn-area">
            <input type="submit" id="send" value="儲存" />
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </div>
        </form>
        </c:forEach>
        </c:when>
        </c:choose>
        
        </div>

</body>
</html>






<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員專區</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
	<script src="${path}/css/javascripts/jquery-3.5.1.min.js"/></script>
</head>
<body>

<div class="member">
<c:url value="select_member" var="memberUrl" />
<form method="post" action="${memberUrl} }">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<c:url value="updatePage" var="memberUrl" />
<form method="get" action="${memberUrl} }"></form>

<c:choose>
<c:when test="${selection == 'all' or empty selection}">
<c:forEach var="member" items="${memberList }">
<table class="member-box">會員資料
<!-- <a href="updatePage">修改</a> -->
<tr class="text-box">
<th>帳號</th>
<th>${member.account}</th>
</tr>

<tr class="text-box">
<th>姓名</th>
<th>${member.userName}</th>
</tr>

<tr class="text-box">
<th>信箱</th>
<th>${member.email}</th>
</tr>

<tr class="text-box">
<th>電話</th>
<th>${member.phone}</th>
</tr>

<tr class="text-box">
<th>地址</th>
<th>${member.address}</th>
</tr>

<tr class="text-box">
<th>生日</th>
<th><fmt:formatDate value="${member.birthday}" pattern="yyyy/MM/dd"/> </th><!-- ${member.birthday} -->
</tr>

<tr class="text-box">
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

<table class="member">修改會員資料

<tr class="text-box">
<th>姓名</th>
<th><input type="text" name="username" id="username" value="${member.userName}"></th>
</tr>

<tr class="text-box">
<th>信箱</th>
<th><input type="text" name="email" id="email" value="${member.email}"></th>
</tr>

<tr class="text-box">
<th>電話</th>
<th><input type="text" name="phone" id="phone" value="${member.phone}"></th>
</tr>

<tr class="text-box">
<th>地址</th>
<th><input type="text" name="address" id="address" value="${member.address}"></th>
</tr>

<tr class="text-box">
<th>生日</th>
<th><input type="text" name="birthday" id="birthday" value="<fmt:formatDate value="${member.birthday}" pattern="yyyy-MM-dd"/>"></th><!-- ${member.birthday} -->
</tr>

<tr class="text-box">
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

</div>
</body>
</html> --%>