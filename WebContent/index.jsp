<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>智能客服</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script src="scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
</head>
<body>
	<div id="chat-room">

		<div class="righter">
			<div id="history">
			
			</div>
			<div class="spacer"></div>			
			<div class="reply">
			   <input id="username" hidden="hidden"  type="text"/>
				   <input type="text" class="text" id="sendmessage" name="content" /><label
					class="ui-blue"><input type="button" id="sendbtn" value="发送" /></label>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		 var websocket = null;		    
		    //判断当前浏览器是否支持WebSocket
		    if ('WebSocket' in window) {
		        websocket = new WebSocket("ws://localhost:8887");
		    }
		    else {
		        alert('当前浏览器 Not support websocket')
		    }

		    //连接发生错误的回调方法
		    websocket.onerror = function () {
		        setMessageInnerHTML("WebSocket连接发生错误");
		    };

		    //连接成功建立的回调方法
		    websocket.onopen = function () {
		        setMessageInnerHTML("连接成功，可以开始聊天了");
		    }

		    //接收到消息的回调方法
		    websocket.onmessage = function (event) {
		    	    document.getElementById('history').innerHTML+= "<p style='float:left'>智能小宝:  "+event.data+"</p><br/><br/><br/><br/><br/><br/>";
		        
		    }

		    //连接关闭的回调方法
		    websocket.onclose = function () {
		        setMessageInnerHTML("WebSocket连接关闭");
		    }

		    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		    window.onbeforeunload = function () {
		        closeWebSocket();
		    }

		    //将消息显示在网页上
		    function setMessageInnerHTML(innerHTML) {
		        document.getElementById('message').innerHTML= innerHTML + '<br/><br/>';
		    }

		    //关闭WebSocket连接
		    function closeWebSocket() {
		        websocket.close();
		    }
		    document.getElementById("sendbtn").onclick=function(){
		    	  var message = document.getElementById('sendmessage').value;
		    	  document.getElementById('sendmessage').value="";
		          websocket.send(message);
		          document.getElementById('history').innerHTML+= "<p style='float:left'>访客:  "+message+"</p><br/><br/>";
		    };
	</script>
</body>
</html>