	$(function() {
		count = 1;

		function show(pageNumber) {
			$stuMajor = $(".stuMajor option:selected").val();
			$stuClassno = $(".stuClassno option:selected").val();
			$stuSex = $(".stuSex option:selected").val();
			$stuJob = $(".stuJob option:selected").val();
			if ($(".stuMajor option:eq(0)").is(":selected")) {
				$stuMajor = "";
			}
			if ($(".stuClassno option:eq(0)").is(":selected")) {
				$stuClassno = "";
			}
			if ($(".stuSex option:eq(0)").is(":selected")) {
				$stuSex = "";
			}
			if ($(".stuJob option:eq(0)").is(":selected")) {
				$stuJob = "";
			}
			$.ajax({
						type : "post",
						url : "StudentSlt",
						dateType : "html",
						data : {
							offset : pageNumber,
							param : $("header input[type='text']").val(),
							stuMajor : $stuMajor,
							stuClassno : $stuClassno,
							stuSex : $stuSex,
							stuJob : $stuJob,
							operation : "query",
						},
						success : function(list) {
							//console.log(list);
							$table = $(".queryStu article table");
							//先清空上次查询结果
							$(".queryStu tr:gt(0)").remove();
							for (var i = 0; i < list.length - 1; i++) {
								//console.log(list[i].stu_birth);
								$table.append("<tr>");
								
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td><input type='checkbox' name='delete'></td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td class='userId' title='click the userId'>" + list[i].user_id
												+ "</td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].user_name + "</td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].stu_sex + "</td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].stu_job + "</td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].stu_major + "</td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].stu_classno + "</td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].stu_classno + "</td>");
								$(
										".queryStu article table tr:eq("
												+ (i + 1) + ")").append(
										"<td>" + list[i].stu_home + "</td>");
								$table.append("</tr>");
							}
							count = list[list.length - 1].count;
							//console.log("页数："+count);/*分页*/
							$(".pageCode").createPage({
								current : pageNumber,
								pageCount : (count / 15) + 1,
							});
							$(".queryStu table .userId").click(function() {
								$.ajax({
									type : "post",
									url : "stuDes.jsp",
									data : {
										userId : $(this).html(),
									},
									success : function(data) {
										$(".queryStu").parent().html(data);
									}
								});
							});
						}
					});
		}
		//console.log(count);
		/*分页*/
		$(".pageCode").createPage({
			current : 1,
			backFn : function(p) {
				show(parseInt(p));

			},
			pageCount : 0,
		});
		$("header input[type='button']").click(function() {
			show(1);
		});

	});