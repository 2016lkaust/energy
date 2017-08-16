<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查询学生信息</title>
    <script type="text/javascript" src="static/scripts/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="static/scripts/js/page.js"></script>

    <script>
        $(function () {
            	userId= <%=request.getParameter("userId")%>;
             $(".queryDes .tab p").html(userId);
            stuInfo();
            $(".queryDes div span").click(function () {
                $(".queryDes div span").removeClass("active").animate();
                $(this).toggleClass("active");
                var tableAbout = $(this).attr("about");
                $(".queryDes article table").hide();
                //Jquery选择器中使用变量实现动态--直接拼字符串
                $(".queryDes table[class='" + tableAbout + "']").show();
            });
             function stuInfo(){
            	$.ajax({
                    type: "post",
                    url: "StudentSlt",
                    dateType: "html",
                    data: {
                        userId:userId,
                        type:"studentInfo",
                        operation: "studentDes",
                    },
                    success: function (list) {
                        var stuInfo=list[0];
                        $("#user_id").html(stuInfo.user_id);
                        $("#user_name").html(stuInfo.user_name);
                        $("#stu_birth").html(stuInfo.stu_birth);
                        $("#stu_classno").html(stuInfo.stu_classno);
                        $("#stu_dorm").html(stuInfo.stu_dorm);
                    	$("#stu_job").html(stuInfo.stu_job);
                    	$("#stu_major").html(stuInfo.stu_major);
                    	$("#stu_nation").html(stuInfo.stu_nation);
                    	$("#stu_num").html(stuInfo.stu_num);
                    	$("#stu_poor").html(stuInfo.stu_poor);
                    	$("#stu_qq").html(stuInfo.stu_qq);
                    	$("#stu_result").html(stuInfo.stu_result);
                    	$("#stu_sex").html(stuInfo.stu_sex);
                   	 	$("#stu_status").html(stuInfo.stu_status);
                    
                    }
               	});
            }
            function stuFamily(){
            $.ajax({
                    type: "post",
                    url: "StudentSlt",
                    dateType: "json",
                    data: {
                        userId:userId,
                        type:"studentFamily",
                        operation: "studentDes",
                    },
                    success: function (list) {
                        $table = $(".queryDes .studentFamily");
							//先清空上次查询结果
							$(".queryDes .studentFamily tr:gt(0)").remove();
							for (var i = 0; i < list.length ; i++) {
								$table.append("<tr>");
								$(
										".queryDes .studentFamily tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].fa_name + "</td>");
								$(
										".queryDes .studentFamily tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].fa_relative + "</td>");
								$(
										".queryDes .studentFamily tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].fa_status + "</td>");
								$(
										".queryDes .studentFamily tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].fa_company + "</td>");
								$(
										".queryDes .studentFamily tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].fa_tel + "</td>");
								$(
										".queryDes .studentFamily tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].fa_other + "</td>");
								$table.append("</tr>");
							}
                    }
                });
            }
            function stuAcitity(){
            $.ajax({
                    type: "post",
                    url: "StudentSlt",
                    dateType: "html",
                    data: {
                        userId:userId,
                        type:"studentActivity",
                        operation: "studentDes",
                    },
                    success: function (list) {
                        console.log(list[0]);
                        $("#award").html(list[0].award);
                        $("#created").html(list[0].created);
                        $("#culture").html(list[0].culture);
                        $("#done").html(list[0].done);
                        $("#goals").html(list[0].goals);
                        $("#goal").html(list[0].goal);
                        $("#punish").html(list[0].punish);
                        $("#other").html(list[0].other);
                    }
                });
            }
            //家庭情况表
            $(".queryDes div span[about='studentFamily']").click(function () {
				stuFamily();
            });
            //学生信息表
            $(".queryDes div span[about='studentInfo']").click(function () {
				stuInfo();
            });
           
            //参加课外活动表
            $(".queryDes div span[about='studentActivity']").click(function () {
				stuAcitity();
            });
        });

    </script>
    <style>
        .queryDes {
            width: 850px;
            border: 1px solid #F1F1F1;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            margin: auto;
            height: 510px;
            max-height: 510px;
        }


        .queryDes .toStuDes input[type='text'] {
            margin: 120px 15px 0 220px;
            height: 30px;
            width:240px;
            float: left;
        }

        .queryDes .toStuDes input[type='button'] {
            background-color: #2AABD2;
            border: none;
            color: white;
            border-radius: 5px;
            font-size: large;
            float: left;
            width: 50px;
            margin: 125px 0 0 10px;
        }

        /*标签*/
        .queryDes .tab {
            /*text-align: center;*/
            margin: 30px 0 20px 10px;
        }

        .queryDes .tab span {
            border: 0;
            margin: 10px 0 0 -5px;
            padding: 10px 20px;
            background-color: #F5F5F5;
        }

        .queryDes .tab span:first-child {
            margin-left: 40px;
        }

		.queryDes .tab p {
            background-color: #3FB4D7;
            margin-left:200px;
            width:120px;
            display:inline;
        }
        .queryDes .tab span:hover {
            background-color: #3FB4D7;
        }
        .active {
            background-color: #3FB4D7 !important;
            border-right: 1px #F1F1F1 solid !important;
            border-top: 1px #F1F1F1 solid !important;
            /*border-left: 1px #F1F1F1 solid!important;*/
        }

        /*学生个人信息表*/
        .queryDes article .studentInfo {
            margin: auto;
            border: 1px solid #AEC6C9;
            border-collapse: collapse;
            text-align: center;
            width: 750px;
            height: 350px;
        }

        .queryDes article .studentInfo tr {
            /*line-height:30px;*/
        }

        .queryDes article .studentInfo td {
            border: 1px solid #AEC6C9;
        }

        /*奇数*/
        .queryDes article .studentInfo td:nth-child(odd) {
            background-color: #F1F1F1;
            width: 100px;
            font-weight: bold;
        }

        /*偶数*/
        .queryDes article .studentInfo td:nth-child(even) {
            width: 150px;
            font-size: small;
        }

        .queryDes .line {
            height: 0;
            width: 100%;
            border: 1px solid silver;
            margin: 5px 0 0 0;
        }

        /*学生家庭情况表*/
        .queryDes article .studentFamily {
            margin: auto;
            border: 1px solid #AEC6C9;
            border-collapse: collapse;
            text-align: center;
        }

        /*.queryDes article .studentFamily tr {*/
        /*line-height: 50px;*/
        /*}*/

        .queryDes article .studentFamily td {
            width: 110px;
            padding: 0 3px;
            border: 1px solid #AEC6C9;
        }

        .queryDes article .studentFamily .resultTitle {
            background-color: #F1F1F1;
            line-height: 30px;
            letter-spacing: 4px;
            font-weight: bold;
            font-size: large;
        }

        .queryDes article .resultTitle td:nth-child(4) {
            width: 170px;
        }

        /*学生参加课外活动表*/
        .queryDes article .studentActivity {
            margin: auto;
            border: 1px solid #AEC6C9;
            border-collapse: collapse;
            text-align: center;
        }

        .queryDes article .studentActivity td {
            border: 1px solid #AEC6C9;
            height: 45px;
        }

        .queryDes article .studentActivity td:nth-child(odd) {
            width: 200px;
            font-size: large;
            font-weight: bold;
        }

        .queryDes article .studentActivity td:nth-child(even) {
            width: 550px;
            font-size: small;
        }
    </style>
</head>
<body>

<div class="queryDes">
    <div class="tab">
        <span class="active" about="studentInfo">个人资料</span>
        <span about="studentFamily">家庭情况</span>
        <span about="studentActivity">课外活动</span>
        <p class="sno">123141441</p>
    </div>
    <article>
        <!--个人信息-->
        <table class="studentInfo" >
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
                <td>
                    获得的奖项
                </td>
                <td id="award">
                </td>
            </tr>
            <tr>
                <td>
                    本学期的目标
                </td>
                <td id="goal">
                </td>
            </tr>

            <tr>
                <td>
                    参加社会实践情况
                </td>
                <td id="done">
                </td>
            </tr>
            <tr>
                <td>
                    参加其他活动情况
                </td>
                <td id="other">
                </td>
            </tr>
            <tr>
                <td>
                    大学四年的目标
                </td>
                <td id="goals">
                </td>
            </tr>

            <tr>
                <td>
                    在校期间受到的处分
                </td>
                <td id="punish">
                </td>
            </tr>
            <tr>
                <td>
                    参加创新创业竞赛情况
                </td>
                <td id="created">
                </td>
            </tr>
            <tr>
                <td>
                    参加校园文化活动情况
                </td>
                <td id="culture">
                </td>
            </tr>
        </table>
    </article>
</div>
</body>
</html> 