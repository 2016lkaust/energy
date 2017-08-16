<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>查看学生详细信息</title>
<script type="text/javascript"
	src="static/scripts/js/jquery-1.11.2.min.js"></script>
</head>
<script>
	$(function() {
		$("#search").click(function() {
			$.ajax({
				type : "post",
				url : "stuDes.jsp",
				data : {
					userId : $("#userId").val(),
				},
				success : function(data) {
					$("#userId").parent().html(data);
				}
			});
		});
	});
</script>
<style>
.toStuDes {
	width: 850px;
	border: 1px solid #F1F1F1;
	background-color: white;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	margin: auto;
	height: 510px;
	max-height: 510px;
}

.toStuDes input {
	margin: 120px 15px 0 300px;
	height: 30px;
	float: left;
}

.toStuDes input[type='button'] {
	background-color: #2AABD2;
	border: none;
	color: white;
	font-size: large;
	border-radius: 5px;
	float: left;
	margin: 122px 0 0 10px;
}
</style>
<body>
<div class="toStuDes">
	<input type="text" id="userId" name="userId" />
	<input type="button" value="查看" id="search" />
</div>
</body>
</html>