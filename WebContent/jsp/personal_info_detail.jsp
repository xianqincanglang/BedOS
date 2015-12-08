<%@page import="hibernate.AdminInfo"%>
<%@page import="hibernate.util.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 引入struts2自带的标签库 -->
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="/BedOS/js/jquery.js"></script>
	<script type="text/javascript" src="/BedOS/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/BedOS/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/BedOS/css/personal_info.css">
	
</head>
<body>
	<div >
		<div class="personal_top">
			<p>所在位置->个人信息</p>
		</div>
		<div class="content">
		
			<%
				String token = (String)application.getAttribute("token");
				String isAdmin = (String)application.getAttribute("isAdmin");
				List list = HibernateUtil.personalInfo_get(token, isAdmin);
					
				if(!list.isEmpty() && list.size()>0){
					for(int i = 0;i<list.size();i++){
						%>
						<%
							if(isAdmin.equals("1")){
								AdminInfo adminInfo = (AdminInfo)list.get(i);
								
								%>
								
					<form action="adminPersonalInfoAction" method="post">
					
					<div class="form-group">
						<label>管理员账号</label>
						<input type="text" class="form-control" name="adminId" readonly="readonly" placeholder="管理员账号" value="<%=adminInfo.getAdminId() %>">	
					</div>
					
					<%
						if(adminInfo.getAdminSex().equals("1")){
							%>
							<div class="form-group">
						<label>性别</label><br/>
						<label class="radio-inline" name="adminS">
						<input type="radio" name="adminSex" checked="checked" />男
						</label>
						<label class="radio-inline" name="adminS">
							<input type="radio" name="adminSex"/>女
						</label>	
					</div>
							<%
							
						}else{
							%>
							<div class="form-group">
						<label>性别(有误，暂时不能修改)</label><br/>
						<label class="radio-inline" name="adminS">
						<input type="radio" name="adminSex" />男
						</label>
						<label class="radio-inline" name="adminS">
							<input type="radio" name="adminSex" checked="checked"/>女
						</label>	
					</div>
							<%
						}
					%>
					
					
					<div class="form-group">
						<label>年龄</label>
						<input type="text" class="form-control" name="adminAge" placeholder="年龄" value="<%=adminInfo.getAdminAge()%>">
					</div>
					
					
					
					<div class="form-group">
						<label>联系方式</label>
						<input type="text" class="form-control" name="adminTel" placeholder="联系方式" value="<%=adminInfo.getAdminTel() %>">	
					</div>
					<div class="form-group">
						<label>管理楼号</label>
						<input type="text" class="form-control" name="adminFloorNum" placeholder="管理楼号" value="<%=adminInfo.getAdminFloorNum() %>">	
					</div>
					<button type="submit" class="btn btn-default">修改</button>
					
				</form>
								<%
							}
						%>
						
						<%
					}
				}
			%>

		</div>
	</div>
</body>
</html>