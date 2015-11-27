<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="login">
		用户名:<input type="text" name="username" /><br/>
		密码:<input type="password" name="password"><br/>
		<input type="submit" value="登录">
		
	</form>
	<%-- <s:form action="login" enctype="multipart/form-data" method="post">
		<s:textfield name="username" key="user"></s:textfield>
		<s:textfield name="password" key="password"></s:textfield>
		<s:submit key="login"></s:submit>
	</s:form>	
	
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	 --%>
</body>
</html>