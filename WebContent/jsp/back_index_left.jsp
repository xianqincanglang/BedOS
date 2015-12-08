<?xml version="1.0" encoding="UTF-8" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
	<jsp:directive.page contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" session="false"/>
	<jsp:output doctype-root-element="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		omit-xml-declaration="true" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<link href="/BedOS/css/back_index_left.css" type="text/css" rel="stylesheet"/>
</head>
<body>
	<div id="middle_left">
			<div class="left_first">
				<a><img src="/BedOS/images/back_index/back_index_info.png" alt="#"></img></a>
				<a><img src="/BedOS/images/back_index/back_index_alert.png" alt="#"></img></a>
				<a><img src="/BedOS/images/back_index/back_index_danger.png" alt="#"></img></a>
				<a><img src="/BedOS/images/back_index/back_index_set.png" alt="#"></img></a>
			</div>

			<div class="left_second">
				<div class="subNavBox">
					<div class="subNavTitle currentDd currentDt">
						<a href="/BedOS/jsp/back_index.jsp">控制台</a>
					</div>
					<div class="subNavTitle">
						<a href="/BedOS/jsp/personal_info_index.jsp">个人信息</a>
					</div>
					<div class="subNavTitle">学生管理</div>
					<ul class="navContent">
						<li><a href="/BedOS/jsp/student_manage_add_index.jsp">新生录入</a></li>
						<li><a href="/BedOS/jsp/student_info_index.jsp">学生信息</a></li>
					</ul>

					<div class="subNavTitle">违纪管理</div>
					<ul class="navContent">
						<li><a href="/BedOS/jsp/disManage_addDisIndex.jsp">添加违纪</a></li>
						<li><a href="/BedOS/jsp/disManage_showStudentIndex.jsp">学生违纪</a></li>
						<li><a href="/BedOS/jsp/disManage_showDormIndex.jsp">寝室违纪</a></li>
					</ul>

					<div class="subNavTitle">公告管理</div>
					<ul class="navContent">
						<li><a href="/BedOS/jsp/noticeManage_addNoticeIndex.jsp">发布公告</a></li>
						<li><a href="/BedOS/jsp/noticeManage_showNoticeIndex.jsp">公告记录</a></li>
					</ul>

					<div class="subNavTitle">寝室管理</div>
					<ul class="navContent">
						<li><a href="/BedOS/jsp/dormManage_repairIndex.jsp">报修管理</a></li>
					</ul>
				</div>

			</div>

		</div>
</body>
</html>
</jsp:root>