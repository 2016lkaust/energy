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

<meta charset="utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/scripts/css/xx.css'/>">	-->
<script src="<c:url value='/static/scripts/js/jquery-1.5.1.js'/>"></script>
<script>
	$(function() {

		/*
		给所有条目的复选框添加click事件
		 */
		$(":checkbox[name=checkboxBtn]").click(function() {
			var all = $(":checkbox[name=checkboxBtn]").length;//所有条目的个数
			var select = $(":checkbox[name=checkboxBtn][checked]").length;//获取所有被选择条目的个数
			if (all == select) {//全都选中了
				$("#selectAll").attr("checked", true);//勾选全选复选框
			} else if (select == 0) {//谁都没有选中
				$("#selectAll").attr("checked", false);//取消全选
			} else {//部分选中
				$("#selectAll").attr("checked", false);//取消全选
			}
		});
	});
</script>

<link href="<c:url value='static/scripts/css/stuQuery.css'/>"
	rel="stylesheet" type="text/css">
</head>

<body>
	<div class="queryStu">
		<article>
			<table>
				<tr class="resultTitle">
					<td>选择</td>
					<td>工号</td>
					<td>姓名</td>
					<td>电话</td>
					<td colspan="3">操作</td>
				</tr>
				<c:if test="${empty teachers}">
					<tr>
						<td colspan="7">暂时没有教师信息</td>
					</tr>
				</c:if>
				<c:forEach items="${teachers }" var="teacher">
					<tr class="resultTitle">
						<td><input type='checkbox' name='checkboxBtn' class="test">
						</td>
						<td class='userId'>${teacher.user_id }</td>
						<td>${teacher.user_name }</td>
						<td>${teacher.user_tel }</td>
						<td><a
							href="<c:url value='/UserSlt?method=desTea&tid=${teacher.user_id }&edit=des'/>">查看</a>
						</td>
						<td><a
							href="<c:url value='/UserSlt?method=deleteTeas&tid=${teacher.user_id }'/>"
							onclick="return confirm('您是否要删除该教师信息？')">删除</a></td>
						<td><a
							href="<c:url value='/UserSlt?method=desTea&tid=${teacher.user_id }&edit=edit'/>">修改</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td><input type="checkbox" id="selectAll" />
					<td>
					<td><input type="button" value="删除" /></td>
				</tr>
			</table>
		</article>
	</div>
</body>
</html>
