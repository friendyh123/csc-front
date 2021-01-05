var websocket = null;		    
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
    websocket = new WebSocket("ws://localhost:8887");
}
else {
    alert('当前浏览器 不支持websocket');
}

function myFunction() {	
		  var message = document.getElementById('sendmessage').value;
		  document.getElementById('sendmessage').value="";
		  if(message.trim().match("offline")){//断开连接
			  closeWebSocket();
			  document.getElementById('history').innerHTML+= "<p style='float:left'>访客断开连接</p><br/><br/>";
			  return;
		  }
	    websocket.send(message);
	    document.getElementById('history').innerHTML+= "<p style='float:left'>访客:  "+current()+"<br/>"+message+"</p><br/><br/><br/><br/>";
};

 


function current() {
	var d = new Date(), str = '(';
	str += d.getFullYear() + '-'; //获取当前年份 
	str += d.getMonth() + 1 + '-'; //获取当前月份（0——11） 
	str += d.getDate() + '日 ';
	str += d.getHours() + ':';
	str += d.getMinutes() + ':';
	str += d.getSeconds() + ')';
	return str;
};


//连接发生错误的回调方法
websocket.onerror = function() {
	setMessageInnerHTML("WebSocket连接发生错误");
	//alert("WebSocket连接发生错误");
};

//连接成功建立的回调方法
websocket.onopen = function() {
	setMessageInnerHTML("连接成功");
	//alert("连接成功");
};

//接收到消息的回调方法
websocket.onmessage = function(event) {
	document.getElementById('history').innerHTML += "<p style='float:left'>智能小宝:  "
			+ current() + "<br/>" + event.data + "</p><br/><br/><br/><br/>";

};

//连接关闭的回调方法
websocket.onclose = function() {
	setMessageInnerHTML("WebSocket连接关闭");
}

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function() {
	closeWebSocket();
};

//将消息显示在网页上
function setMessageInnerHTML(innerHTML) {
	document.getElementById('message').innerHTML = innerHTML + '<br/><br/>';
};

//关闭WebSocket连接
function closeWebSocket() {
	websocket.close();
};
document.getElementById("sendbtn").onclick = function() {
	var message = document.getElementById('sendmessage').value;
	document.getElementById('sendmessage').value = "";
	if (message.trim().match("offline")) {//断开连接
		closeWebSocket();
		document.getElementById('history').innerHTML += "<p style='float:left'>访客断开连接</p><br/><br/>";
		return;
	}
	websocket.send(message);
	document.getElementById('history').innerHTML += "<p style='float:left'>访客:  "
			+ current() + "<br/>" + message + "</p><br/><br/><br/><br/>";
};