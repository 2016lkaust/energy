<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'listTea.jsp' starting page</title>

<meta chartset="utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/scripts/css/xx.css'/>">
	<script src="<c:url value='/static/scripts/js/jquery-1.11.2.min.js'/>">
	-->
<script src="<c:url value='/static/scripts/js/jquery-1.11.2.min.js'/>"></script>
	<script>
		function edit(){
			$("form").submit();
		}
	</script>
</head>

<body>
	<h1>更新</h1>
		<form action="<c:url value='/UserSlt?method=updateTea'/>" method="post">
		<input type="text" value="${teacher.tid }" name="tid" hidden="hidden"/>
		<table>
			<tr>
				<td><input type="text" value="${teacher.age }" name="age"/></td>
			</tr>
			<tr>
				<td><input type="text" value="${teacher.sex }" name="sex"/></td>
			</tr>
			<tr>
				<td><input type="text" value="${teacher.email }" name="email"/></td>
			</tr>
			<tr>
				<td><input type="text" value="${teacher.university }" name="university"/></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="30" name="achievement">${teacher.achievement }" </textarea>
				</td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="30" name="course"> ${teacher.course }</textarea>
				</td>
			</tr>
			<tr>
				<td><input type="text" value="${teacher.title }" name="title"/></td>
			</tr>

		</table>
	</form>
	<button onclick="javascript:edit();">编辑</button>
</body>
</html>
