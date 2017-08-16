<%@page import="service.InformService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .informs {
            width: 950px;
            border: 1px solid #F1F1F1;
            background-color: white;
            box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.3);
            margin: 0 auto;
            height: 620px;
            max-height: 620px;
        }

        .informs .title {
            width: 750px;
            margin: 10px auto 20px;
            position: relative;
            text-align: center;
        }

        .informs p {
            position: relative;
            border: 0;
            height: 450px;
            width: 750px;
            display: block;
            margin: 20px auto 20px;
            font-size: large;
            text-indent: 2em;
            line-height: 30px;
        }

        @-webkit-keyframes shineBlue {
            from {
                -webkit-box-shadow: 0 0 9px #333;
            }
            50% {
                -webkit-box-shadow: 0 0 18px black;
            }
            to {
                -webkit-box-shadow: 0 0 9px #333;
            }
        }

        .shine_blue {
            -webkit-animation-name: shineBlue;
            -webkit-animation-duration: 2s;
            -webkit-animation-iteration-count: infinite;
        }

        .informs span {
            margin:10px 0 0 700px;
            display: block;
            width: 150px;
        }
    </style>
</head>

<body>
<%
String i_id=request.getParameter("i_id");
InformService informService=new InformService();
Map<String,Object> map=informService.getInformByIid(i_id);
%>
<div class="informs">
    <h1 class="title"><%=map.get("i_title")%></h1>
    <p id="content" class="shine_blue"><%=map.get("i_content")%></p>
    <span class="time"><%=map.get("i_create") %></span>
</div>
</body>
</html>
