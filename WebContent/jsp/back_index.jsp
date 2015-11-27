<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="css/back_index.css" type="text/css" rel="stylesheet"/>
		<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
		<script type="text/javascript" src="js/back_index_left.js"></script>
	</head>
	<body>
		<div class="body">
			<div class="back_index_top">
					<jsp:include page="back_index_top.jsp"></jsp:include>
			</div>
			<div class="back_index_middle">
				<div class="left"><jsp:include page="back_index_left.jsp"></jsp:include></div>
				<div class="right"><jsp:include page="back_index_right.jsp"></jsp:include></div>
			</div>	
		</div>
	</body>
</html>