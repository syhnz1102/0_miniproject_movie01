<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자메인</h1>
<div>${sessionScope.ldto.m_id}님 반갑습니다.
	(등급:${sessionScope.ldto.m_role eq 'ADMIN'?'관리자 ':'일반회원?-오류'})
</div>
<ul>
<!-- 	그냥 상태조회 + 등급변경 + 번호매기기 = 한번에-->
	<li><a href="MUserController.do?command=allUserList">회원정보조회</a></li>
	
<!-- 	회원 답글 관리 : 별점이 매겨져있는 목록만 보이게-->
	<li><a href="MUserController.do?command=userReplyCare">영화별 답글 관리</a></li>

	<li><a href="MUserController.do?command=logout">로그아웃</a></li>
</ul>




</body>
</html>