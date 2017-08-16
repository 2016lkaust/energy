<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>备忘录界面</title>
  <style>
        #bacBody {
            margin: 0;
            padding: 0;
            background-color:white;
            min-height:620px;
            
        }

        #bacBody .col-md-3 {
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
            width: 22%;
        }

        @media (min-width: 992px) {
            .col-md-3 {
                float: left
            }
        }

        .panel {
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 4px;
            -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .5);
            box-shadow: 0 3px 8px rgba(0, 0, 0, .5);
            margin-top:5px;
        }

        .panel-body {
            padding: 15px
        }

        .panel-heading {
            padding: 10px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px
        }

        .panel-heading > .dropdown .dropdown-toggle {
            color: inherit
        }

        .panel-title {
            margin-top: 0;
            margin-bottom: 0;
            font-size: 16px;
            color: inherit
        }

        .panel-title > a {
            color: inherit
        }

        .panel-footer {
            padding: 10px 15px;
            background-color: #f5f5f5;
            border-top: 1px solid #ddd;
            border-bottom-right-radius: 3px;
            border-bottom-left-radius: 3px
        }

        .panel-primary {
            border-color: #428bca!important;
        }

        .panel-primary > .panel-heading {
            color: #fff!important;
            background-color: #428bca!important;
            border-color: #428bca!important;
        }

        .panel-primary > .panel-heading + .panel-collapse > .panel-body {
            border-top-color: #428bca!important;
        }

        .panel-primary > .panel-heading .badge {
            color: #428bca!important;
            background-color: #fff!important;
        }

        .panel-primary > .panel-footer + .panel-collapse > .panel-body {
            border-bottom-color: #428bca!important;
        }

        .panel {
            border-color: #d6e9c6;
        }

        .panel > .panel-heading {
            color: #3c763d;
            background-color: #D9EDF6;
            border-color: #d6e9c6;
        }

        .panel > .panel-heading + .panel-collapse > .panel-body {
            border-top-color: #d6e9c6;
        }

        .panel > .panel-heading .badge {
            color: #dff0d8;
            background-color: #3c763d;
        }

        .panel > .panel-footer + .panel-collapse > .panel-body {
            border-bottom-color: #d6e9c6;
        }

        #bacBody {
            overflow-y: auto;
        }

        #bacBody .panel {
            height: auto;
            max-height: 280px;
        }

        #bacBody .panel-heading {
            height: 20px;
        }

        #bacBody .panel-title {
            display: inline;
        }

        #bacBody .panel-heading img {
            float: right;
            height: 20px;
        }

        #bacBody .panel-footer {
            height: 13px;
            font-size: small;
            padding-top: 3px;
            text-align: right;
        }
    </style>
<script type="text/javascript"
	src="static/scripts/js/jquery-1.11.2.min.js"></script>

<script>
	$(function() {
		$.ajax({
			type : "post",
			url : "BacklogSlt",
			dateType : "json",
			data : {
				operation : "query",
			},
			success : function(list) {
				console.log(list);
				initBacklog(list);
				changeStyle();
			}
		});
		function initBacklog(list) {
			var divs = "";
			for (var i = 0; i < list.length; i++) {
				divs += "<div class='col-md-3'>";
				if(list[i].b_completed=="1"){
					divs+="<div class='panel panel-primary'><div class='panel-heading'><h3 class='panel-title'>";
					divs += list[i].b_title	+ "</h3>";
					divs+="<img src='static/img/completed.png' value='completed'/>";
				}else{
					divs+="<div class='panel'><div class='panel-heading'><h3 class='panel-title'>";
					divs += list[i].b_title	+ "</h3>";
					divs+="<img src='static/img/uncomplete.png' value='uncomplete'/>";
				}
				divs += "</div><div class='panel-body'>";
				divs += list[i].b_content + "</div><div class='panel-footer'>";
				divs += list[i].b_created + "</div></div></div>";
			}
			$("#bacBody").append(divs);
		}
		function changeStyle(){
            $("img").click(function(){
                $(this).parent().parent().toggleClass("panel-primary");
                var $src=$(this).attr("src");
                if($src=="static/img/completed.png"){
                    $(this).attr("src","static/img/uncomplete.png");
                }else{
                    $(this).attr("src","static/img/completed.png");
                }
        });
		
		
		}
		
		
	});
</script>
</head>
<body>
	<div id="bacBody">
	</div>
</body>
</html>