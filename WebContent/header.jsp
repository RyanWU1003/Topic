<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <c:set var="path" value="${pageContext.request.contextPath}"></c:set>
	<script src="${path}/css/javascripts/jquery-3.5.1.min.js"/></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap');
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
    ul{
        list-style: none;
    }
	a:hover{
		text-decoration: none;
		color:white;
	}
    header{
        z-index: 2;
        width: 100%;
        height: 110px;
        padding: 25px 100px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: 0.5s;
        box-sizing: border-box;
        background-color: rgb(248, 248, 248);
       
    }
    header.sticky{
        position: fixed;
        top: 0;
        left:0 ;
        background-color: white;
        padding: 10px 100px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        box-sizing: border-box;
    }

    header .logo{
        color: rgb(20, 20, 20);
        font-weight: 700;
        font-size: 2em;
    }
    header.sticky .logo{
        color: black !important;
    }

    header .menu-bar{
        width: 50%;
        float: right;
        box-sizing: border-box;
        
    }

    header .menu-bar ul{
        display: inline-flex;
        float: right;
        margin:auto 5px;
    }
    .menu-bar ul li{
        border-left: 1px solid #fff;
        padding: 15px 20px;
        text-align: center;
        cursor: pointer;
        min-width: 90px;
        position: relative;
    }

    .menu-bar ul li:hover{
        background-color: rgb(71, 189, 91) ;
    }
    .menu-bar ul #cart-con:hover{
        background-color: rgba(71, 189, 91, 0);
        color:tomato;
    }

    .menu-bar ul li i{
        font-size: 25px;
        margin-right: 5px;
    }
    .menu-bar ul li ul{
        position: absolute;
        left: 0;
        display: block;
        margin-top: 18px;
        width: 200px;
        padding: 0;
        background-color: rgb(71, 189, 91);
    }
    .menu-bar ul li ul li{
        text-align: left;
        border: none;
        border-bottom: white 1px solid;
        font-weight: 550;
    }
    .menu-bar ul li ul li:hover{
        background-color: rgb(209, 102, 53);
        color: white;
    }
    header .navigation{
        position: relative;
        display: flex;
        
    }
    header .navigation li{
        list-style: none;
        margin-left: 30px;
    }
    a{
        text-decoration: none;
        color: rgb(22, 22, 22);
    }
    header.sticky .navigation a{
        color: black;
    }

    header .navigation li:hover{
        color: rgb(74, 202, 49);
        overflow: hidden;
    }

    .wrapper{
        min-height: 150%;
    }
    #logout,#login{
        outline: none;
        background: none;
        border: none;
        font-weight: 600;
        font-size: 18px;
    }
    #logout:hover{
        color: white;
    }
    .mycart{
    	position:fixed;
    	top:110px;
    	right:10px;
        z-index: 1000000;
        float: right;
        width: 35%;
        margin-right: 20px;
        min-width: 430px;
        padding: 20px 10px;
        background-color: white;
 
        box-shadow: 0 0 4px rgb(175, 175, 175);
    }
    .name p{
        position: relative;
        line-height: 1.5em;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
    }
    .carttitle{
        color: rgb(114, 93, 87);
        font-size: 30px;
    }
    .mycart th{
        width: 100%;
        height: 8px;
        background-color: rgb(221, 110, 76);
    }
    .mycart td{
        padding: 7px 7px;
    }
    #cartTable{
        padding: 10px 0;
    }
    
    .fa-trash{
        font-size: 18px;
        padding: auto 2px;
    }
    .sum-btn{
        width:100%;
        text-align: end; 
        margin-bottom: 10px;
    }

    .sum-btn h3{
        letter-spacing: 4px;
        margin: 5px 0;
        color: rgb(68, 68, 68);
    }
    .sum-btn h3::before{
        content: "";
        width: 70%;
        height: 2px;
        background-color: rgb(255, 124, 84);
        display: inline-block;
        margin-right: 5px;
    }
    .gocart{
        font-size: 20px;
        background-color: rgb(255, 124, 84);
        height: 50px;
        width: 150px;
        font-weight: 600;
        color: rgb(20, 20, 20);
    }
    .gocart:hover{
        background-color: rgb(226, 103, 66);
        color: white;
        cursor: pointer;
    }
    .gocart i{
        margin-left: 2px;
    }

    @media (max-width:1350px){
        header{
            padding: 25px 50px;
        }
        .menu-bar{
            width: 50%;
        }
        .menu-bar ul{
            margin: 10px 0;
            width: 100%;
        }
        .menu-bar ul li{
            width: 100%;

        }
        .sum-btn{
        width: 100%;
        text-align: end;
        }
        .sum-btn h3::before{
        content: "";
        width: 80%;
        height: 2px;
        background-color: rgb(255, 124, 84);
        display: inline-block;
        margin-right: 5px;
        }
    }

    @media (max-width:1300px){
        header{
            padding: 25px 50px;
        }
        .menu-bar{
            width: 55%;
        }
        .menu-bar ul{
            margin: 10px 0;
            width: 100%;
        }
        .menu-bar ul li{
            width: 100%;

        }
    }

    </style>
    <script>
         $(function(){
            $(window).scroll(function(){
                var height =$(window).scrollTop();
                if(height>0){
                    $('header').addClass('sticky')
                }else{
                    $('header').removeClass('sticky')
                }
            })

            $(".memder-list").hide();
            $("#member").click(function(e){
                e.preventDefault();
                if($("#member").hasClass("show")){
                    $(".memder-list").hide();
                    $("#member").removeClass("show");
                }else{
                    $(".memder-list").show();
                    $("#member").addClass("show");
                }
            })
			$(".mycart").hide();
             $(".showMyCart").click(function(){
		  if(!($(".mycart").hasClass("show"))){
				$(".mycart").show();
				$(".mycart").addClass("show");
				
			}else{
				$(".mycart").hide();
				$(".mycart").removeClass("show");
				
			}
		})

        })
    </script>
