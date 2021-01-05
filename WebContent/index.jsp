<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>智能客服</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script src="scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="scripts/cscfront.js" type="text/javascript"></script>
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
					class="ui-blue"><input type="button" id="sendbtn" value="发送" onclick="myFunction()"/></label>
			</div>
		</div>
	</div>
</body>
</html>