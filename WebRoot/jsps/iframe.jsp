<%@page import="service.BacklogService"%>
<%@page import="service.InformService"%>
<%@page import="service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="pragma" content="no-cache"> 

<meta http-equiv="cache-control" content="no-cache"> 

<meta http-equiv="expires" content="0">  
<meta charset="UTF-8">
<title>学生信息管理系统 </title>
<script type="text/javascript" src="<c:url value='/static/scripts/js/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/scripts/js/time.js'/>"></script>
<script type="text/javascript"
		src="<c:url value='/static/scripts/js/radialIndicator.min.js'/>"></script>
<link href="<c:url value='/static/scripts/css/home.css'/>" rel="stylesheet" type="text/css">
<script>
	$(function() {
		
		/*四大块*/
		$('.right .shortcut li:lt(2)').click(function() {
			// 找出 li 中的超链接 href(#id)
			var $this = $(this), _clickTab = $this.attr('value'); // 找到链接a中的targer的值
			//$.get(URL,callback);
			$.get(_clickTab, function(data) {
				$(".mycontent").html(data);
			});
		});
		/*左侧上部标题栏，点击返回主页*/
		$(".left .header .title").click(function() {
			$.get("/energy/jsps/home.jsp", function(data) {
				$("body").html(data);
			});
		});
		 /*通知备忘面板处*/
		/*$(".mycontent .tip .more").click(function() {
			$.get($(this).attr("target"), function(data) { 
				$(".mycontent").html(data);
			});
		}); */
		 /*备忘条目点击全部显示*/
		/*$("#backlogItem li").click(function() {
			$.get("bacShow.jsp", function(data) {
				$(".mycontent").html(data);
			});
		}); */
		
		/*左侧导航栏选项隐藏显示*/
		$(".items .item").click(function() {
			//获取当前点击的li后面的兄弟节点
			var $toShow = $(this).next().next();
			//除了想要显示的节点外都隐藏
			$(".items .item2").not($toShow).hide("fast");
			//next是<hr>，再次next是想要显示的li
			$toShow.toggle("fast");
		});

		

	});
</script>
</head>
<body>
<c:choose>
<c:when test="${!empty user}">
	<nav class="left">
		<div class="header">
			<span class="title alignCenter">信息管理系统</span> <img
				class="alignCenter" src="<c:url value='/static/img/headimg.jpg'/>" /><br> <span
				class="username alignCenter">${user.userName}</span>
		</div>
		<ul class="items">
			<hr>
			<li class="item"><img src="<c:url value='/static/img/student.png'/>"/> <a
				class="items_font">信息管理</a> <img src="<c:url value='/static/img/right.png'/>"/></li>
			<hr>
			<li class="operate item2">
				<ul>
					<li><img src="<c:url value='/static/img/query.png'/>"/> <a
						class="items_font_operate" href="<c:url value='/UserSlt?method=listTeas'/>" target="right">教师信息管理</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
					<li><img src="<c:url value='/static/img/add.png'/>"/> <a
						class="items_font_operate" href="stuAdd.jsp">学生信息管理</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
					<li><img src="<c:url value='/static/img/delete.png'/>"/> <a
						target="stuDelete.jsp" class="items_font_operate">备忘记录管理</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
					<li><img src="<c:url value='/static/img/description.png'/>"/> <a
						class="items_font_operate" target="toStuDes.jsp">通知公告管理</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
				</ul>
			</li>

			<li class="item"><img src="<c:url value='/static/img/teacher.png'/>"/> <a
				class="items_font">教师信息</a> <img src="<c:url value='/static/img/right.png'/>"/></li>
			<hr>
			<li class="operate item2">
				<ul>
					<li><img src="<c:url value='/static/img/query.png'/>"/> <a
						target="teaQuery.jsp" class="items_font_operate">查询教师信息</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
					<li><img src="<c:url value='/static/img/add.png'/>"/> <a
						target="teaAdd.jsp" class="items_font_operate">添加教师信息</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
					<li><img src="<c:url value='/static/img/delete.png'/>"/> <a
						target="teaDelete.jsp'/>" class="items_font_operate">删除教师信息</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
				</ul>
			</li>
			<li class="item"><img src="<c:url value='/static/img/backlog.png'/>"/> <a
				class="items_font">待办事项</a> <img src="<c:url value='/static/img/right.png'/>"/></li>
			<hr>
			<li class="operate item2">
				<ul>
					<li><img src="<c:url value='/static/img/add.png'/>"/> <a
						target="bacAdd.jsp" class="items_font_operate">添加待办事项</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
					<li><img src="<c:url value='/static/img/query.png'/>"/> <a
						target="bacShow.jsp" class="items_font_operate">查看待办事项</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
				</ul>
			</li>
			<li class="item"><img src="<c:url value='/static/img/inform.png'/>"/> <a
				class="items_font">通知公告</a> <img src="<c:url value='/static/img/right.png'/>"/></li>
			<hr>
			<li class="operate item2">
				<ul>
					<li><img src="<c:url value='/static/img/add.png'/>"/> <a
						target="infAdd.jsp" class="items_font_operate">发布通知公告</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>
					<li><img src="<c:url value='/static/img/query.png'/>"/> <a
						target="infAll.jsp" class="items_font_operate">查看通知公告</a> <img
						src="<c:url value='/static/img/right.png'/>" class="right_png"/></li>

				</ul>
			</li>
		</ul>
	</nav>
	<div class="right">
		<div class="tools">
			<img src="<c:url value='/static/img/menu.png'/>"/> <span class="line"></span> <input
				type="text" class="searchText" placeholder="查询" /> <img
				src="<c:url value='/static/img/search.png'/>" class="searchImg"/> <img
				src="<c:url value='/static/img/headimg.jpg'/>" class="headImg"/> <span
				class="username"> <span>${user.userName}</span> <img
				src="<c:url value='/static/img/down.png'/>"/>
			</span> <span class="line"></span> <img src="<c:url value='/static/img/message.png'/>"
				class="message"/> <span class="line"></span> <img
				src="<c:url value='/static/img/set.png'/>" class="set"/> <span class="line"></span>
			<img src="<c:url value='/static/img/powerBold.png'/>" class="power"/>
		</div>
		<div style="clear:both;"></div>
		
		<div class="mycontent">
			<iframe name="right" src="/energy/jsps/right.jsp"></iframe>
		</div>
	</div>
	
		</c:when>
	<c:otherwise>
	<% response.setHeader("refresh","2;URL=/energy/index.jsp") ;%>
	<div align="center"> 
	<font size="5" color="#ff0000">没登录是不允许访问的<br> 
	等我两秒，我带你去登录<br></font>
	</div>
	</c:otherwise>
	
	</c:choose>
</body>

</html>