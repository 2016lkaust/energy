/*查询学生个人信息*/
function stuInfo() {
	$.ajax({
		type : "post",
		url : "StudentSlt",
		dateType : "html",
		data : {
			userId : userId,
			type : "studentInfo",
			operation : "studentDes",
		},
		success : function(list) {
			var stuInfo = list[0];
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
/*查询学生家庭信息*/
function stuFamily() {
	$.ajax({
		type : "post",
		url : "StudentSlt",
		dateType : "json",
		data : {
			userId : userId,
			type : "studentFamily",
			operation : "studentDes",
		},
		success : function(list) {
			$table = $(".queryDes .studentFamily");
			// 先清空上次查询结果
			$(".queryDes .studentFamily tr:gt(0)").remove();
			var tBody="";
			
			for (var i = 0; i < list.length; i++) {
				tBody="<tr>";
				tBody+="<td>" + list[i].fa_name + "</td>";
				tBody+="<td>" + list[i].fa_relative + "</td>";
				tBody+="<td>" + list[i].fa_status + "</td>";
				tBody+="<td>" + list[i].fa_company + "</td>";
				tBody+="<td>" + list[i].fa_tel + "</td>";
				tBody+="<td>" + list[i].fa_other + "</td>";
				tBody+="</tr>";
			}
			$table.append(tBody);
		}
	});
}
/*查询学生参加的活动*/
function stuAcitity() {
	$.ajax({
		type : "post",
		url : "StudentSlt",
		dateType : "html",
		data : {
			userId : userId,
			type : "studentActivity",
			operation : "studentDes",
		},
		success : function(list) {
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