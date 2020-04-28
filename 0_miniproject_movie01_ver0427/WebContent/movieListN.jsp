<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>검색결과</h1>
<table id="result2" border="1">
	<tr>
		<th>영화명</th>
	</tr>
	<c:if test="${not empty sb.items}">
		<c:forEach items="${sb.items}" var="movielist">
			<tr>
				<td><a href="KobisController.do?command=movieDetail&movieNm="+${movielist.movieNm}>
					<c:out value="${movielist.title}"/>
				</a></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</body>
</html>