<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hibernate.util.HibernateUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="hibernate.StuInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="/BedOS/css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="/BedOS/css/student_manage_modify.css"/>
	<script type="text/javascript" src="/BedOS/js/StudentManage_modifyStudentInfo.js"></script>
</head>
<body>

	<div>
	
		<div class="modifyTop">
			<p>学生管理->学生信息->修改学生信息</p>
		</div>
		<div class="modifyForm">
				<%
				String stuNum = request.getParameter("stuNum");
				List listID = HibernateUtil.getStudentId(stuNum);
				if(!listID.isEmpty() && listID.size()>0){
					for(int i = 0;i<listID.size();i++){
						StuInfo stuInfo = (StuInfo)listID.get(i);
						%>
						<form class="form-horizontal" name="addStudent" method="post">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">学生学号</label>
							<div>
								<input type="text" class="form-comtrol" id="" name="stuNum" placeholder="学生学号" value="<%=stuInfo.getStuNum()%>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">学生姓名</label>
							<div>
								<input type="text" class="form-comtrol" id="" name="stuName" placeholder="学生姓名" value="<%=stuInfo.getStuName()%>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">学生年龄</label>
							<div>
								<input type="text" class="form-comtrol" id="" name="stuAge" placeholder="学生年龄" value="<%=stuInfo.getStuAge()%>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">学生性别</label>
							<div>
								<input type="text" class="form-comtrol" id="" name="stuSex" placeholder="学生性别" value="<%=stuInfo.getStuSex()%>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label" >宿舍楼号</label>
							<div>
								<input type="text" class="form-comtrol" id=""  name="stuFloor" placeholder="宿舍楼号" value="<%=stuInfo.getStuFloorNum()%>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">宿舍号</label>
							<div>
								<input type="text" class="form-comtrol" id="" name="stuDorm" placeholder="宿舍号" value="<%=stuInfo.getStuDormNum()%>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">床位号</label>
							<div>
								<input type="text" class="form-comtrol" id="" name="stuBed" placeholder="床位号" value="<%=stuInfo.getStuBedNum()%>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">联系方式</label>
							<div>
								<input type="text" class="form-comtrol" id="" name="stuTel" placeholder="联系方式" value="<%=stuInfo.getStuTel()%>">
							</div>
						</div>
						
						<div>
						
							<!-- <input  type="submit" value="提交"/> -->
					<!-- 	<!-- <button type="submit" class="btn btn-default" style="margin:0 20px;">提交</button> -->
							<button type="submit" class="btn btn-default" style="margin:0 20px;" onclick="check()">修改</button>
							<!-- <button type="submit" class="btn btn-default" onclick="cancel()">重置</button> -->
						</div>
					</form>
						
						<%
					}
				}
			%>
		</div>
	</div>
	
</body>
</html>