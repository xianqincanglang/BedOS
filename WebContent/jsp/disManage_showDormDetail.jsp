<%@page import="hibernate.DormScore"%>
<%@page import="hibernate.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="/BedOS/css/disManage_dormDis.css">
</head>
<body>
	<div>
		<div class="showDormDisTop">
			<p>违纪管理->寝室违纪</p>
		</div>
		<div>
			
			<table class="dis_student_table" cellspacing="0px" align="center">
				<tr class="table_header">
					<th>寝室楼号</th>
					<th>寝室号</th>
					<th>违纪分数</th>
					<th>违纪情况</th>
					<th>违纪日期</th>
					<th>操作</th>
				<tr>
			
			<%
				String currPage = request.getParameter("currPage");
				int iCurrPage = 1;	//当前所在页的页数
				int pages = 1;	//页数
				int totalRecordCount = 0;	//总记录数目
				int perPageCount = 5;		//每一页的数目
				totalRecordCount = HibernateUtil.disManage_findDormScoreCount();
				
				
				pages = (totalRecordCount-1)/perPageCount+1;
				
				if(pages == 0){
					pages = 1;
				}
				
				if(currPage != null && !currPage.equalsIgnoreCase("")){
					iCurrPage = Integer.parseInt(currPage);
				}
				List dormScoreInfo = HibernateUtil.disManage_findDormScoreInfo((iCurrPage-1)*perPageCount, perPageCount);
				
				
				
				if(dormScoreInfo.isEmpty()){
					out.println("暂无消息");
				}
				
				if(!dormScoreInfo.isEmpty() && dormScoreInfo.size()>0){
					for(int i = 0;i<dormScoreInfo.size();i++){
						DormScore dormScore = (DormScore)dormScoreInfo.get(i);
						
						%>
						<tr>
							<td><%=dormScore.getId().getDormFloorNum() %></td>
							<td><%=dormScore.getId().getDormDormNum() %></td>
							<td><%=dormScore.getDormScore() %></td>
							<td><%=dormScore.getDormScoreCondition() %></td>
							<td><%=dormScore.getDormScoreTime() %></td>
							<td><a href="/BedOS/jsp/disManage_showDormDelete.jsp?floorNum=<%=dormScore.getId().getDormFloorNum()
							%>&dormNum=<%=dormScore.getId().getDormDormNum() %>">删除</a></td>
						</tr>
			<%			
					}
				}
			%>
			</table>
			<%
				if(perPageCount<totalRecordCount){
					String href = "&nbsp;&nbsp;<a href='disManage_showDormIndex.jsp?currPage=";
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