<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일명: isLogin.jsp --%>

<%
	//글쓰기 페이지 진입 전 로그인 여부 확인
	//로그인은 세션영역
/*
	해당 페이지처럼 JSP코드를 포함한 파일을 include할 때는 
	지시어를 통해 include하는 것이 좋다.
	액션 태그를 사용하는 경우 먼저 컴파일 된 후 페이지에 삽입되므로 순서에 의한 에러발생 가능성이 있음.
*/
	if(session.getAttribute("USER_ID")==null){
%>
	<script>
		/*
			만약 로그인 되지 않았다면 로그인 페이지로 이동시킨다.
		*/
		alert("로그인 후 이용해주십시오.");
		location.href="../06Session/Login.jsp";
	</script>
<%
		//만약 JSP코드가 있다면 script영역이 실행되지 않는다.(우선순위 문제)
		//반드시 return을 추가한다.
		return;
	}
%>