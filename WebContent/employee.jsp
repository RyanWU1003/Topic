<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工總管</title>
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
<!-- jquery -->
<script type="text/javascript">

</script>

<!-- css -->
<style type="text/css">
html{
	height:100%;
	background: linear-gradient(45deg,  rgba(145,155,155,1) 0%, rgba(43,53,53,1) 100%) no-repeat fixed;
}
#tools a{
	color:#ffffff;
	border-bottom: 2px solid white;
}
.updatebutton{
	background-color:gray;
	transition-duration: 0.4s;
	border:none;
	border-radius:5px;
	padding:8px 10px;
	color:#eee;
}
.updatebutton:hover{
	background-color: #eee;
	transition-duration: 0.4s;
	color:#555;
}
.deletebutton{
	background-color:gray;
	transition-duration: 0.4s;
	border:none;
	border-radius:5px;
	padding:8px 10px;
	color:#eee;
}
.deletebutton:hover{
	background-color: #eee;
	transition-duration: 0.4s;
	color:#555;
}
.collapsing {
  width: 0;
  transition-property: width;
  white-space: nowrap;
  height: 100%;
}
.main{
	position: absolute;
	top:50%;
    left: 50%;
    transform: translate(-50%,-50%);
    weight:100%;
    height:100%;
    margin:100px auto 100px auto;
}
#tools{
	background-color: rgb(202 202 202 / 20%);
	display:flex;
	align-items:center; /* 垂直置中 */
	justify-content:center;  /* 水平置中 */
	margin:2px;
	color:#ffffff;
}
.item{
	display:inline-block;
	padding:30px;
}
#employeesmenu{
	margin:50px auto 50px auto;
	font-size: 20px;
	color:white;
}
.employeeid{
	color:rgb(0 255 243);
}
.outemployees{
	background-color: rgba(31, 31, 31,50%);
	margin: 2px 25px 25px 25px;
}
#employees{
	padding:10px;
/* 	display:flex;
	align-items:center; /* 垂直置中 */ */
}
.emspan{
	width:70px;
	margin:0;
}
.emspan2{
	margin-right:2.5px;
}
.text{
	width:calc(100% - 70px);
}
input[type=text]{
	box-sizing: border-box;
  	border: none;
  	border-bottom: 2px solid white;
  	background-color:rgba(31, 31, 31, 0%);
  	color:white;
}
input[type=text]:focus{
	background-color:white;
	color:rgb(31,31,31);
	outline:none;
}
::placeholder{
	color: #999;
}
select {
	border:none;
  	background-color: rgba(131, 131, 131, 50%);
  	color: #999;
}
select:focus{
	outline:none;
	background-color: rgba(131, 131, 131, 50%);
}
select:checked{
	color: #555;
}
option, option:focus{
	color: rgb(41, 41, 41);
}
</style>
</head>



<body>
<!-- 導覽列 -->
      <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	    <ul class="navbar-nav">
	    	<li class="nav-item active"><a class="navbar-brand" href="gobackhome">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="goemployee">員工</a></li>
			<li class="nav-item"><a class="nav-link" href="bsProductManagement">產品</a></li>
			<li class="nav-item"><a class="nav-link" href="selectAllMember">會員</a></li>
		</ul>
      </nav>
<!-- -->


<div class="main" style="width: 1000px;">
  <div id="tools" style="width: 996px; height:100px; margin:2">
	  <div class="item">
	    <a href="goemployee">全部</a>
	  </div>
	  <div class="item">
	    <a href="toaddemployeejsp">新增</a>
	  </div>
	  <div class="item">
		<form method="post" action="selectemployeetitle">
		  <span>員工職稱</span>
		  <select name="title" onchange="this.form.submit()">
		    <option value="" selected disabled>請選擇</option>
		    <option value="product">product</option>
		    <option value="forum">forum</option>
		    <option value="employee">employee</option>
		  </select>
		</form>
	  </div>
	  <div class="item">
	    <form method="post" action="selectemployeeid">
		  <div>
		    <span style="margin-right: 5px;">員工編號</span><input type="text" name="empID" placeholder="請輸入編號" required></input>
		  </div>
		</form>
	  </div>
  </div>


<!--  -->
  <div id="employeesmenu" class="row no-gutters" align="left">
    <c:forEach var="employee" items="${employeeList}">
	  <div class="outemployees" style="width: 450px; height: 260px;" align="center">
		<div id="employees" style="width: 300px; height:100%;" align="left">
		<table cellpadding="2" class="my-2">
		  <thread>
			<tr>
			  <th class="employeeid">員工編號: ${employee.empid}</th>
			</tr>
		  </thread>
		  <tbody>
		  	<tr>
		  	  <td>empaccount</td>
		  	  <td class="empaccount">${employee.empaccount}</td>
		  	</tr>
		  	<tr>
		  	  <td>emppassword</td>
		  	  <td class="emppassword">${employee.emppassword}</td>
		  	</tr>
		  	<tr>
		  	  <td>empname</td>
		  	  <td class="empname">${employee.empname}</td>
		  	</tr>
		  	<tr>
		  	  <td>title</td>
		  	  <td class="title">${employee.title}</td>
		  	</tr>
		  	<tr>
		  	  <td>
		  	  	<input class="updatebutton" type="button" value="更新" onclick="location.href='toupdateemployeejsp?empID=${employee.empid}'"></input>
		  	  	<input class="deletebutton" type="button" value="刪除" onclick="location.href='deleteemployee?empID=${employee.empid}'"></input>	  	  	
		  	  </td>
	  	    </tr>
		  </tbody>
		</table>
		</div>
	  </div>
	</c:forEach>
  </div>
  
	


<!--  -->	
</div>


<!-- container -->					
</body>
</html>