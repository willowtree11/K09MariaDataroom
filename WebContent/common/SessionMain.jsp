<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 유지시간 확인하기</h2>
	<p>
		<%=session.getMaxInactiveInterval() %>
	</p>
	<h2>세션 유지시간 session내장객체로 설정하기</h2>
	<%
		/*
			방법1: web.xml에서 설정하기
		*/
	%>
</body>
</html>