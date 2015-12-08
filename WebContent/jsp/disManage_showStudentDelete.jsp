<%@page import="hibernate.StuScore"%>
<%@page import="hibernate.util.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String stuNum = request.getParameter("stuNum");
		
		List listID = HibernateUtil.disManage_getStudentId(stuNum);
		if(!listID.isEmpty() && listID.size()>0){
			for(int i = 0;i<listID.size();i++){
				StuScore stuScore = (StuScore)listID.get(i);
				HibernateUtil.disManage_deleteStudent(stuScore);
			}
		} 
	%>
	<jsp:forward page="disManage_showStudentIndex.jsp"></jsp:forward>
</body>
</html>