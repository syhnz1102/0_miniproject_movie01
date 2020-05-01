<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 만약 로그인 이미 했으면 여기로 가도록 -->
<c:choose>
	<c:when test="${not empty ldto}">
		<script type="text/javascript">
 			location.href="user_main.jsp";
		</script> 
	</c:when>
</c:choose>

</body>
</html>