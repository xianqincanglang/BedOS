<%@page import="hibernate.StuInfo"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="/BedOS/css/student_manage_info.css"/>
</head>
<body>
	<div>
		<div class="info_top">
			<p class="info_top_title">学生管理->个人信息</p>
		</div>
		<div>
			
			<table class="stu_info_table" cellspacing="0px" align="center">
				<tr class="table_header">
					<th>学生学号</th>
					<th>学生姓名</th>
					<th>学生年龄</th>
					<th>学生性别</th>
					<th>学生宿舍楼号</th>
					<th>学生寝室号</th>
					<th>学生床位号</th>
					<th>修改</th>
					<th>删除</th>
				<tr>
			
			<%
				String currPage = request.getParameter("currPage");
				int iCurrPage = 1;	//当前所在页的页数
				int pages = 1;	//页数
				int totalRecordCount = 0;	//总记录数目
				int perPageCount = 5;		//每一页的数目
				totalRecordCount = HibernateUtil.findStudentCount();
				
				
				pages = (totalRecordCount-1)/perPageCount+1;
				
				if(pages == 0){
					pages = 1;
				}
				
				if(currPage != null && !currPage.equalsIgnoreCase("")){
					iCurrPage = Integer.parseInt(currPage);
				}
				
				
				List studentInfo = HibernateUtil.findStudentInfo((iCurrPage-1)*perPageCount, perPageCount);
				if(studentInfo.isEmpty()){
					out.println("暂无消息");
				}
				
				if(!studentInfo.isEmpty() && studentInfo.size()>0){
					for(int i = 0;i<studentInfo.size();i++){
						StuInfo stuInfo = (StuInfo)studentInfo.get(i);
						session.getAttribute("meeting");
						%>
						<tr>
							<td><%=stuInfo.getStuNum() %></td>
							<td><%=stuInfo.getStuName() %></td>
							<td><%=stuInfo.getStuAge() %></td>
							<td><%=stuInfo.getStuSex() %></td>
							<td><%=stuInfo.getStuFloorNum() %></td>
							<td><%=stuInfo.getStuDormNum() %></td>
							<td><%=stuInfo.getStuBedNum() %></td>
							<td><a href="/BedOS/jsp/student_manage_info_modifyIndex.jsp?stuNum=<%=stuInfo.getStuNum()%>">修改</a></td>
							<td><a href="/BedOS/jsp/student_manage_info_delete.jsp?stuNum=<%=stuInfo.getStuNum()%>">删除</a></td>
						</tr>
			<%			
					}
				}
			%>
			</table>
			<%
				if(perPageCount<totalRecordCount){
					String href = "&nbsp;&nbsp;<a href='student_info_index.jsp?currPage=";
					StringBuffer stringBuffer = new StringBuffer();
					if(iCurrPage >1){
						stringBuffer.append(href+(iCurrPage-1)+"'>上一页</a>");
					}
					for(int i = 1;i<=pages;i++){
						if(i==iCurrPage){
							stringBuffer.append(href+i+"'>["+i+"]</a>");
						}else{
							stringBuffer.append(href+i+"'>"+i+"</a>");
						}
					}
					if(iCurrPage < pages){
						stringBuffer.append(href+(iCurrPage+1)+"'>下一页</a>");
					}
					%>
					<div class="paging">
						<%out.print("当前页数为:["+iCurrPage+"/"+pages+"]"); %>
						<%=stringBuffer.toString() %>
					</div>
					
					<%
				}
			%>
		</div>
	</div>
</body>
</html>