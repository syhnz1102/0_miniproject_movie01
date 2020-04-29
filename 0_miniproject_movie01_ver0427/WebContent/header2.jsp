
<%-- 
	
	섹션관리용 jsp파일! : 로그아웃누르면 확실히 로그아웃 되게
	모든 다른파일에 	< %@include file="header.jsp" % >	를 넣어라 (<%,%>띄어쓰기 붙여서)
	그럼 여기있는 내용이 해당파일에 전부 들어간다.
	단순히 섹션관리용 말고 모든페이지에 공용으로 들어가는 명령어들을 한번에 넣을 수있음.
	
	로그아웃 확실히 하려면
	0.헤더파일을 만들고 그안에
	1.ldto(로그인정보)가 empty일 때 index페이지로 돌아가게 한다.
		<c:choose>
			<c:when test="${empty ldto}">
				<script type="text/javascript">
					location.href="index.jsp"
				</script>
			</c:when>
		</c:choose>
	2.캐쉬지우는 코드 네줄을 넣어준다
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
		response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
		response.setDateHeader("Expires", 0L); // Do not cache in proxy server
	3.로그아웃이 확실히 되기 원하는  모든페이지에 헤더파일을 임포트시킨다
		< %@include file="header.jsp" % >
		
	디자인용 header파일은 따로 만들어보자
--%>

<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.Choose"%> ------------------------------------%>
<%-- <%@page import="com.hk.dtos.LoginDto"%> ------------------------------------%>
<%
//캐쉬지우는 코드//
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<c:choose>
	<c:when test="${empty ldto}">
		<script type="text/javascript">
 			location.href="index.jsp";
		</script> 
	</c:when>
</c:choose>

</body>
</html>