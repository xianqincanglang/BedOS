<%@page import="hibernate.DormScore"%>
<%@page import="hibernate.util.HibernateUtil"%>
<%@page import="hibernate.DormScoreId"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String floorNum = request.getParameter("floorNum");
		String dormNum = request.getParameter("dormNum");
		DormScoreId dormScoreId = new DormScoreId(floorNum,dormNum);
		
		List listID = HibernateUtil.disManage_getDormId(dormScoreId);
		if(!listID.isEmpty() && listID.size()>0){
			for(int i = 0;i<listID.size();i++){
				DormScore dormScore = (DormScore)listID.get(i);
				HibernateUtil.disManage_deleteDorm(dormScore);
			}
		} 
	%>
	<jsp:forward page="disManage_showDormIndex.jsp"></jsp:forward>
</body>
</html>