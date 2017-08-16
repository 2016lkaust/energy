<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>删除学生信息</title>
</head>
<script>
	$(function() {
		$("#delete").click(function() {
			if ($("#userId").val().length != 0) {
				$.ajax({
					type : "post",
					url : "StudentSlt",
					data : {
						userId : $("#userId").val(),
						operation : "delete",
					},
					success : function(data) {
						alert("删除成功");
					}
				});
			} else {
				$("#userId").attr("placeholder", "请输入学号");
			}
		});
	});
</script>
<style>
.toDelete {
	width: 850px;
	border: 1px solid #F1F1F1;
	background-color: white;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	margin: auto;
	height: 510px;
	max-height: 510px;
}

.toDelete input {
	margin: 120px 15px 0 300px;
	height: 30px;
	float: left;
}

.toDelete input[type='button'] {
	background-color: #2AABD2;
	border: none;
	color: white;
	border-radius: 5px;
	width: 50px; 
	float : left;
	margin: 122px 0 0 10px;
	float: left;
}
</style>
<body>
	<div class="toDelete">
		<input type="text" id="userId" name="userId" /> <input type="button"
			value="删除" id="delete" /> 
	</div>
</body>
</html>