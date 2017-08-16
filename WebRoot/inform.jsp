<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="static/scripts/js/jquery-1.11.2.min.js"></script>
<script>
	$(function() {
		$("#btn").click(function() {
			$.ajax({
				type : "post",
				url : "InformSlt",
				dateType : "html",
				data : {
					title : $("#title").val(),
					content : $("#content").val(),
					operation:"add",
				},
				success : function(returnedData) {
					$("#title").css("border", "1px solid red");
					$("#message").html(returnedData);
				}
			});

		});
	});
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

input[type=text] {
	position: relative;
	left: 80px;
	border: 1px red red;
}

textarea {
	position: relative;
	left: -80px;
	top: 200px;
	border: 1px red red;
}
</style>
</head>

<body>
	<input id="title" type="text" maxlength="20" placeholder="标题">
	<textarea id="content" rows="5" cols="18"></textarea>
	<input type="button" value="提交" id="btn" />
	<p id="message">信息</p>
</body>
</html>
