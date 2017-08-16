<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>查询学生信息</title>
<script type="text/javascript"
	src="static/scripts/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="static/scripts/js/page.js"></script>
<script type="text/javascript">
//var userId=${param.userId};
//console.log(userId);
</script>

<body>
<%String userId=request.getParameter("userId");
//out.print(userId); 
System.out.print(userId);%>
<%=userId %>
test
</body>