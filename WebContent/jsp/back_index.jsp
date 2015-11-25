<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="css/back_index_top.css"/>
		<link type="text/css" rel="stylesheet" href="css/back_index_left.css"/>
		<link type="text/css" rel="stylesheet" href="css/back_index_right_top.css"/>
		<title>Insert title here</title>
		<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
		<script type="text/javascript">

			$(function(){
				$(".subNavTitle").click(function(){
					$(this).toggleClass("currentDd").siblings(".subNavTitle").removeClass("currentDd")
					$(this).toggleClass("currentDt").siblings(".subNavTitle").removeClass("currentDt")
					$(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(500)
				})
			})
		</script>
	</head>
<body>
	<!-- 顶部 -->
	<div id="top">
		<ul id="top_left_list">
			<%--<li><img src="" alt="aaa" align="middle"/></li>--%>
			<li><label class="">寝室管理系统</label></li>
		</ul>
		<ul id="top_right_list">
			<li>4</li>
			<li>5</li>
			<li>4</li>
			<li>欢迎光临</li>
		</ul>
	</div>
	
	<!-- 主要内容 -->
	<div id="middle">
		<div id="middle_left">
			<div class="left_first">
				<a><img src="images/back_index/back_index_info.png" alt="#"></a>
				<a><img src="images/back_index/back_index_alert.png" alt="#"></a>
				<a><img src="images/back_index/back_index_danger.png" alt="#"></a>
				<a><img src="images/back_index/back_index_set.png" alt="#"></a>
			</div>

			<div class="left_second">
				<div class="subNavBox">
					<div class="subNavTitle currentDd currentDt">控制台</div>
					<div class="subNavTitle currentDd currentDt">个人信息</div>
					<div class="subNavTitle">学生管理</div>
					<ul class="navContent">
						<li><a>新生录入</a></li>
						<li><a>学生信息</a></li>
					</ul>

					<div class="subNavTitle">学生违纪</div>
					<ul class="navContent">
						<li><a>基本违纪</a></li>
						<li><a>晚归</a></li>
						<li><a>大功率</a></li>
					</ul>

					<div class="subNavTitle">公告管理</div>
					<ul class="navContent">
						<li><a>发布公告</a></li>
						<li><a>公告记录</a></li>
					</ul>

					<div class="subNavTitle">寝室管理</div>
					<div class="subNavTitle">报修管理</div>
				</div>

			</div>

		</div>

		<div id="middle_right">
			<div class="right_content_title">
				<div class="rightTip">
					<ul class="tip">
						<li><img src="images/back_index/back_index.png" alt="#"></li>
						<li><span>控制台</span></li>
					</ul>
				</div>
				<div class="search">
					<form action="">
						<input type="text" name="search"/>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>