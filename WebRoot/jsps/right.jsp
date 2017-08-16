<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<c:url value='/static/scripts/js/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/scripts/js/time.js'/>"></script>
<link href="<c:url value='/static/scripts/css/home.css'/>" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  <div class="mycontent">
			<ul class="shortcut">
				<li class="one" value="teaQuery.jsp"><img
					src="<c:url value='/static/img/teacher_small.png'/>"/> <span class="items_font">教师总数</span>
					<span class="dynamic">${teaCount}</span></li>
				<li class="two" value="stuQuery.jsp"><img
					src="<c:url value='/static/img/student_small.png'/>"/> <span class="items_font">学生总数</span>
					<span class="dynamic">${stuCount}</span></li>
				<li class="three"><img src="<c:url value='/static/img/count_small.png'/>"/>
					<span class="items_font">专业总数</span> <span class="dynamic">${majorCount}</span>
				</li>
				<li class="four">
					<div class="front">
						<span id="weekday"> </span> <span id="day"> </span> <span
							id="month"> </span>
					</div>

					<div class="time">
						<span id="time"></span>
					</div>
				</li>
			</ul>
			<div style="clear: both"></div>
			<!-- 待办事项&通知公告 -->
			<ul class="tip">
				<li class="backlog"><span class="title_font"> 待办事项 </span> <a
					class="more" target="<c:url value='/jsps/bacShow.jsp'/>"> more </a>
					<hr>
					<!-- 待办事项 -->
					<ul id="backlogItem">
			
			<c:forEach items="${backList }" var="back">
				<li><a><c:out value="${back.b_title}"></c:out></a></li>
			</c:forEach>
					</ul> <span id="indicatorContainer"> </span></li>
				<script>
					$(function() {
								$(".inform ul li").click(
									function() {
										$.ajax({
											type : "post",
											url : "infShow.jsp",
											dateType : "html",
											data : {
												i_id : $(this).find("a").attr("target"),
											},
											success : function(data) {
												$(".mycontent").html(data);
											}
										});
															
									});
					});
				</script>
				<!-- 通知公告 -->
				<li class="inform"><span class="title_font"> 通知公告 </span> <a
					class="more" target="infAll.jsp"> more </a>
					<hr>
					<ul>
					<c:forEach items="${informList}" var="inform">
						<li><img src="<c:url value='/static/img/check.png'/>"/><a class='title' target="${inform.i_id}">${inform.i_title}</a></li>
					</c:forEach>
					</ul></li>
			</ul>
		</div>
  </body>
</html>
