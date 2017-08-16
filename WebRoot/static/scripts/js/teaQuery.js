$(function() {
	count = 1;

	function show(pageNumber) {
		$.ajax({
			type : "post",
			url : "UserSlt",
			dateType : "html",
			data : {
				offset : pageNumber,
				param : $("header input[type='text']").val(),
				operation : "queryTea",
			},
			success : function(list) {
				// console.log(list);
				$table = $(".queryStu article table");
				// 先清空上次查询结果
				$(".queryStu tr:gt(0)").remove();
				for (var i = 0; i < list.length - 1; i++) {
					 console.log(list[i]);
					$table.append("<tr>");

					$(".queryStu article table tr:eq(" + (i + 1) + ")").append(
							"<td><input type='checkbox' name='delete'></td>");
					$(".queryStu article table tr:eq(" + (i + 1) + ")").append(
							"<td class='userId' title='click the userId'>"
									+ list[i].user_id + "</td>");
					$(".queryStu article table tr:eq(" + (i + 1) + ")").append(
							"<td>" + list[i].user_name + "</td>");
					$(".queryStu article table tr:eq(" + (i + 1) + ")").append(
							"<td>" + list[i].user_tel + "</td>");
					$table.append("</tr>");
				}
				count = list[list.length - 1].count;
				// console.log("页数："+count);/*分页*/
				$(".pageCode").createPage({
					current : pageNumber,
					pageCount : (count / 15) + 1,
				});
			}
		});
	}
	// console.log(count);
	/* 分页 */
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