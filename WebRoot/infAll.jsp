<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
<script type="text/javascript"
	src="static/scripts/js/jquery-1.11.2.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

.infAll {
	width: 950px;
	border: 1px solid #F1F1F1;
	background-color: white;
	box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.3);
	margin: 0 auto;
	height: 620px;
	max-height: 620px;
	overflow-y: auto;
}

.infAll h1 {
	text-align: center;
}

.infAll dl {
	font: 16px "Lato", Arial, sans-serif;
	width: 750px;
	margin: 10px auto 0 auto;
	line-height: 20px;
}

.infAll dl:hover {
	background-color: #F1F1F1;
	color: blue;
	text-decoration: underline;
	-webkit-transform: scale(1.05);
	-ms-transform: scale(1.05);
	transform: scale(1.05);
	border: 1px solid silver;
}

.infAll dl:active {
	-webkit-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
}

.infAll dt {
	display: inline;
}

.infAll dd {
	display: inline-block;
}

.infAll .check {
	float: left;
	margin-top: 3px;
}

.infAll .inf_title {
	float: left;
	margin-left: 10px;
	width: 550px;
	/*下面三行实现单行显示*/
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: black;
}

.infAll .inf_title:hover {
	text-decoration: underline;
}

.infAll .inf_create {
	margin-left: 10px;
	width: 120px;
	font-size: x-small;
}

.infAll .inf_id {
	display: none;
}

.infAll #btn1 {
	position: fixed;
	left: 400px;
	top: 70px;
}

.infAll #btn2 {
	position: fixed;
	left: 440px;
	top: 70px;
}

.infAll #btn3 {
	position: fixed;
	left: 490px;
	top: 70px;
}

.infAll #btn4 {
	position: fixed;
	left: 530px;
	top: 70px;
}

.infAll button {
	opacity: 0.3;
}

.infAll button:hover {
	opacity: 1;
}

.infAll img {
	position: relative;
	left: 600px;
	top: -25px;
	opacity: 0.8;
	width: 30px;
}
</style>
<script>
	$(function() {
		$
				.ajax({
					type : "post",
					url : "InformSlt",
					dateType : "json",
					data : {
						operation : "query",
					},
					success : function(informs) {
						for (var i = 0; i < informs.length; i++) {
							$(".infAll").append("<dl>");
							$(".infAll dl:eq(" + i + ")")
									.append(
											"<dt class='check'><input type='checkbox' name='no'></dt>");
							$(".infAll dl:eq(" + i + ")").append(
									"<dt class='inf_title'>"
											+ informs[i].i_title + "</dt>");
							$(".infAll dl:eq(" + i + ")").append(
									"<dt class='inf_create'>"
											+ informs[i].i_create + "</dt>");
							$(".infAll dl:eq(" + i + ")").append(
									"<dt class='inf_id'>" + informs[i].i_id
											+ "</dt>");
							$(".infAll").append("</dl>");
						}
						$(".infAll .inf_title").click(function() {
							$.ajax({
								type : "post",
								url : "infShow.jsp",
								dateType : "html",
								data : {
									i_id : $(this).next().next().html(),
								},
								success : function(data) {
									$(".infAll").html(data);
								}
							});

						});
					}
				});
		$("#btn1").click(function() {
			$(".infAll .check input:checkbox").prop("checked", true);
		});
		$("#btn2").click(function() {
			$(".infAll .check input:checkbox").prop("checked", false);
		});
		$("#changeShow").click(function() {
			location.href="infAll2.jsp";
		});
	});
</script>
</head>
<body>
	<div class="infAll">
		<h1>通知公告</h1>
		<button id="btn1">全选</button>
		<button id="btn2">全不选</button>
		<button id="btn3">已读</button>
		<button id="btn4">删除</button>
		<img id="changeShow" alt="换个样式" src="static/img/change.png" />
	</div>
</body>
</html>