</head>
<body>
<% 
String account=SecurityContextHolder.getContext().getAuthentication().getName();
boolean status= false;
if(account==null||account==""){
	status=false;
}else{
	status=true;
}
%>
	<div>
    <header>
        <div>
        <a href="gohome" class="logo">Animal</a>
        </div>

        <div class="menu-bar">
            <ul >
                <a href="goforum?currpage=0"><li>討論專區</li></a>
                <a href="getAllProduct"><li>寵物用品</li></a>
                <a href="gomap?currpage=0"><li>地圖查詢</li></a>
                <c:choose>
                <c:when test="<%=status %>">
                <a href="#" id="member"><li> <%= SecurityContextHolder.getContext().getAuthentication().getName() %>	
                    <ul class="memder-list">
                        <li>會員專區</li>
                        <li><c:url value="/perform_logout" var="logoutUrl" />
                            <form method="post" action="${logoutUrl}">
                                 <input value="登出" type="submit" id="logout">  
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                             </form>
                        </li>
                    </ul>
                </li></a>
                <a class="showMyCart"><li id="cart-con"><i class="fa fa-shopping-cart" ></i><span class="p-1" id="badge">0</span></li></a>
            	</c:when>
            	<c:otherwise>
            		<a href="#"><li>
            		<c:url value="/perform_logoin" var="logoutUrl" />
 						<form method="post" action="${logoutUrl}">
							<input value="登入" type="submit" id="login">  
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 						</form> 
 					</li></a>
                	<a href=""><li>註冊</li></a>
            	</c:otherwise>
            	</c:choose>
            </ul> 
        </div>
        
    </header>
    </div>
    
    <div class="mycart">
    <h3 class="carttitle">我的購物車</h3>
		<table>
			<thead>
				<tr>
					<th colspan="4"></th>
				</tr>
			</thead>
			<tbody id="cartTable">
				<c:if test="${empty cart}" />
				<tr>
					<td>購物車是空的</td>
				</tr>

			</tbody>
		</table>
		<div class="sum-btn">
		</div>
	</div>
    
</body>
</html>