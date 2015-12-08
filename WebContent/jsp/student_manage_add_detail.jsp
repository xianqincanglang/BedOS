<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<link style="text/css" rel="stylesheet" href="/BedOS/css/student_manage_add.css"/>
	<link style="text/css" rel="stylesheet" href="/BedOS/css/bootstrap.css"/>
	
	
<!-- 	<script type="text/javascript">
		function check() {
			document.addStudent.submit();
		}
		function  cancel() {
			alert("重置");
		}
	</script> -->
</head>
<body>
	<div>
		<div class="stu_top">
			学生管理->新生录入
		</div>
		<div class="stu_add_form">
			<form class="form-horizontal" name="addStudent" method="post">
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">学生学号</label>
					<div>
						<input type="text" class="form-comtrol" id="" name="stuNum" placeholder="学生学号">
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">学生姓名</label>
					<div>
						<input type="text" class="form-comtrol" id="" name="stuName" placeholder="学生姓名">
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">学生年龄</label>
					<div>
						<input type="text" class="form-comtrol" id="" name="stuAge" placeholder="学生年龄">
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">学生性别</label>
					<div>
						<input type="text" class="form-comtrol" id="" name="stuSex" placeholder="学生性别">
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label" >宿舍楼号</label>
					<div>
						<input type="text" class="form-comtrol" id=""  name="stuFloor" placeholder="宿舍楼号">
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">宿舍号</label>
					<div>
						<input type="text" class="form-comtrol" id="" name="stuDorm" placeholder="宿舍号">
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">床位号</label>
					<div>
						<input type="text" class="form-comtrol" id="" name="stuBed" placeholder="床位号">
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">联系方式</label>
					<div>
						<input type="text" class="form-comtrol" id="" name="stuTel" placeholder="联系方式">
					</div>
				</div>
				
				<div>
				
					<!-- <input  type="submit" value="提交"/> -->
			<!-- 	<!-- <button type="submit" class="btn btn-default" style="margin:0 20px;">提交</button> -->
					<button type="submit" class="btn btn-default" style="margin:0 20px;" onclick="check()">提交</button>
					<button type="submit" class="btn btn-default" onclick="cancel()">重置</button>
				</div>
			</form>
		
		</div>
	</div>
</body>
</html>