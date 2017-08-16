<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript"
	src="static/scripts/js/jquery-1.11.2.min.js"></script>
<script>
        $(function () {
            $("table tr:even").css("background-color", "#F1F1F1");
            $("table tr:even input").css("background-color", "#F1F1F1");
        });
    </script>
<script>
        $(function () {

            $("#addUser").click(function () {
				$.ajax({
                    type : "post",
                    url : "UserSlt",
                    dateType : "html",
                    data : {
                        userId:$("#userId").val(),
                        userName:$("#userName").val(),
                        userTel:$("#userTel").val(),
                        userPw:$("#userPw").val(),
                        userType:"teacher",
                        userGraduated:"-1",
                        operation:"add",
                    },
                    success : function(returnedData) {
                    	console.log(returnedData);
                    	$("input[type=text]").val("");
                    	$("input[type=password]").val("");
                    	alert("添加成功");
                    }
                });
            
        });
        
     });
    </script>
<style type="text/css">
#add {
	margin: 50px auto;
	background-color: white;
	height: 500px;
	max-height: 500px;
	width: 775px;
	border: 1px #F1F1F1 solid;
	box-shadow: 0 0 5px 5px #ccc;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

table {
	width: 95%;
	height: 470px;
	margin: 10px auto;
	border-collapse: collapse;
}

table tr {
	padding: 10px 0;
	text-align: center;
	line-height: 40px;
	font-size: 16px;
	border: 1px #F1F1F1 solid;
}

table td {
	border: 1px solid #F1F1F1;
}

tr td:first-child {
	width: 180px;
}

table .tableTitle {
	line-height: 50px;
	background-color: #46A4E8 !important;
	color: white;
	font-weight: bold;
	font-size: x-large;
}

table input {
	width: 100%;
	height: 42px;
	margin: 0;
	padding: 0;
	border: none;
}

table #addUser {
	width: 55%;
	background-color: #46A4E8;
	color: white;
	font-weight: bold;
	font-size: larger;
	border-radius: 5px;
	margin: 10px 0;
	box-shadow: 0 0 2px 2px #ccc;
}

table #addUser:hover {
	-webkit-transform: scale(1.1, 1.1);
	-moz-transform: scale(1.1, 1.1);
	-ms-transform: scale(1.1, 1.1);
	-o-transform: scale(1.1, 1.1);
	transform: scale(1.1, 1.1);
	transition: all 0.6s;
}

table input[type='radio'] {
	display: inline;
	width: auto;
	float: left;
}

table span {
	float: left;
	margin-left: 30px;
	font-size: 15px;
}
</style>
</head>

<body>
	<div id="add">
		<table>
			<tr>
				<td colspan="2" class="tableTitle">添加教师信息</td>
			</tr>
			<tr>
				<td>工号</td>
				<td><input type="text" id="userId" placeholder="10位数字，不可修改" /></td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text" id="userName" placeholder="用户名" /></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input type="text" id="userTel" placeholder="手机号码" /></td>
			</tr>

			<tr>
				<td>密码</td>
				<td><input type="password" id="userPw" placeholder="不少于6位" /></td>
			</tr>

			<tr class="tableFoot">
				<td colspan="2"><input type="submit" id="addUser" value="添加" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
