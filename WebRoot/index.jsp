<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh">
<head>
<meta http-equiv="pragma" content="no-cache"> 

<meta http-equiv="cache-control" content="no-cache"> 

<meta http-equiv="expires" content="0"> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录注册界面</title>
    <link rel="stylesheet" type="text/css" href="static/scripts/css/sign.css">
    <script type="text/javascript" src="static/scripts/js/jquery-1.11.2.min.js"></script>
    <style>
        .login-wrap {
         background: url(static/img/bg.jpg) no-repeat center;
        }
    </style>
    <script>
      $(function(){
      	  //登录
          $("#loginBtn").click(function(){
          		$userId=$("#user").val();
          		$password=$("#pass").val();
          		$type=$("input[name='type']:checked").val();
          		if($userId.length==0){
          			$("#user").css({"border":"1px red solid"}).attr("placeholder","学号/工号不能为空");
          		}else if($password.length==0){
          		    $("#user").css({"border":"none"}).attr("placeholder","学号/工号不能为空");
          			$("#pass").css({"border":"1px red solid"}).attr("placeholder","密码不能为空");
          		}else{
         			/* login($userId,$password,$type); */
         			$("#login").submit();
         		}
          		
          });
          //注册
          $(".sign-up-htm .input").blur(function(){
          		if($(this).val().length==0){
          			$(this).attr("placeholder","这里不能为空哦");
          			$(this).focus();
         		};		
       		});
         $("#signBtn").click(function(){
          		$user_up=$("#user_up").val();
          		$pass_up=$("#pass_up").val();
          		$id_up=$("#id_up").val();
          		$tel_up=$("#tel_up").val();
          		signUp($user_up,$pass_up,$id_up,$tel_up);
          		
          });
          function login($userId,$password,$type){
			 $.ajax({
			 	cache: false,
				async: false,
				type: "POST",
				dataType: "json",
				url:"/energy/UserSlt",
				data:{
					method:"login",
					userId:$userId,
					password:$password,
					type:$type,
				},
				beforeSend:function(){
				},
				success:function(data){
				}
			});
		  }
          function signUp($user_up,$pass_up,$id_up,$tel_up){//提交到StudentSlt中处理
			 $.ajax({
				type:"post",
				dataType:"html",
				url:"StudentSlt",
				data:{
					operation:"add",
					userName:$user_up,
					password:$pass_up,
					userId:$id_up,
					tel:$tel_up,
				},
				beforeSend:function(){
				},
				success:function(data){
					if(data=="true"){
						location.href="index.jsp";
					}
				}
			});
		  }
      });
    </script>
</head>
<body>
<div class="jq22-container" style="padding-top:100px">
    <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登 录</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注 册</label>
            <div class="login-form">
                <div class="sign-in-htm">
		        <form id="login" action="UserSlt" method="post">
                    <div class="group">
                        <label for="user" class="label">学号/工号</label>
                        <input id="user" type="text" class="input" placeholder="学号/工号" name="userId">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">密码</label>
                        <input id="pass" type="password" class="input" data-type="password" name="password">
                        <img src="static/img/eye.png" class="eye"/>
                    </div>
                    <div class="group">
                        <input id="check1" type="radio" class="check" checked name="type" value="student">
                        <label for="check1"><span class="icon"></span>学生</label>

                        <input id="check2" type="radio" class="check" name="type" value="teacher">
                        <label for="check2"><span class="icon"></span>老师</label>

                        <input id="check3" type="radio" class="check" name="type" value="admin">
                        <label for="check3"><span class="icon"></span>管理员</label>
                    </div>
                    <div class="group">
                    	<input type="hidden" name="method" value="login">
                        <input type="submit" class="button" value="登录" id="loginBtn">
                    </div>
                    <img src="<c:url value='/static/img/error.png'/>"/><span style="color:red;">${error }</span>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a href="#forgot">忘记密码?</a>
                    </div>
                </form>
                </div>
                <div class="sign-up-htm">
                    <div class="group">
                        <label for="user_up" class="label">姓名</label>
                        <input id="user_up" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="pass_up" class="label">密码</label>
                        <input id="pass_up" type="password" class="input" data-type="password">
                        <img src="static/img/eye.png" class="eye"/>
                    </div>
                    <div class="group">
                        <label for="id_up" class="label">学号</label>
                        <input id="id_up" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="tel_up" class="label">手机号</label>
                        <input id="tel_up" type="text" class="input">
                    </div>
                    <div class="group">
                        <input type="submit" class="button" value="注 册" id="signBtn">
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <label for="tab-1"><a>我有账号</a></label>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>
</body>
</html>