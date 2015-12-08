<%@page import="hibernate.Repair"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="/BedOS/css/dormManage_repair.css">
</head>
<body>
	<div>
		<div class="showRepairTop">
			<p>寝室管理->维修管理</p>
		</div>
		<div>
			
			<table class="repair_table" cellspacing="0px" align="center">
				<tr class="table_header">
					<th>维修内容</th>
					<th>维修日期</th>
					<th>楼号</th>
					<th>寝室号</th>
					<th>联系电话</th>
					<th>是否需要维修</th>
					<th>是否已经维修</th>
				<tr>
			
			<%
				String currPage = request.getParameter("currPage");
				int iCurrPage = 1;	//当前所在页的页数
				int pages = 1;	//页数
				int totalRecordCount = 0;	//总记录数目
				int perPageCount = 5;		//每一页的数目
				totalRecordCount = HibernateUtil.repair_findRepairCount();
				
				
				
				pages = (totalRecordCount-1)/perPageCount+1;
				
				if(pages == 0){
					pages = 1;
				}
				
				if(currPage != null && !currPage.equalsIgnoreCase("")){
					iCurrPage = Integer.parseInt(currPage);
				}
				List repairInfo = HibernateUtil.repair_findRepairInfo((iCurrPage-1)*perPageCount, perPageCount);
				
				
				
				if(repairInfo.isEmpty()){
					out.println("暂无消息");
				}
				
				if(!repairInfo.isEmpty() && repairInfo.size()>0){
					for(int i = 0;i<repairInfo.size();i++){
						Repair repair = (Repair)repairInfo.get(i);
						
						
						%>
						<tr>
							<td><%=repair.getContent() %></td>
							<td><%=repair.getDate() %></td>
							<td><%=repair.getTel() %></td>
							<td><%=repair.getFloorNum() %></td>
							<td><%=repair.getDormNum() %></td>
							<td><%=repair.getIsPassed() %></td>
							<td><%=repair.getIsSolved() %></td>
						</tr>
			<%			
					}
				}
			%>
			</table>
			<%
				if(perPageCount<totalRecordCount){
					String href = "&nbsp;&nbsp;<a href='dormManage_repairIndex.jsp?currPage=";
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