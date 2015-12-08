<%@page import="hibernate.Notice"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.util.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="/BedOS/css/noticeManage_showNotice.css">
</head>
<body>
	<div>
		<div class="showNoticeTop">
			<p>公告管理->公告记录</p>
		</div>
		<div>
			
			<table class="notice_table" cellspacing="0px" align="center">
				<tr class="table_header">
					<th>公告标题</th>
					<th>公告内容</th>
					<th>公告开始日期</th>
					<th>公告结束日期</th>
					<th>操作</th>
					<th>操作</th>
				<tr>
			
			<%
				String currPage = request.getParameter("currPage");
				int iCurrPage = 1;	//当前所在页的页数
				int pages = 1;	//页数
				int totalRecordCount = 0;	//总记录数目
				int perPageCount = 5;		//每一页的数目
				totalRecordCount = HibernateUtil.noticeManage_findNoticeCount();
				
				
				
				pages = (totalRecordCount-1)/perPageCount+1;
				
				if(pages == 0){
					pages = 1;
				}
				
				if(currPage != null && !currPage.equalsIgnoreCase("")){
					iCurrPage = Integer.parseInt(currPage);
				}
				List noticeInfo = HibernateUtil.noticeManage_findNoticeInfo((iCurrPage-1)*perPageCount, perPageCount);
				
				
				if(noticeInfo.isEmpty()){
					out.println("暂无消息");
				}
				
				if(!noticeInfo.isEmpty() && noticeInfo.size()>0){
					for(int i = 0;i<noticeInfo.size();i++){
						Notice notice = (Notice)noticeInfo.get(i);
						
						
						%>
						<tr>
							<td><%=notice.getTitle() %></td>
							<td><%=notice.getContent() %></td>
							<td><%=notice.getStartDate() %></td>
							<td><%=notice.getEndDate() %></td>
							<td><a>修改</a></td>
							<td><a>删除</a></td>
						</tr>
			<%			
					}
				}
			%>
			</table>
			<%
				if(perPageCount<totalRecordCount){
					String href = "&nbsp;&nbsp;<a href='noticeManage_showNoticeIndex.jsp?currPage=";
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