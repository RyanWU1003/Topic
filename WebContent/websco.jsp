<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="${path}/css/javascripts/jquery-3.5.1.min.js" /></script>
<script src="${path}/css/javascripts/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />





<title>Webscoket</title>
<style type="text/css">
h6{
color: blue;

}
#a{
color: red;
}

</style>
<script type="text/javascript">
$(function(){  

	var websocket;
	//啟動連線
		connect();
	function connect(){ //初始化連線 
		try {
			var protocol = window.location.protocol;
			if(protocol == "https:"){
				websocket = new WebSocket("wss://"+ window.location.host + "/websocket");
		      }else{		    	 
		        	websocket = new WebSocket("ws://"+ window.location.host + `/SpringHibernate/websocket?user=${user}`);		        	
		      }
		     
		} catch (ex) {
			console.log(ex);
			console.log("websocket連接異常");
		}
		connecting();
		window.addEventListener("load", connecting, false);
	}
	
	

	function connecting() {
		websocket.onopen = function(evt) {
			onOpen(evt)
		}
		websocket.onclose = function(evt) {
			onClose(evt)
		}
		websocket.onmessage = function(evt) {
			onMessage(evt)
		}
		websocket.onerror = function(evt) {
			onError(evt)
		}
	}


	//連線上事件
	function onOpen(evt) {	
		console.log("WebSocket 連線成功");	
	
		$("#connect-status").text("連線中"); 
		
	}
	
	//關閉事件
	function onClose(evt) {
		console.log("WebSocket 離線成功");	
		$("#connect-status").text("離線中"); 
		console.log("WebSocket獲得目前在線人數：" + evt.data);
		}
	//後端推送事件
	
	//發生錯誤
	function onError(evt) {}
	//瀏覽器主動斷開連線
	function wsclose() {
		websocket.close();
	}
// 	function showMessage(message) {
// 		$("#header_visitors").html('線上人數：' + message);
// 		$("#footer_visitors").html('線上人數：' + message);
// 	}
	function onMessage(evt) {
		var msg = JSON.parse(evt.data);	
		//showMessage(evt.data);
		console.log(evt.data);
		 if(JSON.stringify(msg.header).includes('管理員')){
			 $("#msg-io").append(`<h6 id='a'></h6>&emsp;<span ><span>`); 	
			   $("h6:last").text(msg.header);
			   $("span:last").text(msg.value);
		   }else{
	   $("#msg-io").append(`<h6></h6>&emsp;<span><span>`); 	
	   $("h6:last").text(msg.header);
	   $("span:last").text(msg.value);
		   }
	    var msgIoDiv = $("#msg-io")[0];
	    msgIoDiv.scrollTo(0,msgIoDiv.scrollHeight);
	}
		
	$("#msg-name").hide();
   $("#select").change(function () {
  if($("#select").val() == "one"){
        $("#msg-name").show();
  }	else{
	  $("#msg-name").hide();
	  }
})
	

	$("#form1").submit(function(){
		 var msg = {
				    type: $("#select").val(),
				    text: $("#msg-input").val(),
				    id: $("#msg-name").val(),				  
				  };
		
		websocket.send(JSON.stringify(msg));
		$("#msg-input").val("");
		return false;
	});



	/*
$("#btn2").bind("click",function () {
	var url = `${pageContext.request.contextPath}/websocket/sendMsg`;


	 var content = $("#text").val(); 
	 var toUserName = $("#UserName").val(); 
		 $.ajax({ 
			 data: {'content':  content ,'toUserName' :toUserName },
			  type: "get",
			   dataType: 'text',
			    async: false,
			     contentType: "application/x-www-form-urlencoded;charset=UTF-8", 
			     encoding: "UTF-8", 
			     url: url, 
			     success: function (data) { console.log(data.toString()); },
			      error: function (msg) { alert(msg);
			       },
			      });

		 return false;
                })

	*/
})

</script>
</head>
<body>

	<div>
		<h3>聊天室</h3>
		<span id="connect-status">離線中</span>
		<form id="form1">
			<div class="form-group">
				<div class="form-control" style="height: 350px; overflow: auto;"
					id="msg-io"></div>
			</div>
			<div>
			<select id="select" name="selector">
						<option selected value="all">聊天室廣播</option>
						<option  value="one">悄悄話</option>
						
		    </select>
			<input type="text"   name="msg-input2" id="msg-name" placeholder="請輸入對象" >
		
				<input type="text" name="msg-input" id="msg-input"
					placeholder="請輸入訊息" />
				
			</div>
			<button type="submit">送出</button>
			<!--<button type="button" class="btn btn-danger float-right" id="disconnect-btn">離線</button> -->
		</form>
		
<!-- 		<input type="text" id="text">		 -->
<!-- 		<input type="text" id="UserName">		 -->
<!-- 		 <button id="btn2" value="發送給其他用戶">發送給其他用戶</button> -->


	</div>



</body>
</html>