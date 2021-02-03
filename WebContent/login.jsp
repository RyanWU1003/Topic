<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }
        .login{
            width: 300px;
            position: absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%,-50%);
            
        }
        .login h1{
            float: left;
            font-size: 40px;
            border-bottom: 6px solid rgb(39, 201, 52);
            margin-bottom: 30px;
            padding: 10px 0;
        }
        .text-box{
            width: 100%;
            overflow: hidden;
            font-size: 20px;
            padding: 8px 0;
            margin: 8px 0;
            border-bottom: 2px solid #4caf50;
        }
        .text-box i{
            width: 26px;
            float: left;
            text-align: center;
        }
        .text-box input{
            border: none;
            background: none;
            outline:none;
            font-size: 18px;
            width: 80%;
            float: left;
            margin:0 10px;
        }
       
        .btn{
            border: none;
            background: none;
            outline:none;
            width: 100%;
            font-size: 18px;
            height: 50px;
            padding: 5px ;
            margin: 5px;
            cursor: pointer;
        }
        .err{
            height: 20px;
            margin: 10px 0;
            color: red;
            font-size: 15px;
        }
        .forgetpass{
            margin-top: 10px;
            padding: 5px ;
            padding-left: 15px;
            text-align: center;
            font-size: 0.8em;

        }
        #btn-submit{
            background-color: rgb(39, 201, 52);
            color: white;
        }
        #btn-submit:hover{
            background-color: rgb(26, 161, 38);
        }
        #register{
            border: 2px solid rgb(39, 201, 52);
        }

        #register:hover{
            background-color: rgb(26, 161, 38);
            color: white;
            border: none;
        }
        a,a:visited{
            text-decoration: none;
            color: rgb(46, 46, 46);
        }
        a:hover,a:active{
            color: rgb(216, 64, 59);
        }
        #warning{
            
            height: 50px;
            border-radius: 5px;
            text-align: center;
            box-sizing: border-box;
            padding-left: 15px;
        }
       

    </style>
</head>
<body>
<div class="login">
<c:url value="perform_login" var="loginUrl" />
<form method="post" action="${loginUrl}">
  <h1>Login</h1><br>
 			<div class="text-box">
                <i class="fa fa-user-circle-o"></i>
            	<input type="text" name="account"  placeholder="Account" class="account" autocomplete="off" />
            </div>
            <div class="err">${errors.account}</div>
            
            <div class="text-box">
                 <i class="fa fa-lock"></i>
            	<input type="password" name="password" placeholder="Password" class="password" />
            </div>
            <div class="err">${errors.password}</div>
            
            <input type="submit" id="btn-submit" class="btn" value="submit"/>
            
            
            <div id="warning" class="err">${errors.error}</div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
            <button id="register" class="btn" onclick="location.href='register.jsp'" ><a href="register.jsp">註冊</a></button>		<!-- onclick="self.location.href='http://localhost:8080/SpringMVCWebProject//register.jsp'" -->
            <div class="forgetpass">
                 <a href="forgetpwd.jsp">忘記密碼</a>
            </div>
</div>

</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="<c:url value="/css/login.css"/>">
</head>
<body>
<div class="container">
<c:url value="perform_login" var="loginUrl" />
<form method="post" action="${loginUrl }">
<!-- <form method="post" action="login"> -->
 <h2>Login</h2>
 			
            <input type="text" name="account"  placeholder="Account" class="account" autocomplete="off" />${errors.account}
            <br>
            <br>
            <input type="password" name="password" placeholder="Password" class="password" />${errors.password}
            <br>
            <br>
            <input type="submit" id="btn-submit" value="submit"/><a href="register.jsp">註冊</a>
            <br>
            <br>
            <a href="forgetpwd.jsp">忘記密碼?</a>
            <span id="warning">${errors.error}<br></span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html> --%>