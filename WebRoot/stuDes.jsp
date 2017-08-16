<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>查询学生信息</title>
<script type="text/javascript" src="static/scripts/js/page.js"></script>
<script type="text/javascript" src="static/scripts/js/stuDes.js"></script>
<link href="static/scripts/css/stuDes.css" rel="stylesheet"
	type="text/css">
<script>
	$(function() {
		userId =<%=request.getParameter("userId")%>;
		$(".queryDes .tab p").html(userId);
		stuInfo();
		$(".queryDes div span").click(function() {
			$(".queryDes div span").removeClass("active");
			$(this).toggleClass("active");
			var tableAbout = $(this).attr("about");
			$(".queryDes article table").hide();
			//Jquery选择器中使用变量实现动态--直接拼字符串
			$(".queryDes table[class='" + tableAbout + "']").show();
		});

		//家庭情况表
		$(".queryDes div span[about='studentFamily']").click(function() {
			stuFamily();
		});
		//学生信息表
		$(".queryDes div span[about='studentInfo']").click(function() {
			stuInfo();
		});

		//参加课外活动表
		$(".queryDes div span[about='studentActivity']").click(function() {
			stuAcitity();
		});
	});
</script>
</head>
<body>

	<div class="queryDes">
		<div class="tab">
			<span class="active" about="studentInfo">个人资料</span> <span
				about="studentFamily">家庭情况</span> <span about="studentActivity">课外活动</span>
			<p class="sno" title="学号">123141441</p>
		</div>
		<article>
			<!--个人信息-->
			<table class="studentInfo">
				<tr>
					<td>学号</td>
					<td id="user_id">2013305167</td>
					<td>姓名</td>
					<td id="user_name">罗贯中</td>
					<td>性别</td>
					<td id="stu_sex">男</td>
				</tr>
				<tr>
					<td>民族</td>
					<td id="stu_nation">维吾尔族</td>


					<td>专业</td>
					<td id="stu_major">信息与计算科学</td>
					<td>班级</td>
					<td id="stu_classno">2班</td>
				</tr>
				<tr>
					<td>生日</td>
					<td id="stu_birth">1995/06/10</td>
					<td>职务</td>
					<td id="stu_job">组织宣传委员</td>

					<td>QQ</td>
					<td id="stu_qq">1234567890</td>
				</tr>
				<tr>
					<td>宿舍</td>
					<td id="stu_dorm">D区123</td>
					<td>身份证号</td>
					<td id="stu_num">341111199678901234</td>
					<td>高考分数</td>
					<td id="stu_score">555</td>
				</tr>
				<tr>
					<td>是否贫困</td>
					<td id="stu_poor">是</td>
					<td>贫困级别</td>
					<td id="stu_result">一般困难</td>
					<td>政治面貌</td>
					<td id="stu_status">共青团员</td>
				</tr>
				<tr>
					<td>家庭住址</td>
					<td colspan="7" id="stu_home">安徽省淮南市山南新区168号</td>
				</tr>
			</table>
			<!--家庭情况-->
			<table class="studentFamily" hidden>
				<tr class="resultTitle">
					<td>姓名</td>
					<td>与本人关系</td>
					<td>政治面貌</td>
					<td>工作单位</td>
					<td>联系方式</td>
					<td>备注</td>
				</tr>

			</table>
			<!--课外活动-->
			<table class="studentActivity" hidden>
				<tr>
					<td>获得的奖项</td>
					<td id="award"></td>
				</tr>
				<tr>
					<td>本学期的目标</td>
					<td id="goal"></td>
				</tr>

				<tr>
					<td>参加社会实践情况</td>
					<td id="done"></td>
				</tr>
				<tr>
					<td>参加其他活动情况</td>
					<td id="other"></td>
				</tr>
				<tr>
					<td>大学四年的目标</td>
					<td id="goals"></td>
				</tr>

				<tr>
					<td>在校期间受到的处分</td>
					<td id="punish"></td>
				</tr>
				<tr>
					<td>参加创新创业竞赛情况</td>
					<td id="created"></td>
				</tr>
				<tr>
					<td>参加校园文化活动情况</td>
					<td id="culture"></td>
				</tr>
			</table>
		</article>
	</div>
</body>
</html>
