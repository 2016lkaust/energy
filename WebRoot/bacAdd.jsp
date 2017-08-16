<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<link href="static/scripts/css/htmleaf-demo.css" rel="stylesheet"
	type="text/css">

<script>
	$(function() {

		$("#btn").click(function() {
			var $title = $("#title").val();
			var $bac_content = $("#bac_content").val()
			if ($title.length == 0) {
				$title = "通知";
			}
			if ($bac_content.length == 0) {
				$("#bac_content").addClass("shine_blue");
			} else {

				$.ajax({
					type : "post",
					url : "BacklogSlt",
					dateType : "html",
					data : {
						title : $title,
						bac_content : $bac_content,
						operation : "add",
					},
					success : function(data) {
						alert(data);
						$("#title").val("");
						$("#bac_content").val("");
					}
				});
			}
		});
	});
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.informs {
	width: 950px;
	border: 1px solid #F1F1F1;
	background-color: white;
	box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.3);
	margin: 0 auto;
	height: 620px;
	max-height: 620px;
}

.informs :focus {
	outline: none;
}

.informs .title {
	width: 750px;
	margin: 40px auto 20px;
	position: relative;
}

/* necessary to give position: relative to parent. */
input[type="text"] {
	font: 15px/24px "Lato", Arial, sans-serif;
	color: #333;
	width: 100%;
	box-sizing: border-box;
	letter-spacing: 1px;
	text-align: center;
}

.effect-6 {
	border: 0;
	padding: 5px 0 7px;
	border: 1px solid transparent;
	border-bottom-color: #ccc;
	transition: 0.4s;
}

.effect-6:focus {
	padding: 5px 14px 7px;
	transition: 0.4s;
}

.effect-4 {
	padding: 5px 0 7px;
	border: 1px solid transparent;
	border-bottom-color: #ccc;
	transition: 0.4s;
}

.effect-4:focus {
	padding: 5px 14px 7px;
	transition: 0.4s;
}

.effect-4 ~ .focus-border {
	position: absolute;
	height: 0;
	bottom: 0;
	left: 0;
	width: 100%;
	transition: 0.4s;
	z-index: -1;
}

.effect-4:focus ~ .focus-border {
	transition: 0.4s;
	height: 36px;
	border: 2px solid #3399FF;
	z-index: 1;
}

.effect-6 ~ .focus-border {
	position: absolute;
	height: 36px;
	bottom: 0;
	right: 0;
	width: 0;
	transition: 0.4s;
}

.effect-6:focus ~ .focus-border {
	width: 100%;
	transition: 0.4s;
	border: 2px solid #3399FF;
}

.informs textarea {
	position: relative;
	border: 0;
	height: 450px;
	width: 750px;
	display: block;
	margin: 20px auto 20px;
	font-size: large;
	text-indent: 2em;
	line-height: 30px;
}

.informs #btn {
	margin: auto;
	display: block;
	font: 15px/24px "Lato", Arial, sans-serif;
	width: 150px;
	height: 30px;
	border: 0;
	color: white;
	background-color: #2079df;
	border-radius: 2px;
	letter-spacing: 2px;
	box-shadow: 2px 2px 3px 3px rgba(0, 0, 0, 0.3);
}

.informs #btn:hover {
	background-color: #1a71a8;
}

.informs #btn:active {
	-webkit-transform: scale(0.9);
	-ms-transform: scale(0.9);
	transform: scale(0.9);
}
/*闪烁*/
@-webkit-keyframes shineBlue {
from { -webkit-box-shadow:009px#333;}
50%{-webkit-box-shadow:0 0 18px blue;}
to {-webkit-box-shadow: 0 0 9px #333;}
}
.shine_blue {
	-webkit-animation-name: shineBlue;
	-webkit-animation-duration: 2s;
	-webkit-animation-iteration-count: infinite;
}
#bac_content{
position: relative;
	border: 0;
	height: 400px;
	width: 750px;
	display: block;
	margin: 20px auto 20px;
	font-size: large;
	text-indent: 2em;
	line-height: 30px;
}
</style>
</head>

<body>
	<div class="informs">
		<div class="title">
			<input id="title" type="text" maxlength="20" placeholder="标题"
				class="effect-6" required> <span class="focus-border"></span>
		</div>
		<textarea id="bac_content" placeholder="点击添加备忘录" required></textarea>
		<button type="button" id="btn">添 加</button>
	</div>
	<script type="text/javascript"
		src="static/scripts/js/placeholderTypewriter.js"></script>
	<script type="text/javascript">
		$('#bac_content').placeholderTypewriter(
				{
					text : [ "灵感一闪而过？", "事情好多记不全?",
							"好记性不如烂笔头", "快快记下来吧！"]
				});
	</script>
</body>
</html>
