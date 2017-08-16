<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="static/scripts/js/jquery-1.11.2.min.js"></script>
<link href="static/scripts/css/base.css" rel="stylesheet"
	type="text/css">
<link href="static/scripts/css/default.css" rel="stylesheet"
	type="text/css">
<link href="static/scripts/css/normalize.css" rel="stylesheet"
	type="text/css">
<style>
* {
	margin: 0;
	padding: 0;
}
</style>
<script>
	$(function() {
		$.ajax({
			type : "post",
			url : "InformSlt",
			dateType : "json",
			data : {
				operation : "query",
			},
			success : function(informs) {
				var show = "";
				for (var i = 0; i < informs.length; i++) {
					show += "<div class='timeline-item'>";
					show += "<div class='timeline-icon'>";
					if (i % 2 == 0) {
						show += "<img src='static/img/book.svg' alt=''>";
						show += "</div><div class='timeline-content'>";
					} else {
						show += "<img src='static/img/star.svg' alt=''>";
						show += "</div><div class='timeline-content right'>";
					}

					show += "<h2>" + informs[i].i_title+"</h2>";
					show += "<p>" + informs[i].i_content + "<div style='font-size:x-small;'>" + informs[i].i_create + "</div> </p>";
					show += "</div></div>";
				}
				$("#timeline").append(show);
			}
		});

	});
</script>
</head>
<body id="infAll2Body">
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>
				所有大事记 <span>一览图</span>
			</h1>

		</header>
		<div class="container">
			<div id="timeline">
				<!-- 
				<div class="timeline-item">
					<div class="timeline-icon">
						<img src="static/img/star.svg" alt="">
					</div> 
					<div class="timeline-content">
						<h2>LOREM IPSUM DOLOR</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Atque, facilis quo maiores magnam modi ab libero praesentium
							blanditiis.</p>
						<a href="#" class="btn">button</a>
					</div>
				</div>

				<div class="timeline-item">
					<div class="timeline-icon">
						<img src="static/img/book.svg" alt="">
					</div>
					<div class="timeline-content right">
						<h2>LOREM IPSUM DOLOR</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Atque, facilis quo. Maiores magnam modi ab libero praesentium
							blanditiis consequatur aspernatur accusantium maxime molestiae
							sunt ipsa.</p>
						<a href="#" class="btn">button</a>
					</div>
				</div>
 -->
			</div>
		</div>

	</div>
</body>
</html>