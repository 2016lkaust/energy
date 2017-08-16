<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>查询学生信息</title>
<script type="text/javascript" src="static/scripts/js/page.js"></script>
<script type="text/javascript" src="static/scripts/js/stuQuery.js"></script>
<link href="static/scripts/css/stuQuery.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div class="queryStu">
		<header>
			<input type="text" placeholder="学号/姓名/籍贯"><input
				type="button" value="GO">
		</header>

		<div>
			查询条件 <select class="stuMajor">
				<option>--专业--</option>
				<option>安全工程</option>
				<option>地下交通</option>
			</select> <select class="stuClassno">
				<option>--班级--</option>
				<option>1班</option>
				<option>2班</option>
				<option>3班</option>
				<option>4班</option>
			</select> <select class="stuSex">
				<option>--性别--</option>
				<option>男</option>
				<option>女</option>
			</select> <select class="stuJob">
				<option>--职务--</option>
				<option>无</option>
				<option>班长</option>
				<option>团支部书记</option>
				<option>学习委员</option>
				<option>生活委员</option>
				<option>体育委员</option>
				<option>文艺委员</option>
				<option>心理委员</option>
				<option>组织宣传委员</option>
			</select>
		</div>
		<div class="line"></div>
		<article>
			<table>
				<tr class="resultTitle">
					<td>选择</td>
					<td>学号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>职务</td>
					<td>专业</td>
					<td>班级</td>
					<td>电话</td>
					<td>籍贯</td>
				</tr>

			</table>
		</article>
		<div class="pageCode"></div>
	</div>
</body>
</html>