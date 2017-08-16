<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>查询学生信息</title>
<script type="text/javascript" src="<c:url value='/static/scripts/js/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript" src="static/scripts/js/page.js"></script>
<script type="text/javascript" src="static/scripts/js/teaQuery.js"></script>
<link href="static/scripts/css/stuQuery.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div class="queryStu">
		<header>
			<input type="text" placeholder="学号/姓名/籍贯"><input
				type="button" value="GO">
		</header>

		<div class="line"></div>
		<article>
			<table>
				<tr class="resultTitle">
					<td>选择</td>
					<td>工号</td>
					<td>姓名</td>
					<td>电话</td>
				</tr>

			</table>
		</article>
		<div class="pageCode"></div>
	</div>
</body>
</html>