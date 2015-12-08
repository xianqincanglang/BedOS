<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="/BedOS/css/bootstrap.css"/>
	<link type="text/css" rel="stylesheet" href="/BedOS/css/disManage_addDis.css"/>
	<script type="text/javascript" src="/BedOS/js/jquery.js"></script>
	<script type="text/javascript" src="/BedOS/js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="/BedOS/js/disManage.js"></script>
	
</head>
<body>
	<div>
		<div class="addDisTop">
			<p>违纪管理->添加违纪</p>
		</div>
		<div class="addDisContent">
			<form  method="post" name="addDis" class="addDisForm" style="width: 50%;margin:0 auto;">
			
				<div class="form-group">
					<label>违纪类型</label>
					<select onchange="change(this)" class="form-control disType">
						<option>学生违纪</option>
						<option>寝室违纪</option>
					</select>	
				</div>
				<!-- 学生违纪 -->
				<!-- <div class="form-group student">
					<label>违纪原因</label>
					<select class="form-control">
						<option>晚归</option>
						<option>卫生</option>
					</select>	
				</div> -->
				<div class="form-group student">
					<label>违纪人学号</label>
					<input type="text" class="form-control" placeholder="学生学号" name="stuNum"/>
				</div>
				<div class="form-group student">
					<label>违纪分数</label>
					<input type="text" class="form-control" placeholder="分数" name="stuScore"/>
				</div>
				
				<div class="form-group student">
					<label>违纪日期</label>
					<input type="text" class="form-control" placeholder="日期" name="stuTime"/>
				</div>
				
				<div class="form-group student">
					<label>违纪情况</label>
					<input type="text" class="form-control" placeholder="违纪情况" name="stuCondition"/>
				</div>
				
				<!-- 寝室违纪 -->
				<!-- <div class="form-group student">
					<label>违纪原因</label>
					<select class="form-control">
						<option>大功率</option>
						<option>打架斗殴</option>
					</select>	
				</div> -->
				<div style="height: 0px;" class="dormForm">
				<div class="form-group dorm" style="visibility: hidden;">
					<label>寝室楼号</label>
					<input type="text" class="form-control"  placeholder="寝室楼号" name="dormFloor"/>
				</div>
				<div class="form-group dorm" style="visibility: hidden;">
					<label>寝室号</label>
					<input type="text" class="form-control" placeholder="寝室号" name="dormNum"/>
				</div>
				
				<div class="form-group dorm" style="visibility: hidden;">
					<label>违纪分数</label>
					<input type="text" class="form-control" placeholder="违纪分数" name="dormScore"/>
				</div>
				<div class="form-group dorm" style="visibility: hidden;">
					<label>违纪日期</label>
					<input type="text" class="form-control" placeholder="违纪日期" name="dormTime"/>
				</div>
				<div class="form-group dorm" style="visibility: hidden;">
					<label>违纪情况</label>
					<input type="text" class="form-control" placeholder="违纪情况" name="dormCondition"/>
				</div>
				</div>
				<button type="submit" class="btn btn-default" onclick="typeCheck()">提交</button>
				<script type="text/javascript">
					function change (self) {
						if(self.value=="学生违纪"){
							
							$(".student").show();
							 $(".dorm").hide(); 
						}else{
							
							$(".student").hide();
							$(".dorm").css("visibility","visible");
							$(".dormForm").css("height","inherit");
							 $(".dorm").show(); 
						}						
					}
					
					function getElementsByClassName(claName,tagName,flag){
						var classElements=[];
						classElements = document.getElementsByTagName(tagName);
						for(var i = 0;i<classElements.length;i++){
							if(classElements[i].className==claName){
								if(!flag){
									classElements[i].style.display="none";
									
								}else{
									classElements[i].style.display='block';
								}
							}
						}
					}
				</script>
				
				
				
			</form>
			
		</div>
	</div>
</body>
</html>