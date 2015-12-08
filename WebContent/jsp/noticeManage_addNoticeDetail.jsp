<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link style="text/css" rel="stylesheet" href="/BedOS/css/noticeManage_addNotice.css"/>
	<link style="text/css" rel="stylesheet" href="/BedOS/css/bootstrap.css"/>
</head>
<body>
	<div>
		<div class="notice_add_top">
			公告管理->发布公告
		</div>
		<div class="notice_add_form">
			<form class="form-horizontal" name="addNotice" method="post">
				<div class="form-group">
					<label>公告标题</label>
					<input type="text" class="form-control" name="noticeTitle" placeholder="公告标题">	
				</div>
					
				<div class="form-group">
					<label>公告内容</label>
					<input type="text" class="form-control" name="noticeContent" placeholder="公告内容">	
				</div>
				
				<div class="form-group">
					<label>公告开始时间</label>
					<input type="text" class="form-control" name="noticeStartTime" placeholder="公告开始时间">	
				</div>
				
				<div class="form-group">
					<label>公告结束时间</label>
					<input type="text" class="form-control" name="noticeEndTime" placeholder="公告结束时间">	
				</div>	

				<div>
					<button type="submit" class="btn btn-default" style="margin_left:-18px;" onclick="noticeAdd()">提交</button>
				</div>
			</form>
		
		</div>
	</div>
</body>
</html>